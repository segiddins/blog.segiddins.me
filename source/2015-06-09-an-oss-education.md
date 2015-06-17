---
title: An OSS Education
date: 2015-06-09 16:00 PDT
tags:
---

So, as I'm sure you can see from the slide behind me, my name is Samuel Giddins.  Normally, I'd start a talk by saying where I work, and the projects I contribute to outside of work. But today, that would ruin the surprise, since I'll be talking about how I got to be _here_, standing on a stage at AltConf, talking to y'all.

<!-- more -->

Before we get started, though, I want to make something clear. This is _my_ story. It's a story of privelege. It's a story of immense luck. It's a _true_ story, but it's about what has happened in _my_ programming career. 

That out of the way, let's dive in! Today is June 9th, 2015. Three years ago, on this day in in 2012, I'd never built an iOS app before. I'd never written a single line of Ruby code. I was finishing up my Junior year of High School; it was the weekend before my finals started. I'm pretty sure I had a GitHub account, but I'd never used it, much less knew how to use git.

This isn't to say I haven't been an immense nerd since forever; I certainly have. My dad introduced me to computers eighteen years ago, when I was about two years old. A few years after that, I remember us having both a Performa and a Quadra in our basement workshop, although I'm sure I preferred playing with the trains instead of the Mac. There was then the obligatory dark age, when I had a pair of Windows towers, before coming back to the back in 10.4. I've been using computers literally for longer than I can remember, but learning to make them do my bidding is a rather more recent development.

(See what I did there?)

In fact, I didn't start my first iOS app in earnest until November of 2012. It was the weekend before Thanksgiving. I was supposed to be writing all of my college applications. It was Saturday morning; I'd gotten up early. I had about ten hours before I needed to head to the high school to run lights for my show, and I _never_ did homework on a Saturday morning.

I double-clicked on Xcode.app. Start a new project. `Umpire Clickr`. My first app was underway. It was utterly terrible (it's now up on GitHub at [https://github.com/segiddins/Clickr](https://github.com/segiddins/Clickr) if you're curious what a poorly-executed first app on the store looks like). But, by the time I got into the lighting booth, I was creating my developer account so I could submit it to the store.

*The journey had begun.*

So I submitted `Clickr` to the app store, submitted my college applications, and then circled back to do a few more iOS apps, all of which, in retrospect, have achieved the dubious status of "so bad it's funny". But I was hooked. Here I was, a teenager who spent more time using an iPhone than anything else, and suddenly I wasn't constrained by _other_ people's imaginations, only my own. Plus, figuring out how to do stuff was pretty cool. I remember a fair number of nights where I'd come home from school, code for five or six hours, and only then turning to my homework (the luxury of being a second-semester senior, I suppose).

I somehow found nsscreencast.com, and started watching those. One of the first screencasts I saw was on this library called RestKit. It seemed cool, so I integrated it into one of my own projects. I was blown away that a library that powerful existed, and was free for me to use. All I had to do (after learning about CocoaPods) was run a single command, and I had this amazing toolchest at my fingers.

When I got an internship (for my school's senior options program) working on this app called Slader, I decided I wanted to use RestKit in it instead of the pre-existing mess of custom NSXMLParsers. (Yes, it was that gross. We couldn't add new keys to any responses without breaking every existing install). But my API was XML, and the existing RestKit XML serialization layer wasn't working for me.

And so I made my first ever pull request. It couldn't have been simpler (and it wasn't actually accepted), but to me it was a thrill nontheless. I was contributing to something that I had admired from afar for a few months. I was so excited, I even wrote a blog post about it. (Man, was I a nerd back then). 

This was May 2013. I was on the cusp on graduating from High School, and only a summer separated me from starting college at UChicago. I needed a summer internship. So naturally, I reached out to Blake Watters, the driving force behind RestKit, and basically begged him to hire me. He said no, but invited me to grab coffee one day before work. I met him, and he started showing off the integration testing suite he had for his app -- that was pretty darn impressive. And then we talked about the future of RestKit, and he rattled off two or three major projects that I could try and tackle. I don't think he really expected me to, but I wanted to impress Blake. I said I'd try and prototype the new value transformation archictecture he'd sketched out.

So, on the train ride home that morning, my mind was buzzing with excitement. On the one hand, here was a genuine opportunity to work with a developer I looked up to. And on the other was a challenege the likes of which I'd never seen before. Suffice it to say, novice developer Samuel had never thought about "architecture" before. Much less building tooling that thousands of other developers could get their hands on. I dug in when I got home. And I was hooked.

See, basically nobody used the apps I'd built. But RestKit was something that a lot of people depended upon. I love making the "at my scale" jokes, but seriously, at RestKit's scale, even the little things would need to matter. Because it was a library, and not an app, I didn't even know how many people would be affected if I shipped bugs, but I'm pretty sure it would've been thousands of developers and millions of users. No pressure, right?

And so I gnawed away at the problem for a few days. I remember needing to do a short presentation, and working on `RKValueTransformers` immediately before and after. I'd found a problem that grabbed my attention more than any other I'd been presented with before. It was incredible to be challenged, to have a sense of purpose that wasn't otherwise readily available.

I know you might be thing, "well Samuel, I've got enough challenges on my plate right now with this app I'm building...". And that's great! But it takes time to get to work on something of consequence, something that feels like it's being used, a project that challenges you to grow. And, in open source, you don't need to have your credentials accepted by some hiring committee to get started hacking on things.

Sure, it was a unique point in time where I barely had any other obligations, but there were no more formal barriers. Meeting with Blake wasn't a precursor to me contributing. Nor was living in the same city, country, nor time zone. Nor was my age, my education level, or basically anything that's printed on my resume. I had time, I had a GitHub account, therefore I could contribute.

As someone with very little experience, I will forever be grateful that Blake took the time to let me bounce ideas off of him. I can point to that single week as the time where I grew into being a capable developer. Not just because because of *what* I was building, but working on a project with another developer, a project that would in turn be used by others, made the *how* I was working incredibly important. I got to learn how to write tests (something foreign to me until then), how to write documentation, and how to talk about incredibly technical things with someone over the internet.

All of those are the skills I use literally every day right now. I'd go so far as to say they're the essential skills for _any_ software developer. And I got them in distilled form, right up from, from open source, because it's an environment in which the constraints you're up against are so much tighter than working on an app in your free time, or building yet another social network at _insert random startup name here_.

So, I'd joined the RestKit core team, and had a newfound confidence in my abilities. I'd tackled a problem that made me feel like I had a greater fundemental understanding of how code _worked_. That was a pretty incredible feeling, so I kept on doing it -- I wanted more. I got more and more involved in RestKit (where I'm the current pull request merger / ignorer).

Let's take a tiny detour here, because I want to be honest with you. My open source work is the reason I'm here today, in many ways. It's the reason people know me. It's the first way I introduce myself to other developers. It gives me 'cred' with people who don't otherwise know me, but are familiar with the projects I work on. And I'm incredibly grateful for that.

After starting my first year of school at UChicago, I got involved in your typical college startup. It was pretty terrible, but I was building the iOS app and helping out with the backend (of course). I was hungry to find another challenge. Over spring break, after getting my wisdom teeth out, I went to hang out at Artsy for the CocoaPods bug bash. It was the day before heading back to school. I tried making one small fix to the specs, but it was really off-base, and I closed the pull request after a few minutes. Other than that, I had contributed no actual code to CocoaPods, but in trying to track down some of the issues, I learned a bit about CocoaPods worked internally. Even more importantly, however, I’d met Orta, along with chatting with Eloy, Fabio, and Kyle over IRC. It was a fun day, but still, it was no harbinger of the year to come. But it was a start.

I returned to the University of Chicago to begin spring quarter of my first year (where I currently plan on completing a triple major). While the first week of the quarter was filled with the obligatory reading, writing, and problem sets, I couldn’t help but feel a bit bored. So, I did what every nineteen year old college student does when bored on a Saturday night: `git clone && bundle install && vim .` . (Ok, maybe that isn’t the typical response, but bear with me.) I decided, in my naivety, to try and rewrite the CocoaPods dependency resolver, because I knew there was an outstanding issue to that effect.

In that crazy attempt to rewrite such a core part of CocoaPods, I learned so much. First off, that copy-pasting code isn't as healpful as you'd like. But more importantly, it was a chance to discover how other people, developers much smarter and more experienced than myself, built things. Sure, it was an incredible hack job, and I'm happy it never got merged, but it was a night where I got to explore and expand my horizons as a developer. And isn't that why we're all here, in SF this week? Isn't that why we go to conferences, and listen to talks?

But for me, open source was a way to do all that without flying across the world, without spending thousands of dollars on tickets and hotel rooms and flights, and without ever stepping foot outside of the library. Working on CocoaPods (and now also Bundler, and ignoring the fact that my day job is _also_ open source), I'm confident in saying that the people I get to work with are a finer bunch than you'll ever find outside of the community.

I get to work with the most experienced, most talented, and nicest people ever, all in one place. You'd never get to work with all of them at once in a job, but since CocoaPods is everyone's hobby, you get this incredible mix of people. I'm humbled every day to wake up, see my GitHub and Slack notifications from the rest of the team, and be able to say, I'm a part of that.

Compared to a few years ago, everything's looking up. I love open source, but I love even more the person it's helped me to become. I've found a way into this world, and it's now a place I belong. I wrote a blog post a few weeks ago that tackled the more personal side of this story, and the summary is: in a very short time, I've grown up. Both personally and professionally. And the open source world is intertwined in that story.

So thank you so much for listening to me ramble about how I basically owe my career to open source. It's drastically changed my life (mostly for the better), and taught me more than I could've ever dreamed, both about coding, being a software developer, and being a human being on the internet. I know that open source, like everything else, isn't perfect and has its faults, but it's a hell of a place to be.
