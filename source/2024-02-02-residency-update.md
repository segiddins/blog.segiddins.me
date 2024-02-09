---
title: Residency Update
date: 2024-02-02 12:00 PST
tags:
---

Welcome to my second (very late to be published) update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week, I focused on addressing some inbound security reports, wrapped up feature work on event logging, and started building a new tool to assist me in researching the gems that are a part of our ecosystem.

<!-- more -->

## Security Reports

Can't share the details here yet until the reports are disclosed, but trust me that I did work in this area.

## Event Logging

Event logging is basically feature complete! In fact, the [models are already in production](https://github.com/rubygems/rubygems.org/pull/4406).
You can see some screenshots linked on the [massive PR](https://github.com/rubygems/rubygems.org/pull/4367).
Not too much to say here outside of what's in the PR. I'll write up the feature on the RubyGems blog once it's live.

## Component Previews

Now that I've been working on RubyGems.org for a while, I finally got around to making it slightly easier to build UI.
As a part of my event logging work, I [set up a component preview system using lookbook](https://github.com/rubygems/rubygems.org/pull/4407), which is a way to see what a component looks like in isolation from the rest of the app. This is a big win for me, as it makes it easier to iterate on UI changes without needing to navigate through the app to see them.
Selfishly, it's also helpful because it's an easy way to get code coverage on my Phlex components.

## Gem Research Tool

As part of my role as a security engineer, I need to be able to quickly research the gems that are a part of our ecosystem. I started building a tool to help me do that, and it's already been helpful in my work. It's a rails app backed by a sqlite database that ingests data both from the [rubygems.org data dumps](https://rubygems.org/pages/data) as well as directly from all the .gem files hosted on rubygems.org. This was a fun rabbit hole to hack on, and it already paid dividends while addressing some of the security reports that came in this week.
