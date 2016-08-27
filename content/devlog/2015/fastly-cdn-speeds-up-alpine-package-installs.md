+++
date = "2015-09-23T18:29:59-05:00"
title = "Fastly CDN speeds up Alpine package installs"
author = "Andy Shinn"
tags = ["alpine", "docker"]
aliases = [
    "/blog/2015/09/23/fastly-cdn-speeds-up-alpine-package-installs/"
]
hidden = true
+++

We love fast things. Fast servers, fast cars, fast food. It is one of the reasons we make heavy use of [Alpine Linux](http://www.alpinelinux.org/) and maintain a [reputable Alpine Linux Docker image](https://hub.docker.com/r/gliderlabs/alpine/) (you do know that [Glider Labs also maintains the official Alpine Linux image](https://github.com/docker-library/official-images/blob/master/library/alpine), right?). It is small, lean, and very quick to install packages from [its very vast package index](http://alpine.gliderlabs.com/alpine/v3.2/main/x86_64/). But could it be quicker?

<!--more-->

![Pulling!](/images/2015/pulling.png)

Early in our Alpine Linux love affair we realized that package installation timeouts and mirror distance played a role in our [build reliability](https://github.com/gliderlabs/docker-alpine/issues/15) and speed. Early tests showed that by just switching to a closer package mirror we could speed up image building nearly two-fold. As the [image is used worldwide](https://github.com/gliderlabs/docker-alpine/issues/57), we needed a solution which was a little more feasible than figuring out your closest mirror. Enter the [Fastly CDN][fastly]!

[![Fastly](/images/2015/fastly.png)][fastly]

We [reached out to a couple CDN providers](https://github.com/gliderlabs/docker-alpine/pull/4) for sponsorship and Fastly gladly offered to support such a cause. A couple quick emails, some light configuration, and we were up and running! Fastly now sponsors an Alpine Linux package CDN at http://alpine.gliderlabs.com/. The service is backed by Varnish underneath and gives you access to the very powerful [Varnish Configuraton Language](https://docs.fastly.com/guides/vcl/). This allows us to do fancy things like routing based on geo-location, load balancing between origins, and automatic removal of origins when they become unhealthy.

![Faster with CDN](/images/2015/cdn_speedup.png)

The Fastly CDN is now the default package repository in the `gliderlabs/alpine` image and may also be used someday in the official `alpine` image as well. The package repository is not limited to our image or even Docker in any way. Feel free to use it for any Alpine Linux setup!

A big thank you to Fastly and their excellent team for helping us get this sponsorship going. They [truly care about open source work](https://www.fastly.com/about/open-source) and we greatly appreciate it.

[fastly]: https://www.fastly.com/
