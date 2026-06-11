---
title: Residency Update
date: 2024-04-12 12:00 PDT
tags:
---

Welcome to my thenth update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I fixed some DoS vectors in RubyGems.org.

<!-- more -->

## Documentation for the compact index

I spent a few hours helping Martin write down some [authoritative documentation for the compact index API](https://guides.rubygems.org/rubygems-org-compact-index-api/), which should help implementers of other RubyGems package repositories support the format, which comes with some big security benefits (largely, the ability to verify gem checksums on download & install).

## Re-introducing avatars to RubyGems.org

I spent a few hours working on a [PR to re-introduce avatars to RubyGems.org](https://github.com/rubygems/rubygems.org/pull/4603). This is a feature that was removed a few months ago due to some privacy concerns, but switching to serving avatars via a secure reverse proxy should sufficiently protect users email addresses.

This should hopefully get rid of all the red gem triangles showing up on every gem page, and make it easier to see at a glance who the owners of gems are.

## Disabling YAML aliases in RubyGems.org

There was a theoretical DoS vector in the gem upload endpoint, whereby a specially crafted gemspec being pushed could cause the application server to run out of memory. [Disabling resolution of YAML aliases](https://github.com/rubygems/rubygems.org/pull/4603) fixes that vector.

## Limiting uploaded gem metadata size

Another theoretical DoS vector, [another patch in RubyGems](https://github.com/rubygems/rubygems/pull/7568). This time, the vulnerability was in the process of reading the metadata of a pushed gem, where the server could be forced to allocate roughly 1000x as much memory as the size of the uploaded gemspec (which is already limited to 500M). Since the servers don't have half a terabyte of RAM available, that could make things go boom.
This patch puts an upper bound on how much RubyGems will un-gzip from the uploaded gemspec, which should prevent the server from running out of memory.
Full credit for this one goes to me, as I thought up the vulnerability, because what else am I going to do in my free time.

## Upcoming

I will be in Seattle this upcoming week for Open Source Summit North America 2024! Come say hi and talk about open source & package security with me!
