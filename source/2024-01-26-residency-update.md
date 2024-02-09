---
title: Residency Update
date: 2024-01-26 12:00 PST
tags:
---

Welcome to my first (very late to be published) update as [Ruby Central's security engineer in residence, sponsored by AWS](https://rubycentral.org/news/ruby-central-welcomes-new-software-engineer-in-residence-sponsored-by-aws/).

My goal is to write a short update every week, chronicling what I've been working on, and reminding myself that I was, in fact, productive.

This week, I focused on updating rubygems.org's rack to v3 and rails defaults to 7.1, as well as kicking work on the security events log into high gear.

<!-- more -->

## Rack Upgrade

That this upgrade was difficult was entirely self-inflicted. Rack 3 [optimized parsing of form keys](), which broke some custom form shenanigans I had done on our admin dashboard. I spent a while trying to fix it in a more rails-y way, but [monkey patching]() was easiest solution.

## Rails 7.1 Framework Defaults

We upgraded to Rails 7.0 a while back, and Rails 7.1 this past month, so it was just a bit of cleanup work to update to the newer framework defaults.
This is regular maintenance, but it's important to keep up with the latest versions of the frameworks we use.

## Soft-Deleting Users

This has been on our wish list for a while. Not many users end up deleting their accounts, when they did, it made it hard to track what they had done. We're now [soft-deleting users](https://github.com/rubygems/rubygems.org/pull/4376), which means they're not actually deleted from the database, but are marked as deleted (and all personal information overwritten). This is largely an internal change, but it helps make the next feature far more useful.

## Security Events Log

This is the big thing I've been working on. I spent a bunch of time refactoring, and think I've landed on a solution that isn't too much code, and isn't too much magic either. As things stand now, stuff is pretty well DRY'd up between events on gems & events on users, so I'm reasonably happy.

Along with the feature work here, I ended up implementing support for viewing them in our admin dashboard, as well as further introducing the use of components to our rails views (which I'm a big fan of).
