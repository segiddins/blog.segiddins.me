---
title: Residency Update
date: 2024-03-22 12:00 PDT
tags:
---

Welcome to my seventh update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

The past week I was mostly on airplanes and working on sigstore & protobufs.

<!-- more -->

## Sigstore Verification

What is there to say?

## TUF Client

As I've mentioned before, this is also a part of the sigstore work. I've been working on a TUF client in Ruby, which is a bit of a challenge because TUF is so loosely defined and there is no conformance test suite to implement againt. Testing an implementation like this is by far the hardest part, and I sort of have run out of steam. There's a nascent conformance test repo I've [started contributing to](https://github.com/jku/tuf-conformance/pull/13), but it needs some meaty test cases to be added before it becomes truly useful. My plan is to implement the specs against the reference TUF client, and presume whatever it does in various scenarios is correct, because that spec is dense.

## Plain Ruby Protos

Continued progress here.
