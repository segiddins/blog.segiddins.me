---
title: Residency Update
date: 2024-04-05 12:00 PDT
tags:
---

Welcome to my ninth update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I dealt with the fallout from the xz/liblzma backdoor. I also took a last minute trip to NY for a funeral, which was honestly more exhausting than firefighting the backdoor.

<!-- more -->

## xz/liblzma backdoor

Thanks for ruining my Friday, Saturday, & Sunday, world.
Like every other infosec professional, I spent several days chasing down the impact of the xz backdoor on RubyGems and the Ruby ecosystem writ large.
The major product of those dozens of hours of work was a [blog post](https://blog.rubygems.org/2024/03/31/rubygems-and-xz.html).

I'm glad that my work building rubygems-research has not been in vain, as it was instrumental in being able to examine the spread of liblzma in the RubyGems ecosystem (essentially non-existant, phew).
