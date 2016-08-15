---
title: The Modern Systems Software Mess
author: Jeff Lindsay
date: 2015-03-24 23:16 UTC
tags: company
---
In August 2000, while Rob Pike was still at Bell Labs and before he co-developed Go, he gave a talk called [Systems Software Research is Irrelevant](http://doc.cat-v.org/bell_labs/utah2000/). Today the situation is perhaps not as dire. At the very least, his examples are noticeably dated. However, many of his points remain true and point at systemic roadblocks to better systems software.

His main point was that academic research around systems software had lost the influence on industry it once had. The rise of Google and its academically inclined engineering culture is maybe the biggest shift since this talk. Google has applied and published great research on software systems, particularly around distributed systems.

That said, there are points from this talk that resonate with and inspire people like us trying to fill the void of modern systems R&D.

> Startups are too focused on short time scale and practical results to try new things.

At first I thought, "That's not true!" Then I realized what startups really do is often take the opportunity to apply *recent* ideas (ie Docker), but rarely do they (nor should they) try to *invent* novel approaches to systems.

Instead, invention most often comes from organizations large enough to necessitate invention for their particular problem and scale, or startup vendors that are trying to sell a shiny new solution. This has yielded great papers, best practices, and open source software, but in all cases these are independent solutions to specific problems.

> Go back to thinking about and *building systems*. Narrowness is irrelevant; breadth is relevant: it's the essence of *system*.

No one vendor will provide a solution for your entire system. There are virtualization vendors, CI vendors, source control vendors, operating system vendors, configuration management vendors, database vendors, container management vendors, and on and on.

Whether these are hosted services or commercially supported open source software, none of them will ever solve (read: own) the system. No matter what they think or what they tell you.

Instead, we collectively share best practices and loosely converge on similar system architectures. But who has the incentive and business platform that can support *systemic* innovation?

> There has been much talk about component architectures but only one true success: Unix pipes. It should be possible to build interactive and distributed applications from piece parts.

If there is a guiding hypothesis behind the Glider Labs approach to building systems, this is it. Rarely does this get a chance to be fully explored.
