---
title: On Class Methods
date: 2014-09-27 12:00 PDT
tags:
---

Class methods, aka those declared with a `+` in Objective-C, are horribly misused. In most languages I deal with, there is a difference between methods and functions--functions are used either as a map in the mathematical sense, or to imperatively perform an action, while methods are bound to a given 'receiver', and thus the actions they expose are something the *object* they are invoked on performs, and any map they represent is a transformation of that object into one of its properties.

<!-- more -->
---

Often times, I see classes like this:

```objc
@interface API : NSObject
+ (NSURL *)baseURL;
@property (nonatomic) NSURL baseURL;
- (void)get:(NSString *)path callback:(void (^)(NSHTTPURLResponse * response))callback;
@end
```

See that `+baseURL` method? I don't like it. It implies that the URL it returns is somehow an attribute of the `API` *class*, whereas that property clearly belongs on the *instance*, as evidenced by that `@property` declaration. By associating that method with the class, you are breaking the encapsulation of the instance.

---

Another abuse of class methods I've seen is the association of *pure* maps with a class.

```
@interface API : NSObject
+ (NSString *)hashForRequest:(NSURLRequest *)request time:(NSDate *)requestTime; // Presumably OAuth request signing, etc.
@end
```

That `+hashForRequest` method doesn't represent an intrinsic property of an `API` object, nor does it represent some behavior that an `API` object would be able to 'customize'--instead, it takes a set of given inputs, and returns an output that depends only upon those inputs. Sound familiar? It's a function. Therefore, it should be represented in code as a function rather than a method.

(*n.b.* when a subclass would have reason to override the method, then it's probably correct for it to be a method.)

---

At the end of the day, these two misuses of class methods don't necessarily harm a program *as originally written*, but by improperly encapsulating data, behavior, and maps, this code structure becomes brittle. It means that the different pieces of your program aren't where they ought to be (or where I'd expect them to be), which can lead to more detrimental issues in your codebase.