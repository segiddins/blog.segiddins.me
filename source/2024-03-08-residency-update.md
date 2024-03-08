---
title: Residency Update
date: 2024-03-08 11:00 PST
tags:
---

Welcome to my fifth update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

The past two weeks I have been heads-down on a pure-ruby Sigstore implementation, which has a lot of moving parts.
I hope to outline some of the interesting challenges I've encountered along the way, either in this update or in another venue.

<!-- more -->

## Sigstore Verification

This is my big project for the month. (At least a month, it's a real big one.)

We have a working implementation of `verify` and `verify-bundle` in the [sigstore verifier](https://github.com/segiddins/sigstore-cosign-verify) that is passing _most_ of the non-signing conformance tests. I still have to implement DSSE envelope verification and CT log verification.

As a part of this, there is also a functional TUF client, that is in desparate need of testing.

I have verified that the implementation works on Ruby 3.1+ (3.0 will be supported easily as well) and TruffleRuby, but there are a [pair of](https://github.com/jruby/jruby/issues/8146) [JRuby issues](https://github.com/jruby/jruby-openssl/issues/292) that prevent the verifier from working there.

Next week, I plan to continue my valiant effort to write sufficient test coverage for the verifier, and to implement the missing verification steps.

## Plain Ruby Protos

As I hinted last update, as a part of the sigstore work I've implemented a pure [Ruby protobuf runtime & compiler](https://github.com/segiddins/protobug).
This library is meant to be easily embeddable, enabling the sigstore verifier to vendor built Sigstore protos
and use them without needing to take a dependency on a precompiled protobuf gem.

I'm still in the process of fleshing out the functionality, but over half of the protobuf conformance tests are now passing!

I've spent so much time dealing with binary data in Ruby lately, I feel like there's a good talk to be written about `pack` and `unpack` and binary strings and integer bit manipulation.

## Fixing a common source of ONCALL pages

The PR is still a work in progress, but I [fixed the most common source of ONCALL pages](https://github.com/rubygems/rubygems.org/pull/4512) for the RubyGems.org team. This was a good 6 hours of debugging to even reproduce and narrow down the root cause, but it turns out that swapping the order of the two operands on an `ON` clause in a join completely changes the query plan that gets used, getting postgres to use the index on the joined table instead of doing a full table scan. It looks to be on the order of a 1500x improvement in query time, for the query that the DB was spending the most time on. Wild.
