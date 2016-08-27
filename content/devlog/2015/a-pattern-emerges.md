+++
date = "2015-03-04T18:29:59-05:00"
title = "A Pattern Emerges"
author = "Jeff Lindsay"
tags = ["company"]
aliases = [
    "/blog/2015/03/04/a-pattern-emerges/"
]
+++

It may not be obvious, but Glider Labs is named after the glider pattern in [Conway's Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). If you're not familiar, Conway's Life is a popular cellular automaton that exhibits how simple rules can lead to complex behavior.

<!--more-->

Specifically, Conway's Life is a simple simulation with cells that can either be on or off at each step. Every step, four simple rules are executed dealing with the state of a cell's neighbors. From this, you get what seems to be a disproportionate amount of rich, dynamic behavior.

![Conway's Life](http://media.giphy.com/media/8Ar9S6zEFjJiU/giphy.gif)

Key takeaways from Conway's Life are about complexity and emergence. A well constructed initial pattern of only a few cells in Life can grow into an entire ecosystem of interesting patterns.

A minor change to the initial pattern has a tremendous effect on how the pattern evolves. While the system is deterministic, the dynamics of it are not terribly intuitive. You rarely know how a change will cascade through the lifespan of a Life simulation unless you built it up from scratch yourself.

Murphy's law is an unavoidable truth in operations and reliability engineering. Root cause analysis usually proves major system failures not to be random, but an unexpected series of smaller, cascading failures. This is the nature of failure and predictability in complex systems, and it's fascinating how well this is captured in models like Conway's Life.

![Complex Life system](http://media.giphy.com/media/tXlpbXfu7e2Pu/giphy.gif)

Studying complexity and emergence in Conway's Life also reveals useful truths in designing everyday software systems. Although there are infinite possible simulations in Life, you quickly notice that all complex patterns are made up of just a few simple patterns that keep recurring.

These useful patterns can be arranged in countless ways to compose more complex useful patterns. Complex patterns can then be combined as modules to make even more complex patterns. Sound familiar?

In case these patterns seem pointless, it may be worth mentioning that Conway's Life is [Turing complete](http://jeremykun.com/2011/06/30/turing-machines-and-conways-dreams/). As such, you can implement [Conway's Life in Conway's Life](https://www.youtube.com/watch?v=xP5-iIeKXE8).

This only scratches the surface of what can be gleaned from studying Conway's Life. There are plenty of ways to play with Life simulations, including implementing one yourself. Here's a [runnable Go implementation](http://play.golang.org/p/nr2wehptjW) in about 100 lines.

The glider pattern we reference is the smallest traveling pattern in Life, and one of the most useful building blocks. It's often used as a symbol of Conway's Life, but has also been adopted to [represent the hacker ethic](http://www.catb.org/hacker-emblem/faqs.html). This is a convenient symbolic addition for us.

All of this gets at how we think about problems, design systems, and captures the realities of our field. This is why we are Glider Labs.

![Glider pattern](http://media.giphy.com/media/wErVWADqta2oE/giphy.gif)
