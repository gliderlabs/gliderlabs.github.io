+++
date = "2015-03-20T18:29:59-05:00"
title = "Our minimal Alpine Linux image joins Docker official images"
author = "Jeff Lindsay"
tags = ["docker", "alpine"]
aliases = [
    "/blog/2015/03/20/our-minimal-alpine-linux-image-joins-docker-official-images/"
]
hidden = true
+++

When building Docker delivery pipelines, image size is extremely important for fast deploys. Unfortunately, it's too easy to make Docker images over 1GB in size. This is true even when you use many of the official images. It's especially true with many third-party base images. Dockerfile optimization is usually our first priority with clients.

<!--more-->

[Alpine Linux](https://www.alpinelinux.org/) has become our distribution of choice for minimal containers. Since discovering Alpine, we've been maintaining what's become a fairly popular Docker image for it called [`gliderlabs/alpine`](https://registry.hub.docker.com/u/gliderlabs/alpine/).

We've been porting many of our open source containers like [logspout](https://github.com/gliderlabs/logspout) and [registrator](https://github.com/gliderlabs/registrator) to it. Although it's not ideal for every situation, we were still surprised it was not in the Docker standard library. So we began preparing ours to be submitted.

This week we're happy to announce that our image is now merged into the Docker library as an [official image](https://registry.hub.docker.com/_/alpine/). You can now build Alpine Linux based containers with simply `FROM alpine`.

You can also continue to use `gliderlabs/alpine`. We use the same [repository](https://github.com/gliderlabs/docker-alpine) and [open build process](https://circleci.com/gh/gliderlabs/docker-alpine) to build `alpine` as `gliderlabs/alpine`. There are slight differences, but are effectively the same.

Whichever one you use, we hope you enjoy using Alpine Linux with Docker!
