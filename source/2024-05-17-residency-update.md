---
title: Residency Update
date: 2024-05-17 12:00 PDT
tags:
---

Welcome to my update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I was at Ruby Kaigi, and gave a talk about Marshal!

<!-- more -->

## Ruby Kaigi

This was my first Ruby Kaigi, and boy was it quite an experience. Coming right off the heels of RailsConf, it was strange to fly home, get four hours of sleep, and then spend more time sleeping on the plane on the way to Japan, but such is conference speaker life.

My first day in Okinawa, I attended the Ruby Developer in-person meeting. Thanks to some help from tenderlove, I got a long-awaited change merged into Zlib that should help RubyGems and RubyGems.org be able to read gem files much more efficiently. I then gave a talk in the second talk slot on the first day of the conference, which was a bit earlier than is my preference, and I think it went rather well. It was a talk about the history of the Marshal file format, an explanation of how it works, what's good about it, what's bad, what we can learn from it, sort of moving forward, evaluating different binary file formats. I think it was well received, but it's always hard to tell when there's no Q&A after the talk.

After that, I spent some time talking to a bunch of different Ruby committers. I caught up with Charles from JRuby to discuss ways I could use different cryptographic primitives in JRuby instead of the JRuby OpenSSL gem for my sigstore work. Talked a bit with Jeremy about performance and reducing allocations. Also got to spend a bunch of time with the Shopifolks discussing pretty much everything because they're working on pretty much everything across the ecosystem. Not too much development happened this week, but it was great to spend time with Ruby committers from around the world, and I'm really excited to collaborate and build off of the things we talked about.

Unfortunately, I don't think I'll be able to attend Kaigi next year since it was scheduled for over Passover, which is a bit of a disappointment since it was a great event and one I benefited a lot from attending.

## rubygems-research

Thanks to a bunch of help from Colby, I managed to get RubyGems research deployed on the new Kubernetes cluster that André helped me set up last week. It started ingesting gems, and I think we're ready to use it again in the new setup after we tore down the old installation that was horrifically insecure. Stay tuned here once I have time to start developing some new features and to be able to start exposing stuff such as code search and faceted search for files or gem versions, et cetera.

## protobug

started optimizing performance under yjit

https://github.com/segiddins/protobug/pull/23
https://github.com/segiddins/protobug/pull/24
https://github.com/segiddins/protobug/pull/25
