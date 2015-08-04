---
title: High-performance messaging expertise
author: Jeff Lindsay
date: 2015-08-04 17:20 UTC
tags:
---
Messaging systems excite me more than they should. Perhaps because they're so
foundational to distributed systems. Yet there's tons of deep architectural
knowledge, both high-level and low-level that's not well known. There are a
handful of messaging domain experts that I love hearing from, and one of them is
[Martin Thompson](http://mechanical-sympathy.blogspot.com/).

Last year at Strange Loop, Martin gave a talk on a high-performance messaging
project called Aeron. I'm sharing this talk less for the project, and more for the
knowledge and findings associated with the project:

<iframe width="560" height="315" src="https://www.youtube.com/embed/tM4YskS94b0" frameborder="0" allowfullscreen></iframe>
<br />

Not mentioned a whole lot in this talk is his notion of "mechanical sympathy,"
which came up with the [LMAX architecture](http://martinfowler.com/articles/lmax.html)
everybody was raving about a few years ago. The simple idea of aligning our
software to the strengths of our underlying hardware, and avoiding operations
our hardware is not great at.

About 80% of our software will never need this level of optimization. That said,
I think the lessons learned from those like Martin Thompson should be more well
known.
