---
title: Build simple systems to build good systems
author: Jeff Lindsay
date: 2015-04-29 11:18 UTC
tags: programming
---

We often talk about complexity in software systems, but for some reason we don't seem to talk enough about simplicity. I was quite happy to find that Rich Hickey's keynote at Strange Loop 2011 focused on simplicity.

**[Rich Hickey - Simple Made Easy on InfoQ](http://www.infoq.com/presentations/Simple-Made-Easy)** ([transcript](https://github.com/matthiasn/talk-transcripts/blob/master/Hickey_Rich/SimpleMadeEasy.md))

Simple Made Easy is about Hickey's exploration of what simple really means, what it doesn't mean, and how that can be used as a guide towards simplicity in software.

Most experienced programmers know that simplicity is difficult to achieve. Perhaps part of the reason for this is that simplicity seems to be somewhat subjective. Here, Hickey explains a framework to more objectively identify how simple a design is.

<center>![Simple as not interleaved](/images/simple_made_easy.jpg)</center>

He starts with the etymology of simple. It describes a meaning around the amount of *interleaving*. What's interesting is that this interpretation of simplicity is not about the number of elements, just how interleaved they are.

> Simplicity is not about counting. I'd rather have more things hanging nice, straight down, not twisted together, than just a couple of things tied in a knot.

To help with this particular meaning of simple, he shares an archaic word that is specifically the opposite of this:

> **complect** - to interleave, entwine, or braid

By using complecting as our primary anti-pattern, we can more easily see a path towards simplicity than the vague notion of "avoiding complexity."

He also identifies that simple is not the same as easy, despite many using those words interchangeably. While easy is ultimately relative, simple in these terms has some objectivity to it. We can ask, "How much interleaving is there?"

The talk goes over a number tactical approaches to simplicity by not complecting, but there's also wisdom shared around the value of simplicity.

Perhaps the biggest issue with complexity is that it undermines understanding your software. He makes the point that understanding is the real key to making changes quickly in software.

Conventional wisdom says testing is how we can make changes quickly. While there is clearly value in testing, the popular notion that test coverage above all else is what you need to move quickly is challenged by Hickey. He calls it guardrail programming.

> What's true of every bug found in the field? It passed all the tests. So now what do you do? I think we're in this world I'd like to call guardrail programming. It's really sad. We're like, "I can make change because I have tests!" Who does that? Who drives their car around banging against the guardrail saying, "Whoa! I'm glad I've got these guardrails because I'd never make it to the show on time."

Once you find a bug, tests only tell you what the problem isn't. You have to reason about the program, debug it, try things. If the program is complex, this is harder to do. The only way to improve this process is if the program is simple.

> Compared to the complexity we can create, we're all statistically at the same point in our ability to understand it, which is not very good. So we're going to have to bring things towards us.

There's definitely a lot of great insight in this talk. As a final point, let's remember that simplicity doesn't just happen. It's not the default mode of software engineering.

> Simplicity is a choice. It requires constant vigilance.

We need more thinking around simplicity. If you know of other great talks on simplicity, in software or otherwise, please share in the comments.
