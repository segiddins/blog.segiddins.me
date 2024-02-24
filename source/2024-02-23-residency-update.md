---
title: Residency Update
date: 2024-02-23 21:00 PST
tags:
---

Welcome to my fourth update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.
Sorry for the lack of updates last week, I was overwhelmed with non-engineering stuff and took Friday/the weekend to do other things (like trying to set up a gaming PC).

This week, I wrapped up the event logging feature, and got the gem research tool to a point where it's useful for me.
The past two weeks I shipped the gem research tool to production, and have been working on a pure Ruby implementation of sigstore verification.

<!-- more -->

## rubygems-research

I bit the bullet after running out of disk space multiple times, and am now renting a dedicated server from Hetzner to host the gem research tool.
I have 16 cores, 2x 3TB NVMe SSDs, 128GB of RAM, and it turns out that I was still bandwidth-constrained in ingesting all the gems.
And then I was sqlite write constrained.
Anyways, the rails app is up at [research.rubygems.info](https://research.rubygems.info), and the source code is up on github at [segiddins/rubygems-research](https://github.com/segiddins/rubygems-research). The bulk ingestion code is in the `go-gem-enumerate` directory, and as the name implies is a bunch of hacky go code.

I'm excited to keep hacking on this tool, and have a few ideas for features that I want to add in the future (see the GitHub issues on the repo). Feel free to chime in with more issues, and I'm hoping to explore the space of "medium data" rails apps further (yes, I submitted a talk on this subject to railsconf)! (Especially concerning using sqlite).

## Sigstore Verification

I've been deep in the weeds implementing a pure Ruby sigstore verifier, and it's been a rabbit hole.
I have something working and passing most of the compliance test suite, but I'm not quite ready to push the code up yet.

Along the way, I ended up _also_ writing a pure Ruby TUF client, so I guess we got a two-for-one deal going on here.

A couple things to address:

1. This all being "pure ruby" matters because the end goal is to ship sigstore support in RubyGems itself, which makes native extension dependencies a no go, and also makes relying on user-installed binaries (such as the cosign CLI) undesirable.
2. The [protobuf specs for the sigstore types](https://github.com/sigstore/protobuf-specs) have a bunch of dependencies, so using them won't be possible.
3. The [sigstore conformance suite](https://github.com/sigstore/sigstore-conformance) is pretty nice, but setting it up to run locally required a rake task so I wouldn't lose my mind (`sh "/Users/segiddins/Development/github.com/sigstore/sigstore-conformance/env/bin/pytest", "test", "--entrypoint=#{File.join(__dir__, "bin", "conformance-entrypoint")}", "--skip-signing", chdir: "/Users/segiddins/Development/github.com/sigstore/sigstore-conformance"`)
4. TUF uses a [non-standard JSON representation](https://wiki.laptop.org/go/Canonical_JSON) for computing signatures, so I had to write a custom serializer to be able to verify signatures. I was really hoping it would at least be RFC 8785, but no such luck.
5. Rekor uses OpenAPI to define types instead of protos
6. The TUF spec is ... dense

## Plain Ruby Protos

I might've started to write a pure Ruby protobuf implementation based on a new proto compiler.
I hope I don't need to use it.
