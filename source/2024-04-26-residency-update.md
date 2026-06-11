---
title: Residency Update
date: 2024-04-26 12:00 PDT
tags:
---

Welcome to my update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I focused on implementing SCT verification in Sigstore, and made some improvements to the Protobug gem (which is now released!).

<!-- more -->

## Sigstore

switched to plain-ruby protos

https://github.com/segiddins/sigstore-ruby/pull/1

contributed testing improvements to the nascent TUF conformance test suite

https://github.com/jku/tuf-conformance/pull/16

automated updating the vendored trust root

https://github.com/segiddins/sigstore-ruby/commit/cc0d44c778bf8764a4c906bc8540f40ab79755cf

big one: sct verification

https://github.com/segiddins/sigstore-ruby/commit/9c8a6b389c3f72b7c20ffbbb9d5c37a0a2243837

## Protobug

set up automated releases

added support for running on truffleruby and jruby
https://github.com/segiddins/protobug/commit/20290313f4452a70214acf46a6bf2191c9bdf7a3

## RubyGems.org

enabled yjit for RubyGems.org

https://github.com/rubygems/rubygems.org/pull/4639

[improved average latency by 20%](https://x.com/oceanicpanda/status/1783042354649428149)

updated to ruby 3.3.1 to keep up with the latest security patches

https://github.com/rubygems/rubygems.org/pull/4638

landed storing api key scopes in array column https://github.com/rubygems/rubygems.org/pull/4610
