+++
date = "2016-12-21T18:00:00-05:00"
title = "Glider Labs Financial Transparency"
author = "Jeff Lindsay"
tags = ["announcements", "finances"]
+++

I'm excited to announce we are now sharing [all of our expenses](http://gliderlabs.com/finances/) directly from our books in real-time. This is the first step towards full financial transparency, eventually including income, account balances, even equity contributions. The system is automatic, real-time, and beautifully visualized.

We were heavily influenced by Cushion's [Running Costs](http://cushionapp.com/running-costs/) page, so a big thanks to them for the visualization concept. <!--more-->Here's what ours looks like at the time of this post:

[![Glider Labs 2016 Expenses: Hosted Services](/images/2016/expenses-services.png)](http://gliderlabs.com/finances/)

The visualization is accompanied by a table with more details. We've split the Running Costs report into three categories for easier consumption: Hosted Services, Staff Costs, and Other. The data includes all of 2016 and will show a rolling window of the last 12 months as we go into 2017.

## Transparency

I'm a big fan of transparency in organizations. Financial transparency in particular captures the state and health of an organization, which usually comes in the form of reports and metrics. When I worked at Twilio, our CEO, Jeff Lawson, would give weekly all-hands meetings. In these he shared how much money was in the bank and discussed what we saw on the internal financial dashboard. This was confidential and employees only, but a nice gesture of transparency.

Financial transparency is especially important for any mission-driven, public benefit organization. When I was a director at [Hacker Dojo](http://www.hackerdojo.com/), we'd have monthly meetings open to anybody that shared a typical income and expense report. In the early days, before we had proper bookkeeping, we'd screengrab reports from Mint. Ideally, though, our books would always be in good shape and publicly available.

Glider Labs started as a consulting company, but our reboot represents a shift towards an open, public benefit organization. Although I haven't properly communicated our mission yet, it's built around open source and open source values.

Open source and community-run organizations like Hacker Dojo are open and mostly decentralized, allowing anybody to participate. In these cases, transparency is not just about accountability and goodwill. Transparency is necessary for the community to participate and make decisions effectively.

## Automated Bookkeeping

The only way to get the ideal level of financial transparency is to automate it. I don't just mean making the bookkeeping data available via API. The act of bookkeeping itself needs to be automated as well. In smaller organizations that don't rely on their books for the day-to-day, making reports is often the forcing function to clean up the books and make sure it's all correct. To have continuous reporting like this means ongoing bookkeeping, which traditionally means hiring a bookkeeper.

Perhaps for that reason, most bookkeeping software is not very automation friendly. Especially for the type of automation we have planned. So we decided to make our own. It's a simple double-entry bookkeeping system backed by SQL for data consistency and custom reporting, and speaks JSON over HTTP. It's called Tully, named after [Louis Tully](http://ghostbusters.wikia.com/wiki/Louis_Tully) from Ghostbusters.

We took heavy inspiration from [Ledger](http://www.ledger-cli.org/) and [Ledger-likes](http://plaintextaccounting.org/). In fact, Tully can import and export Ledger-compatible files, so you can use Ledger with Tully. Also like Ledger, Tully is open source. Or will be, eventually.

The real magic of Tully we'll save for later. For now, we're using an early version of it to power the Finances page.

As a side note, you'll notice we pay for GoDaddy Bookkeeping. Once we do our taxes to verify Tully has parity, we'll switch off of GoDaddy. I actually loathe GoDaddy, but GoDaddy Bookkeping was acquired. It used to be called [Outright](http://outright.com/). Despite being GoDaddy now, it's a great modern, minimal bookkeeping tool. Interestingly, it was originally developed by a founding member of Hacker Dojo, Dean Mao, while at Hacker Dojo.

## 2016 Closing Retrospective

The timing of all this aligns nicely with the close of 2016. Already we've received some great questions inspired by the 2016 data on our Finances page. I'd love to answer any other questions people have via Twitter ([@progrium](https://twitter.com/progrium)), in the comments here, or in [our Slack](http://slack.gliderlabs.com/).

To provide some context for the data, 2016 was a very light year for the business. At our peak in 2015, we had a staff of around 5 people working with several clients at once. When my co-founder, Andy, let himself get burnt out, he left Glider Labs. In a panic I started to reduce our load and planned for time off myself until the end of 2015. During that time I started formulating some of the ideas I have now for Glider Labs.

Going into 2016, in order to pay rent I took on some clients. Although we stopped working with most of our other staff, I wanted to keep Matt around, which also meant taking on clients for him. With the future of Glider Labs uncertain, we basically got by doing the minimal amount of client work.

Then, over the summer, a bunch of events and ideas came together that led to [the reboot in September](http://gliderlabs.com/devlog/2016/gliderlabs-rebooted/). Internally the reboot started at the end of July. It meant we'd stop taking client work and focus on innovating in open source. I know that's vague, but the point is we had to economize and shift the business towards a different model. So you can see August to September we started reducing our costs and our AWS activity started going up.

We can probably reduce our costs even more. Another great benefit of this transparency is that we can get suggestions for reducing our costs. For example, our friend Jo&euml;l mentioned in Slack using Let's Encrypt instead of SSLMate. It turns out we already started using Let's Encrypt but only after our renewal with SSLMate. One thing Cushion has that we don't yet is an explanation for our costs. Hopefully that will come in time as well.

That's about it for now. Definitely looking forward to 2017. Enjoy the holidays!
