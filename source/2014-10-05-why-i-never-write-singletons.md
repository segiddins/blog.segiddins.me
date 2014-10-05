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