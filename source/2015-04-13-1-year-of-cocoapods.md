---
title: 1 Year of CocoaPods
date: 2015-04-13 14:30 EDT
tags:
---

A year ago today, I made my first serious attempt at contributing to CocoaPods. Little would I know that a late Saturday night (that quickly turned into Sunday morning after I returned from a party) spent hacking on some Ruby would forever change the course of history. Well, maybe not *history*, but certainly my own story, and that of CocoaPods.

<!-- more -->

I’ve been a CocoaPods user since the spring of 2013, my formative days as an iOS developer, before I even knew how to write a coherent program in Ruby. I couldn’t tell you who had written CocoaPods, whether it was sponsored by a corporation, or whether it would be around in a year, but from day 1 I was heavily indebted to it. I wouldn't hesitate to say that, without CocoaPods, I could not have made it as an iOS developer.

The first time I was ever forced to consider the idea that CocoaPods was a concrete thing, a human production, was when I saw the announcement on the very blog of the Bug Bash. It was set for my last day of my very first college spring break, but I didn’t have anything better to do (I had been sidelined by two removed wisdom teeth earlier in the week), so I hopped on Metro North towards Manhattan, and Artsy HQ.

Not knowing who I would meet, I took the elevator up to the 27th floor, and was promptly greeted by Orta. I sat down next to maybe five or six other people, and proceeded to triage issues. If memory serves, I had attended to the second-most issues that weekend, after Boris (hence his nickname, the Triagemaster General). I tried making one small fix to the specs, but it was really off-base, and I closed the pull request after a few minutes. Other than that, I had contributed no actual code to CocoaPods, but in trying to track down some of the issues, I learned a bit about CocoaPods worked internally. Even more importantly, however, I’d met Orta, along with chatting with Eloy, Fabio, and Kyle over IRC. It was a fun day, but still, it was no harbinger of the year to come. But it was a start.

I returned to the University of Chicago to begin spring quarter of my first year (where I currently plan on completing a triple major). While the first week of the quarter was filled with the obligatory reading, writing, and problem sets, I couldn't help but feel a bit bored. So, I did what every nineteen year old college student does when bored on a Saturday night: `git clone && bundle install && vim .`. (Ok, maybe that isn’t the typical response, but bear with me.) I decided, in my naivety, to try and rewrite the CocoaPods dependency resolver, because I knew there was an outstanding issue to that effect.

That first PR seemed to get peoples’ attention. I had blindly copy-pasted most of the code from Bundler’s old resolver, but I had some of the basic CocoaPods specs passing. I also got 100 comments from HoundCI, complaining (rather prematurely) about code style. Right after that, I started to seriously talk with Fabio and Eloy about what would be needed to clean up that work and get it mergeable. Days of conversation ensued, in which I didn’t make any progress on the resolver, but I did manage to sneak in about a PR a day doing small things around the different CocoaPods repos. After a couple weeks of that, I had become a member of the core team.

At the end of April, Eloy pointed me towards Stripe’s announcement of their open source retreat. I’d been working on CocoaPods less than a month, but I was the member of the team most able to drop everything and move to San Fransisco. We had no idea what my proposal would actually promise, but I began to seriously consider taking the plunge and working on CocoaPods full-time. It took a full month to convince my dad to let me take a year off, but I convinced him just before flying out to SF for RubyMotion#inspect (and to meet the majority of the CocoaPods team). In between talks, Eloy and I polished up my proposal, and narrowed it down to one point: a new dependency resolver, potentially to be shared with bundler. And so I submitted the proposal right when I got back to school on May 30. (I took a redeye back and accidentally slept through both my classes that day. Oops.) I wasn’t sure what to expect. On one hand, I was affiliated with a relatively well-known project that had traction in the community. But on the other hand, I was a relative unknown, a random college student with no real track record of open source leadership.

On June 3, 1:22 AM Chicago time, I heard back from Greg Brockman -- I was a finalist. He wanted to schedule a Skype call for later that day. We chatted for about half an hour, and I felt like I hadn’t made a total fool of myself. I settled back into nervous waiting. That night, at 7:07 PM, I had my response:

> Hey Samuel,
> 
> You're in!


And so a new chapter of my CocoaPods career began: I was the soon-to-be grantee. The night I found out happened to be the night before my last day of classes for the year, so after telling everyone and anyone I could call, I celebrated a bit in between juggling my final assignments and my last analysis p-set. I then had to go about preparing to take a year’s leave of absence while also writing papers and studying for finals (and eventually breaking up with my girlfriend).

Over the summer, I was an intern on the iOS team at Tumblr. While I was using CocoaPods on a daily basis at work, development on the tool itself had ground to a halt, both from me and everyone else. I managed to get in the odd pull request or two after work, but I didn’t focus much time on CocoaPods development. That all changed the day I moved to California, September 4th. I had one weekend to acclimate myself (and find an apartment) before starting the three-month retreat at Stripe.

My first day at Stripe was spent triaging upwards of 200 issues, which was an exhausting, yet incredibly productive way to start. On day two, I dug into my work on the dependency resolution algorithm. Later that week, Eloy, Kyle, and myself started to pull together the initial 0.34 release, which was a day-long Herculean effort. At the end of it, though, I finally felt like I belonged on the CocoaPods team.

So I hunkered down to work on the resolver, along with general CocoaPods improvements, for a solid month and a half. Other than a little fire I had to put out will sitting in SFO, things went very smoothly. Molinillo was born and integrated into CocoaPods, tests were written, and my integration PR was merged. The `segiddins` release was a go.

Since Stripe, I’ve been working at Realm. But I’ve also been writing a bunch of CocoaPods code, as well as diving head-first into both Bundler and RubyGems, spearheaded by Molinillo. I helped review Marius’ work bringing framework (and Swift) support to CocoaPods, along with prodding along the 0.36 release process. I built pod downloading caching and concurrent pod downloads. I’ve fixed a bunch of bugs (and introduced more than I’m proud to admit).

---

So, what does the future hold for me and CocoaPods? Right now, I don’t foresee any changes in the near future. I’ll continue working on some big stuff (the new `Podfile` DSL comes to mind), and hacking on things behind the scenes. I couldn't imagine not working on CocoaPods now. It’s become a huge part of my life, both professionally and personally, and I’d miss it dearly if I weren’t committing to it every week.

Pod on.