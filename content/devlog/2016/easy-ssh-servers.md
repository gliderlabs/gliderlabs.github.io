+++
date = "2016-11-30T18:00:00-05:00"
title = "Build SSH servers now as easy as HTTP servers in Go"
author = "Jeff Lindsay"
tags = ["announcements", "golang"]
+++

My staff and I (read: just [Matt](https://github.com/mattaitchison/) and myself)
have been hard at work building the tooling and infrastructure to bring the
Glider Labs vision to life. As you've heard, one of our pilot projects for the
reboot is [Cmd.io](http://gliderlabs.com/devlog/2016/announcing-cmd-io/), which
is heavily based on SSH. In fact, I've worked on a bunch of projects using SSH
ever since Localtunnel nearly 7 years ago. And now we've finally been able to
capture a high-level library for building SSH servers.

<!--more-->
It's called [gliderlabs/ssh](https://github.com/gliderlabs/ssh). Here are the [GoDocs](https://godoc.org/github.com/gliderlabs/ssh).

One of the great things about Go is that it actually has [an SSH
package](https://godoc.org/golang.org/x/crypto/ssh) as part of its "extended"
standard library. It has a great one-to-one mapping of most of the SSH protocol,
but as such, it's still pretty low-level. We've gone through a number of ways to
organize and build specialized SSH servers with it. Now we've gotten to the
point where we understand it well  enough to build a general, high-level SSH
library on top.

And the best thing? We modeled the API after net/http, so building SSH servers
is now as easy as building HTTP servers in Go:

```
package main

import (
    "io"
    "github.com/gliderlabs/ssh"
)

func main() {
    ssh.Handle(func(s ssh.Session) {
        io.WriteString(s, "Hello world\n")
    })

    log.Fatal(ssh.ListenAndServe(":2222", nil))
}
```

Besides our projects, we've also collaborated with fellow Gopher and SSH
protocol enthusiast [@shazow](https://twitter.com/shazow). He's worked on one or
two SSH projects with us and has his own popular SSH project
[ssh-chat](https://github.com/shazow/ssh-chat), so it was very helpful to get
his feedback on this API.

And as I mentioned, we use this in Cmd.io and is one of the first steps towards
making Cmd.io open source.

## sshfront

I know some of you browse our repositories and may have found
[sshfront](https://github.com/gliderlabs/sshfront), an SSH daemon that calls out
to your own commands to handle SSH sessions and authentication. It's sort of
like CGI for SSH. You get this high-performance server daemon and you can script
how to handle sessions using any language you want by just using standard
IO.

Since we often need more customization, we haven't used it in many projects, but
it's great for prototyping. That said, I'd be pretty comfortable using it in
production as well. It's like a simpler, more programmable version of OpenSSH.

Anyway, we haven't touched it in a while, but we could probably reduce its
codebase to a tenth the size by dropping in gliderlabs/ssh. Perhaps that could
be an exercise for one of you out there excited to use gliderlabs/ssh?

In any case, enjoy the library and build cool stuff!
