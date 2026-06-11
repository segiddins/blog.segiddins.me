---
title: Residency Update
date: 2024-05-03 12:00 PDT
tags:
---

Welcome to my update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I spent a bunch of time refactoring the Sigstore implementation, and banged my head against timestamping verification, which is mostly implemented but not yet working.

<!-- more -->

## Sigstore

Discovered some more jruby issues
https://github.com/jruby/jruby-openssl/issues/299
https://github.com/jruby/jruby-openssl/issues/298
https://github.com/jruby/jruby/issues/8216

made a PR to ruby/openssl to add tbs certificate support https://github.com/ruby/openssl/pull/753

significantly refactored the usage of x509 extensions to properly parse them, vs using only debug strings

https://github.com/segiddins/sigstore-ruby/pull/9

started preparations for donating the implementation to the sigstore org

https://github.com/segiddins/sigstore-ruby/pull/2

fixed tbs der implementation to work on linux by directly manipulating ASN.1

https://github.com/segiddins/sigstore-ruby/commit/656d992fa816613fd9936f53ce30972c2f2f4957

fixed support for running on ruby 3.0

started work on timestamp verification, but it's not working yet because of some issues with the ruby openssl bindings

## Protobug

Finished support for running on jruby

https://github.com/segiddins/protobug/pull/2

also got truffleruby working
