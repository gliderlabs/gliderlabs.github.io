---
title: Docker Events Explained
author: Matt Good
date: 2015-04-14 23:48 UTC
tags:
---

One of the fantastic features of the Docker platform is the events API. This enables tools like [Registrator](https://github.com/gliderlabs/registrator) and [Logspout](https://github.com/gliderlabs/logspout) to listen for container events like starting and stopping, then act on them.

The [Docker API documentation](https://docs.docker.com/reference/api/docker_remote_api_v1.17/#monitor-dockers-events) provides a list of the available events, but does not include much detail on what they mean and when they will occur. Since many of our tools depend on the events API, we've put together a chart illustrating the events triggered throughout the lifecycle of a Docker container (as of Docker version 1.5 / API version 1.17):

<a href="/images/docker_events.png"><img width="650px" height="371px" alt="Docker events diagram" src="/images/docker_events.png" title="Container-related Docker events" /></a>

A few container-related events are not included in this illustration since they are not affected by container state:

- **export** emitted by `docker export`
- **exec_create** emitted by `docker exec`
- **exec_start** also emitted by `docker exec` after **exec_create**

There are also several events not in this diagram that are related to Docker images rather than containers:

- **import** emitted by `docker import`
- **pull** emitted by `docker pull`
- **untag** emitted by `docker rmi`
- **delete** emitted by `docker rmi`

Running `docker rmi` emits an `untag` event when removing an image tag name. The `rmi` command may also emit `delete` events for any image IDs deleted, either by deleting an image by ID directly, or deleting the last tag referring to it.

We encourage more people to take advantage of the Docker events API, and we hope this diagram is useful. The Docker team is [considering including this diagram in the documentation](https://github.com/docker/docker/issues/12164).
