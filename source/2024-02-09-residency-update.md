---
title: Residency Update
date: 2024-02-09 12:00 PST
tags:
---

Welcome to my third update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week, I wrapped up the event logging feature, and got the gem research tool to a point where it's useful for me.

<!-- more -->

## Event Logging

I'm planning to roll out event logging later today! It'll be a soft launch, as I want to make sure that the data is being collected correctly before we start advertising the feature to users.

I'm excited to build on this foundation and add more event types in the future.

## Gem Research Tool

What a fun rabbit hole! I ran out of disk space a few times, OOM'd a 96GB RAM machine, and cursed a fair amount.
After concluding that doing all the ingestion in Ruby (and using activerecord) was too slow, I wrote a golang script to do it for me.
Then I decided to implement it in Rust, so I could easily call it from ruby, but that was slower than go.
So I went back to go, got things fast enough, and then ran out of disk space and RAM a few more times.
If I happen to be awake, https://rubygems-research.folk-dinosaur.ts.net should let you browse around (the app is still hosted on my local machine, as attached block storage large enough to fit the entire corpus of gems is expensive on cloud providers).
This should be pushed up to GitHub soon, and I'll probably publish it as a gem, because why not.
The team is also excited to use this as a playground for features that we want to expose to the public eventually, like browsing gem contents and being able to query random things (like how many empty files are packed into gems: over 18 million, or how many libxml binaries are published: querying this is too slow and I'm lazy, but I have the 180 million row table to make it possible!)

## Other Stuff

My dad has been in town this week after we went to a concert in Santa Monica last weekend, so this update is a bit short. I tried to focus on those two big things, and next week I should be able to start turning my attention to something new!
