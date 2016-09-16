+++
date = "2016-08-29T18:29:59-05:00"
title = "Quiet Accomplishments of Glider Labs v1"
author = "Jeff Lindsay"
tags = ["company"]
+++

Next month I'll be announcing the details of a reboot of Glider Labs. Since starting this company in 2014, we've been primarily focused on consulting services. However, our biggest impact has come from our open source projects. Despite not having the resources to properly support these projects, Glider Labs has quietly achieved a significant user base from these intentionally simple components.

<!--more-->

We don't have a marketing budget and we barely have time to even maintain these projects. At our peak there had been five of us part-time, but for the bulk of our existence it has just been two of us. Yet over the past couple years these projects have received tens of millions of downloads and are some of the most popular projects in the Docker ecosystem.

## Registrator

Before [Registrator](https://github.com/gliderlabs/registrator) you had to make your service register itself with a service registry, or configure and run a second service with every service to register it. Registrator makes service discovery easy by automatically registering services run in Docker.

Registrator has been downloaded on Docker Hub over 20 million times. It's currently the **10th most downloaded image** on Docker Hub. Registrator is used by several Fortune 500 companies, in some cases directly and in some cases via larger projects that use Registrator.

## Logspout

[Logspout](https://github.com/gliderlabs/logspout) simply collects Docker container logs and routes them somewhere else. It has become the most popular Docker log handler. According to [a report by Datadog](https://www.datadoghq.com/docker-adoption/) earlier this year, based on their users using Docker, Logspout is the **6th most popular image** run in Docker. This doesn't even capture the customized images people run to use 3rd party log drivers.

Docker Hub today reports 249 *public* images with Logspout in the name. Our official Logspout image is reported to have been pulled over 15 million times. Apparently Docker Hub reporting gets quite nebulous with high numbers, however we know it is the 18th most downloaded image on Docker Hub.

## Alpine Linux

We're not responsible for Alpine Linux, but we did popularize it in the Docker community with a [general purpose base image](https://github.com/gliderlabs/docker-alpine). It is the smallest Linux distribution with a very extensive and up-to-date package library. After our `gliderlabs/alpine` image started to become popular, we submitted it to the official Docker Library, making us responsible for the `alpine` Docker image. However, since Docker later hired Alpine creator Nathanel Copa, we don't get much credit for it.

Nevertheless, Alpine is becoming one of the most popular base images used in the Docker ecosystem. Docker themselves recently moved many of their official images to Alpine. 

The Alpine Linux image has also received over 10 million direct pulls, but is probably more widely used as the base image for many public and private images. We can't easily measure its true usage, but anecdotally, we talked to nearly every vendor at DockerCon 2015 and even then over half of them were using Alpine. We even noticed most of the talks and demos by Docker employees were using Alpine.

## Other Achievements

We could talk about some of the clients we've worked with. Perhaps even more impressive are the clients we've turned away. But, when we find the time for them, it's the tools we build that we're most proud of. We have over 20 [other open source projects](http://gliderlabs.com/projects/). Most of which, we haven't even announced.

Glider Labs inherited some of these projects from me. I've been working in the Docker ecosystem since helping develop Docker itself. Immediately after, I built the first killer application for Docker, an open source single-host Heroku called [Dokku](https://github.com/dokku/dokku). It's still one of the most popular PaaS projects, with its own ecosystem of plugins and subprojects, thanks its wonderful maintainers.

We've also worked with a lot of companies in the Docker scene. And we still occasionally work with Docker. We helped architect and implement the initial Docker plugin system. Through sponsorships, we've contributed to other projects as well. For example, we added multi-region support to the AWS provider in Terraform, thanks to a sponsorship from Cisco.

## What Next

This upcoming reboot will put a focus on our open source work. We'll also be taking it to a new level, working a bit higher up the stack. We're not going to be able to do it without your support, so I hope that if you've benefited from our work so far, you'll consider helping out however you can. Stay tuned!
