---
title: Residency Update
date: 2024-04-19 12:00 PDT
tags:
---

Welcome to my eleventh update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I attending the Linux Foundation's Open Source Summit North America 2024, and spent a whole bunch of time talking to my peers about packaging ecosystem security.

<!-- more -->

## Trusted publisher APIs

prep work: store api key scopes in jsonb column (to make it easier to add new ones going forward)

https://github.com/rubygems/rubygems.org/pull/4610

## RubyGems.org

Preventing yanking of gems that are either too old or have too many downloads

Landed disabling loading YAML aliases in RubyGems.org
https://github.com/rubygems/rubygems.org/commit/8fc65dbdeedffedc337b0abc7f1b67818aec5941

Landed user avatar proxying https://github.com/rubygems/rubygems.org/commit/b8d842c4f0f6f5afe93bb51c5d7660a5c504b5f7

## Sigstore Plan

- Be able to verify a signature given a sigstore bundle
- Be able to securely update the sigstore trust root (i.e. a working TUF client)
- Use github actions to create a sigstore bundle for a built gem
- Create a new gem push endpoint that takes both a gem and a sigstore bundle
    - Only usable from trusted publishing
    - RubyGems.org will verify the signature before accepting the gem
    - Only bundles signed by the trusted publisher will be accepted
- Upload sigstore bundles to a new directory on S3
- Add a piece of metadata on the /info endpoint that declares that the gem has an associated sigstore bundle
- Bundler downloads the sigstore bundle and verifies the signature before installing the gem
- RubyGems downloads the sigstore bundle and verifies the signature before installing the gem
- RubyGems.org exposes trusted publishers configured for a gem via API

Future work:

- Allow users to configure their own trust policies
- Allow users to configure their own trust roots
- TOFU for known claims
