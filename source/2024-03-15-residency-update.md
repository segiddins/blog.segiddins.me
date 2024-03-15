---
title: Residency Update
date: 2024-03-15 8:00 PDT
tags:
---

Welcome to my sixth update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

<!-- more -->

## Fixing a common source of ONCALL pages

As I mentioned [last week](https://blog.segiddins.me/2024/03/08/residency-update/#fixing-a-common-source-of-oncall-pages), I had found that by far our most expensive query was for reverse dependencies of a gem.
I shipped my fix last weekend, and it sure made a difference.

![alt text](/images/2024-03-15-residency-update/reverse_dependencies_p75.png)

## Fixing N+1 Queries

Unfortunately, most of my week was spent on RubyGems.org operational issues.
I had noticed that many of our slowest endpoints had a very large number of queries being executed,
and I spent a bunch of time digging into root causes in DataDog to figure out why.
It turned out we had a spate of N+1 queries, and heavy automated usage of the site's API
(along with scraping of the HTML pages) caused heavy load on those endpoints.

As a result, our postgres database got overloaded several times during the week, leading to multiple
members of the oncall rotation (including yours truly) to be paged over and over.
It wasn't fun.

Fortunately, the Rails ecosystem has several tools to help narrow in on N+1 queries!
After slapping `strict_loading` on several queries and adding in `includes` and `preload`
calls, I brought out the big guns to find the remaining offenders.

Setting up the wonderful [prosopite](https://rubygems.org/gems/prosopite) gem led to [several more fixes](https://github.com/rubygems/rubygems.org/pull/4525).
After a hurried emergency deploy on Thursday afternoon, we saw an immediate improvement
across the board and the site once again appears to be stable!

![alt text](/images/2024-03-15-residency-update/image.png)

![alt text](/images/2024-03-15-residency-update/image-1.png)

Top requests over the past 24 hours

![alt text](/images/2024-03-15-residency-update/image-2.png)

Average time spent per request on Api::V1::VersionsController#show

![alt text](/images/2024-03-15-residency-update/image-3.png)

Problematic N+1 query (getting gem version download count)

![alt text](/images/2024-03-15-residency-update/image-4.png)

Finally, it appears that there are some users who are scraping every gem & version page/endpoint.
We would strongly reccomend that researchers & other automated platforms use the data dumps we provide if possible,
and make decisions on what endpoints to call to refresh data based upon changes in the `/versions` file, which is statically generated
and thus causes no load on the rails app or database.

## Sigstore

Few updates this week, due to the aformentioned operational work.
I did make progress on protobuf compliance, though!
