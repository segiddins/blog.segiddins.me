---
title: Residency Update
date: 2024-03-29 12:00 PDT
tags:
---

Welcome to my eighth update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I wrapped up the pure-Ruby proto implementation.

<!-- more -->

## Plain Ruby Protos

I landed a [massive PR](https://github.com/segiddins/protobug/pull/1) that basically makes the implementation compliant! There are only a few failing test cases, and they relate to Ruby's JSON parser being too lenient. I'm calling this project wrapped for now.
