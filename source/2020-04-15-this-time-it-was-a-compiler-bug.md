---
title: This time, it was a compiler bug
date: 2020-04-15 18:00 PDT
tags:
---

I write software for a living. At least, I pretend to. Most of the time, my job is building & running (& yes, occasionally fixing) software other people have written.

One of the aphorisms of software development is that "it's never a compiler error". Sure, it's not _never_ a compiler error, since compilers are written by humans and therefore are as flawed as any other piece of software. But it's _never_ a compiler error, in the sense that, when you find a bug, the probability of it being caused by a compiler error exists on a set of measure zero.

Well, today I hit the jackpot. This time, it really was a compiler bug.

Almost.

<!-- more -->

At work, we're fortunate to have a bunch of tests.
I'm unfortunate in that my job is essentially to make sure we run those tests.

A (somewhat) common pattern we have is to have test cases initialize a test fixture at the start of each test method,
and at the end `nil` out the fixture and make sure it was deallocated. Makes sense, right? We want to make sure we're not leaking objects over into the next test.

That pattern looks a little something like this:

```objc
@import Foundation;
@import XCTest;

@interface TestFixture : NSObject
+ (instancetype)testFixtureForCountryCode:(NSString *)code;
- (instancetype)initWithCountryCode:(NSString *)code;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) BOOL otherParam;
- (void)tearDown;
@end

@implementation TestFixture
+ (instancetype)testFixtureForCountryCode:(NSString *)code;
{
    return [[self alloc] initWithCountryCode:code];
}
- (instancetype)initWithCountryCode:(NSString *)code;
{
    return [self initWithCountryCode:code otherParam:YES];
}
- (instancetype)initWithCountryCode:(NSString *)code otherParam:(BOOL)otherParam;
{
    self = [super init];
    _code = code;
    _otherParam = otherParam;
    return self;
}
- (void)tearDown {
    // do stuff
}
- (void)dealloc;
{
    [self tearDown];
}
@end

@interface A : XCTestCase
@end
@implementation A
@end

@interface Tests : XCTestCase
@property (nonatomic, strong) TestFixture *testFixture;
@end

@implementation Tests
- (void)setUp;
{
    [super setUp];
    self.testFixture = [TestFixture testFixtureForCountryCode:@"en_US"];
}

- (void)tearDown;
{
    [self.testFixture tearDown];

    __weak __typeof__(self.testFixture) weakTestFixture = self.testFixture;
    self.testFixture = nil;
    XCTAssertNil(weakTestFixture, @"Expected thing to be nil");

    [super tearDown];
}

- (void)test_empty {}
- (void)test_empty2 {}
@end
```

We've had tests that have been doing that for years. They've been passing. Until now.
When we've been switching to [Bazel](https://bazel.build/).

After months of painstaking work, we've got our apps building, and most of our tests building,
and almost most of them passing.

Except for some tests that use test fixtures. And assert that those test fixtures get deallocated.
And they passed in Xcode. And failed when run via Bazel.

Queue three days of chasing my tail, adding hundreds of random print statements to chase down these bugs.
Yesterday, I fixed a bug around using `+[NSHashTable weakObjectsHashTable]` (turns out, you __really__ want `NSMapTableObjectPointerPersonality` instead of `NSPointerFunctionsObjectPersonality` when you're potentially storing multiple proxy objects that compare equal and want them all to receive delegate callbacks. Anyways.)
I thought that was going to be the worst of it.

It, of course, wasn't, because that bug on its own doesn't warrant a blog post.

The code above was failing in Bazel. It passed when I used `alloc init` directly, instead of the factory class method to create the test fixture.
It passed when I moved the allocation and assignment into an `@autorelease` block.
It passed the smell test when I popped the binary into Hopper and started reading decompiled methods.

But it failed as written. And I was determined to get to the bottom of things.

Guessing that something was maybe up around autoreleases, I looked at the dissassembly, instead of Hopper's (amazing) decompiler view.
I remembered, thanks to an old [Mike Ash article](https://www.mikeash.com/pyblog/friday-qa-2014-05-09-when-an-autorelease-isnt.html) from back in the day,
that the modern ObjC runtime does some (extra) magic around autoreleasing values.

The (working) code ends up compiling to something like this in Xcode:

```objc
+(void *)testFixtureForCountryCode:(void *)arg2 {
    var_18 = 0x0;
    objc_storeStrong(&var_18, arg2);
    var_30 = [[self alloc] initWithCountryCode:var_18];
    objc_storeStrong(&var_18, 0x0);
    rax = [var_30 autorelease];
    return rax;
}
```

whereas from Bazel it's getting compiled down to:

```objc
/* @class TestFixture */
+(void *)testFixtureForCountryCode:(void *)arg2 {
    var_8 = **___stack_chk_guard;
    var_10 = 0x0;
    objc_storeStrong(&var_10, arg2);
    var_28 = [[self alloc] initWithCountryCode:var_10];
    objc_storeStrong(&var_10, 0x0);
    var_30 = [var_28 autorelease];
    if (**___stack_chk_guard == var_8) {
            rax = var_30;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}
```

`___stack_chk_guard`? `__stack_chk_fail`? What is that stuff? Initially, I ignored them since they seemed inconsequential to the program's control flow.

But, going back to that discussion of `objc_retainAutoreleaseReturnValue` and `objc_autoreleaseReturnValue`, and keeping in the back of my head that they inspected the calling code's following instructions, I started hunting for differences in the `clang` invocations between Xcode and Bazel.

After a lot of sorting, I had a culprit. `-fstack-protector`. It seemed so innocent. Protecting the stack sounds good! The [clang command line reference](https://clang.llvm.org/docs/ClangCommandLineReference.html) only says that `-fstack-protector` will `enable stack protectors for some functions vulnerable to stack smashing`. That doesn't at all sound destructive!

However, due to the way the stack protector works (by adding instructions at the start and end of function), they can interfere with a call to `objc_autoreleaseReturnValue` being able to see it's matching call to `objc_retainAutoreleaseReturnValue`, and then `[object autorelease]` will actually have to do an autorelease. Which means that the object will go into the autoreleasepool. And it won't be deallocated until that pool drains. And `XCTestCase`'s `-setUp` and `-tearDown` methods happen inside the same autoreleasepool.

Boom. Bug.

Object here really _were_ living longer under Bazel than they were in Xcode, since autoreleased objects were actually being autoreleased (and subsequently retained), instead of ending up skipping both the autorelease and the retain (`init` methods return already-retained objects).

Now that we're all caught up and fully understand the bug (and have spent enough time saying "what the..." to an empty room to calm down), there are a couple of obvious solutions. The first is to, you know, write correct code. If we want to test that objects aren't participating in an accidental retain cycle, we need to make sure that their creation happens inside an autoreleasepool that's drained by the desired end of that objects lifetime. Moving the `self.testFixture = ...` initialization & assignment inside of an `@autoreleasepool` block will do just that for us.
And the second is to make our migration easier, by not passing `-fstack-protector` in the new build system, when it wasn't passed in the old build system. (Or, in the case of bazel, to pass `--per_file_copt=".*\.m","@-fno-stack-protector"` on the command line, since there's no way to get it to stop passing `-fstack-protector` and there's no other way to sneak my `-fno-` flag in after Bazel's flag gets added.)

What made this bug so fun (and infuriating) to investigate was that it sat at the intersection of a bunch of different moving pieces.
Our code was technically wrong (relying on performance optimizations in the runtime isn't especially safe).
Bazel did something incredibly unexpected (passing `-fstack-protector` when I didn't ask it to).
The Objective-C runtime has a performance optimization that does more than optimize (this is valid code under ARC, and yet it's behavior is different from what ARC's semantics say it should be).
And, finally, clang allows me to pass a compiler option that changes observable behavior, without documenting that it can do more than catch a small set of bugs.

So, they say that it's never a compiler bug. And in this case, it might not be a compiler bug.
But it sure is close to one.