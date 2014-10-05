---
title: Why I Never Write Singletons
date: 2014-10-05 17:38 EDT
tags:
---

There's been a rash of discussion about singleton use on Twitter in the past few days, largely between [@indragie](https://twitter.com/indragie) and [@mattt](https://twitter.com/mattt). I want to throw my 2¢ into the ring, squarely on the _anti-_singeton side.

<!-- more -->

I can't stand the use of _explicit_ singletons because they make class dependency graphs hidden inside their implementations, rather than explicit via publically declared properties. In doing so, any class becomes allowed to pull in any other part of your application's stack and use it, meaning classes will easily snake their way into all corners of your system. Take my word for it: that means __hell__.

Sure, your application might not ever create more than one instance of a given class _right now_, and sure, that instance might effectively share a lifetime in common with your application as a whole. But are those things you ever want to depend upon? ___NO___. Use dependency injection and pass instances along to the objects that use them. Don't do that just because it makes testing easier (it does) or because it makes your headers more descriptive (it really and truly does).

Instead, avoid explicit singletons because they make your codebase _incredibly brittle_. They couple your interaction and instantiation models in such a way that your application flow becomes assumed all over the place. They also set in stone conditions that _might_ be presently true, and ensure that it'll be a nightmare for them to ever change.

---

Now, back to the title of this post: why I never _write_ singletons. Singletons are abound in the Cocoa world, but that doesn't mean we have to treat them as singletons (everything I wrote above holds for `UIApplication`, `NSFileManager`, `NSNotificationCenter`, `NSPersistantStore`, etc.). 

I don't ever write shared global accessor methods for my objects (any more), since it tempts me to presume that some random component of my application is perfectly justified in accessing a `sharedInstance` of whatever class. That temptation is very real, but it's a temptation that, with experience, I know is _never_ worth it.

Global state is inherent in the application programming environment we use, right down to the hardware, but we never need to presume that there's a 'singleton' of anything. Imagine if the authors of schedulers said 'oh, there will _never_ be more than one core for processes to execute on'. Probably sounded reasonable at some point, but it, of course, turned out to be a completely invalid assumption. Just create instances where appropriate and pass them along.

This is definitely a case where `sharing != caring`.