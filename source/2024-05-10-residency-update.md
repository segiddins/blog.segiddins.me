---
title: Residency Update
date: 2024-05-10 12:00 PDT
tags:
---

Welcome to my update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week I attended RailsConf, and shipped a gem that makes setting up trusted publishing for an existing gem fit into a 5 minute lightning talk.

<!-- more -->

## RailsConf

## RubyGems Research

got andre to help me set up a new k8s cluster for rubygems research, also wiping the machine in the process

wrote up & executed on deploy steps https://github.com/segiddins/rubygems-research/issues/12

added a docker image workflow to the repo so it could be deployed in k8s
https://github.com/segiddins/rubygems-research/pull/14

## API Security

Refactored api key scopes to make it easier to introduce new scopes.

https://github.com/rubygems/rubygems.org/pull/4676

allowed users to create API keys with expiration dates

https://github.com/rubygems/rubygems.org/pull/4681

allow API keys that were created with an expiration under 15min to skip MFA -- makes creating ephemeral API keys much more convenient, not losing any security since the user *just* MFA'd to create it

https://github.com/rubygems/rubygems.org/pull/4691

## Trusted publishing

Added API for trusted publishing.
Wrote rubygems plugin to use the API & set up trusted publishing for an existing gem.

https://github.com/rubygems/rubygems.org/pull/4690
https://github.com/rubygems/rubygems.org/pull/4693

CLI

https://github.com/rubygems/configure_trusted_publisher

## Sigstore

Begin implementing dsse/in-toto support https://github.com/segiddins/sigstore-ruby/pull/11

needed to be able to verify sigstore bundles produced by github's new attestation action

hacked on ruby/openssl support for difficult times https://github.com/ruby/openssl/pull/757
