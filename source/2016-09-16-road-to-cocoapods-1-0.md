---
title: The Road to CocoaPods 1.0
date: 2016-09-16 15:00 CEST
tags:
---

*This is the talk I gave at NSSpain 2016*

The Road to CocoaPods 1.0

I've been CocoaPods' lead developer for the past couple of years, and today I'm going to tell the story of CocoaPods 1.0.

<!-- more -->

A long time ago, in a land far, far away, there was a programming language called Objective-C. It had many developers, who went into Xcode to work their trade and develop applications. They were happy they could build apps for their favorite platform.

This is our "ancient history". Our origin story.

As more and more people started to build more and more applications, they realized that there are only so many different kinds of wheels that you can re-invent. And thus the third party library was born. And the developers were happy.

But then, some of our ranks found that merely having libraries and frameworks wasn't enough. They wanted a way to easily share the code they wrote, and to partake of others' code, and to build an open source community for the Cocoa world.

And thus CocoaPods was born. It wasn't created to incite flamewars on Twitter or provoke your ire when it spews out a ruby backtrace.

CocoaPods was intended to be a community and a tool for everyone who worked on Cocoa apps. And judged in that light, I think it's done marvelously.

CocoaPods today is the hub for open source projects for our community -- a list of projects, documentation, metrics, along with the litany of tools that have been written to work with CocoaPods.

For years, people would point out that CocoaPods wasn't at version 1.0 yet. In semantic versioning terms, that meant that we weren't promising it would be 'stable'. We even had an FAQ entry explaining that CocoaPods was used in a lot of apps, even though it wasn't yet 1.0.

Even so, getting to 1.0 has been a goal from the beginning. 1.0 meant CocoaPods was ready for use in production. It meant CocoaPods would be stable. It meant that it would somehow be "done" -- it would do everything it had to, and do it well enough that we wouldn't need to make breaking changes. And most of all, it's a nice milestone to be proud of. And get lots of views on Twitter, of course!

Today is actually the five-year anniversary of the first release of CocoaPods to RubyGems. Back then, it could only be run on MacRuby and wasn't even 0.1!

In the beginning, CocoaPods was rather small. Eloy manually created pod specs for a few of the most popular libraries, it generated a simple Xcode project, and you had to do the rest by hand. It's grown a lot in the past five years. There even used to be an issue for Eloy to add tens of specs to the specs repo! (We closed it as being well and truly accomplished.)

We slowly added new features and team members and web properties. Guides and CocoaDocs and a Twitter feed. Better Xcode support, the ability to specify more custom things in your Podfile and Podspec.

I joined the CocoaPods team after the Bug Bash at the end of March 2014. We triaged hundreds of issues, some of which dated back to before I had ever written a line of Objective-C. And in doing so, I became intimately familiar with how CocoaPods worked, and got to know the team. I knew immediately it would be something I wanted to be a part of.

We worked on shipping CocoaPods trunk and CocoaDocs 2.0 and plugin support. Things kept on chugging along, and things continued apace for several months, especially since Fabio was being paid to work on CocoaPods.

For a while, we recognized that CocoaPods was rapidly changing, and justified the pre-1.0 version with the fact that we occasionally needed to make breaking changes. Users kept on discovering new ways to use CocoaPods, and thus we always had new bugs to fix, or code that needed refactoring.

Following v0.34, which came out in September 2014, the idea that CocoaPods was becoming stable began to take hold. We had refactored many parts of the codebase, and changed the way files were laid out on disk. In the process, we probably broke 50% of all CocoaPods projects at some point, but at the end of that release cycle, we had a piece of software that we were reasonably happy with.

That time period was also the peak of my personal satisfaction with CocoaPods -- it had been around for long enough to work pretty well and be reasonably well respected in the wider community, but was still new enough to be exciting to work on. Of course, around that time, Carthage was released, and since we've seen the ecosystem fragmented even further with Swift Package Manager.

I was working full-time on CocoaPods courtesy of Stripe, and spent the majority of my time implementing a new dependency resolver. Called Molinillo, it's now in use by both Bundler and RubyGems, in addition to CocoaPods. The new resolver was actually my first attempted contribution to CocoaPods right after the bug bash, and was at the top of the list of must-have features.

Of course, at the time we knew that the immediate future would be dominated by adding framework and Swift support. Little did we know that would turn into a many-months project, led by Marius Rackwitz, that spawned further months of improvements and bug fixes. Without the introduction of Swift, CocoaPods could have reasonably hit 1.0 in the fall of 2014.

When we finally got Swift shipped and had addressed most of the outstanding bugs, it was almost WWDC time. That meant we'd have to be mad to ship 1.0 for 4 months, as we waited to hear what changes to Xcode Apple were making, and figure out the ways we'd have to adapt CocoaPods to them.

We'd gotten to the point where the last real blocker for the 1.0 release was a new Podfile DSL -- there were issues dating back at least three years about problems that would be solved once we came up with this mythical new DSL.

I started working on the new DSL right before my talk at iOS DevCampDC at the beginning of September. By the time the conference finished, some tests in CocoaPods Core were by to passing. By the time my delayed flight landed in New York, I'd ripped out a lot of how the DSL created targets and had the skeleton of the new one working.

And then when Xcode 7 was out, I was on the road without a laptop, moving from San Francisco back to Chicago. I was answering issues on my phone in the passengers seat on a 2,500 mile drive, but without any way to run tests, I couldn't realistically write code.

Back in Chicago, I finalized a sponsorship agreement with Capital One, whereby they would support my work on CocoaPods. But my focus remained on triaging issues and trying to whittle down the endless backlog of things we wanted to change about CocoaPods.

Early in October, I released 0.39 and said it would be the last version of CocoaPods pre-1.0. By then, there was no turning back. I was committed to finally getting 1.0 released, no matter what it took -- it became a point of pride for me more than anything practical at that point, I think.

I finished up a new linter that verified pods would actually be importable. I implemented change tracking in Xcodeproj. We made `cocoapods-deintegrate` a default plugin and got CocoaPods to better clean up after itself (which was necessary in wake of the changes to come).

One morning, I made `pod install` a few times faster before going to class. Another evening, the linter became aware of `header_mappings_dir`. And so the fall quarter marched on. But I didn't have the heart to tackle the new DSL yet.

By the time finals week rolled around, I had run out of issue to procrastinate on. I spent my 21st birthday in the library, rebasing my work on the Podfile DSL.

After taking nearly two weeks off due to a temporary relocation to San Fransisco (and the following cross-country drive back to New York), I arrived back at my dad's house with less than two weeks left to finish 1.0 in order to hit my self-imposed deadline.

There were maybe five or six days in a row where I stayed up until four or five a.m., implementing all of the final parts of the new DSL. Installation options in the Podfile. Target inheritance. Abstract targets. All of these features (and quite a bit more) were written long after everyone else had gone to sleep. I must've been the only one using the hotel wifi in Sturbridge, MA when I finally went to bed.

I live-streamed me releasing CocoaPods 1.0.0.beta.1, even though it took two and a half hours. I beat the deadline with a day to spare. CocoaPods 1.0 was a reality.

The 1.0 betas somehow managed to span four and a half months, and ended up encompassing even more changes than the first beta did. But the beta process forced us to polish CocoaPods even more, and I'm thankful we were able to make all of those changes before 1.0, rather than after.

By beta 5, which shipped in the beginning of March, we were finally happy with how the release was shaping up. In Slack, we were talking about when to ship the first release candidate, and I was throwing around the idea of doing the final release with Eloy, when I was in Amsterdam later than month.

But then came Shallowgate. By the next week, we'd make another set of breaking changing to reduce CocoaPods' demand on GitHub's servers. It turns out we had a lot of users cloning the master specs repo, and because of the fact we used shallow clones, each fetch was hugely expensive on GitHub's end.

Danielle, Marius, and myself spent that week making sure we would no longer perform shallow clones, and reduce the number of fetches we would be making from GitHub in the first place.

After beta 6 shipped those fixes and we had a roadmap for the rest of the response to Shallowgate, I was exhausted. Finals week had come around again, and development and studying were both competing for my time. At the suggestion that we maybe should backport these fixes to 0.39, I lost it, and quickly realized I needed to take a break from working on open source.

And so began a two and a half week hiatus from GitHub. After finals and spring break, I went back to school and prepared CocoaPods to be able to handle a 'sharded' master specs repo to allow CocoaPods to continue to use GitHub for the master specs repo.

Orta and I hopped on a Hangout to talk about a release schedule. We decided on a Tuesday, 8am San Fransisco time (a lesson in reaching the widest possible developer audience I learned from Realm). Two RCs and a final release, at least five days apart each. So professional!

Despite all the challenges of the past few months, all of the anger and frustration and setbacks, we had a date. May 10, 2016. I had four pairs of CocoaPods socks. I bought a celebratory bottle of beer from Dogfish Head.

I wrote a blog post and tried not to be too self-congratulatory. We told the team that there was a feature freeze and that 1.0 was on the brink of existence.

And then the day came. I used my fancy new `super_release` task on every single CocoaPods gem, and they all were 1.0. We pushed the blog post. We sent tweets. And I went off to Econ class.

Since, we've shipped a bug fix release and I believe Dani is working to push version 1.1 right now, during this talk. As usual, there are a whole bunch of new features and bug fixes from the past few months.

Now, our story has caught up to present day. CocoaPods has reached version 1.0 and surpassed it. Hundreds of developers have contributed tens of thousands of commits, which have touched hundreds of thousands of Xcode targets, which have in turn probably been used by a billion users. None of that is hyperbole, by the way.

I've been on the CocoaPods Core team for almost two and a half years. Commented on 3,499 issues. Opened 526 pull requests. Pushed 3,270 commits. Sent 29,457 Slack messages.

I can't even count the number of nights I've stayed up late writing, the lunches spent reading issues, the hours passed just thinking about CocoaPods code.

I can also count the miles traversed to relocate to San Fransisco to take a grant for CocoaPods (Stripe's open source retreat, which resulted in Molinillo): approximately 5,500 miles. I can count the years of school missed to work full-time: 1.

All of this to say -- it's been an incredible journey working on CocoaPods. Before 1.0, during, and after. But like all journeys, this one must too come to an end.

I've loved working on CocoaPods. But there are only so many passive-aggressive issues, snarky tweets, and late nights putting out fires that one person can take.

So, effective today, I'm going to step down from running the project. I'm still going to be around, but its time to let others pick up the mantle. I will continue working on CocoaPods, but will go back to building the things that I find fun and interesting, rather than what others want me to do.

CocoaPods has been a huge part of my life since joining the project in April 2014, but the time has come for me to try working on other things. I have a few CocoaPods-related projects in the works, and don't plan on stopping completely any time soon, but the days of me answering every GitHub issue filed against a CocoaPods repo are over.

I accomplished what I set out to do. I wrote features and fixed bugs that have touched tens of thousands of developers, and I'm incredibly humbled by the opportunity that the rest of the CocoaPods team, and all of our users, have given me. I'm so happy to see how CocoaPods has grown, and I'm happy to have been able to contribute.

And most of all, I shipped CocoaPods 1.0.
