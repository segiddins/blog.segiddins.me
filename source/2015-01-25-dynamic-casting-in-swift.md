---
title: Dynamic Casting in Swift
date: 2015-01-25 11:30 PST
tags:
---

We’ve been spoiled by Objective-C’s runtime flexibility. Its tendency for dynamic dispatch, as well as a very powerful runtime (that’s exposed via both Objective-C and C APIs) has meant that dealing with arbitrary data was an easy task. You just check `[object isKindOfClass:klass]` and accept `id` parameters and everything works as expected.

In Swift, however, we have a statically-typed language where the compiler really needs us to know types at compile-time, rather than runtime. In general, this helps us write safer code than was possible in Objective-C, but makes dealing with data this is _fundamentally untyped_ a real challenge. Swift has two operators that help to bridge the gap between static safety and the power of dynamicism: `as` and `as?`.

<!-- more -->

It might help to pretend that those two operators are functions, so here are their function signatures:

```swift
func as<T, U>(lhs: T, rhs: U.Type) -> U

func as?<T, U>(lhs: T, rhs: U.Type) -> U?
```

The first operator, `as`, lets us give an object of type `T` and tell the compiler, 'no, at runtime this _really_ will be a `U`'. This is really handy when dealing with Objective-C methods that return `id` or Swift functions that return `AnyObject`, but the programmer knows at compile time what their _real_ type will be.

The second operator, `as?`, is probably the more interesting of the two. `as?` lets us write _dynamic, conditional_ code that is truly native to the static Swift world. `as?` allows us to tell the compiler, ‘I don’t really know what this object will be at runtime, but if it happens to be of type `U`, I want it as a type-safe object of that type. Otherwise, I’ll take `nil`.’ This is super powerful. Imagine that we’re writing an application that consumes a REST API. The data that API returns is _fundamentally untyped_ since the compiler has absolutely no visibility into the type of data it can return. We’re interested in pulling out a `count` property from that API response, but the `count` property on our model needs to be of type `Int` -- how do we bridge that gap? Enter `as?`. We want to take the response’s `count` as an `Int`, but only if it really _is_ an `Int`:

```swift
let count = json["count"] as? Int // count: Int?
```

We can even define some syntactic sugar on top of this type verification:

```swift
func id<U>(object: AnyObject) -> U? {
  if let typed = object as? U {
    return typed
  }
  return nil
}
```

Now, we can just write:

```swift
let count = id(json["count"]) as Int?
```

OK, that last example might not look like a huge improvement, but coupled with Swift's powerful type inference, you can 'magically' `type` objects at runtime with a single function call.

For example, the `id` function can be used when passing the extracted value into a typed function:

```swift
func doubleMaybe(i: Int?) -> Int? {
    if let i = i {
        return i * 2
    }
    return nil
}

// Note that we don't have to explicitly cast to Int?
let doubleCount2 = doubleMaybe(id(json["count"]))
```

This gives us the best of both worlds: the ability to dynamically handle data that is out of our control, and being able to do so in a convenient way that is perfectly type-safe.

_nota bene_: So, we have these two operators that look to be _basically_ the same -- they only differ by one letter, after all. What’s the difference between them? Turns out, the difference is _massive_. If we do `x as? U`, our program (presuming it compiles) will _never_ crash -- you’ll get back `nil` if `x` is not a subtype of `U`. On the other hand, `x as U?` (or `x as U`) will cause our program to segfault if `x` is anything other than a subtype of `U?`(or `U`).
