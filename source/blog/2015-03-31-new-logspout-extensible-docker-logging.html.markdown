---
title: "New Logspout: Extensible Docker Logging"
author: Jeff Lindsay
date: 2015-03-31 20:07 UTC
tags:
---

[Logspout](https://github.com/gliderlabs/logspout) is a Docker container for stateless, host-level log forwarding. It was designed specifically for Docker container logs. It's one of the earliest standalone components built for the Docker ecosystem, and the canonical way to deal with Docker logs for many.

After Glider Labs adopted the project, we updated and automated its build and release process, switched it to [Alpine](http://gliderlabs.com/blog/2015/03/20/our-minimal-alpine-linux-image-joins-docker-official-images/), and took care of a few long standing bugs. Our next release will focus on a re-architected version that is more modular and more extensible.

You can try it now in master `HEAD`, which is also tagged on Docker Hub as `:master`. In preparation for the next release, let us tell you more about it.

### Modules

Logspout now includes a concept of modules, similar to, say, Nginx modules. Modules are chunks of functionality added or removed at compile-time. In our case, they're added or removed at Docker build-time, with no need for you to set up or install any compiler toolchain.

Managing modules happens in a `modules.go` source file that is intended for operators to edit. Although it's a Go source file, think of it like a configuration file. No real knowledge of Go is necessary. It looks like this:

```go
package main

import (
	_ "github.com/gliderlabs/logspout/adapters/raw"
	_ "github.com/gliderlabs/logspout/adapters/syslog"
	_ "github.com/gliderlabs/logspout/httpstream"
	_ "github.com/gliderlabs/logspout/routesapi"
	_ "github.com/gliderlabs/logspout/transports/tcp"
	_ "github.com/gliderlabs/logspout/transports/udp"
)
```

These are the default modules used in Logspout. It's safe to remove any of these lines to drop a module. You can also add lines pointing to new Logspout module packages. These packages can live in any repository, allowing you to build your own modules without forking or pushing upstream to the logspout repository.

Editing this file seems to suggest you'd need to fork the logspout repository to make a custom build, but you don't. We let you customize `modules.go` with an `ONBUILD` hook. With this, making a custom build of Logspout that follows official releases is extremely easy. [Here is an example.](https://github.com/gliderlabs/logspout/tree/master/custom)

### Adapters and Transports

Previously, the idea of a "Logspout adapter" was just a hardcoded function mapping in Logspout. We started with an RFC 3164 "syslog" adapter, then others contributed two more: a JSON over UDP adapter, and a separate "rfc5424" adapter for modern syslog. People also asked for TCP syslog, or hacked in support for other adapters like RabbitMQ and Kafka.

Using modules, we now have a real API for adding new and externally maintained adapters. We also support different transports, which can be used by adapters to prevent needing to create adapters for each type of possible transport. For example, the new syslog adapter lets you use UDP, TCP, or any other transport added in the future, such as perhaps [TLS](https://github.com/gliderlabs/logspout/blob/master/transports/tls/tls.go).

We then redesigned our built-in adapters. There is now a single syslog adapter that supports both RFC 5425 (default) and RFC 3164. It's more configurable and out of the box has more sensible defaults. There's also a raw adapter that allows generalized templated log messages over any supported transport.

### Extension Points

For those interested in writing adapters, or are curious about our extension architecture, Logspout modules are enabled by [go-extpoints](https://github.com/progrium/go-extpoints). This is a library and generator for building extension points in Go programs. Extension points are a mechanism for [inversion of control](http://en.wikipedia.org/wiki/Inversion_of_control), similar to [dependency injection](http://en.wikipedia.org/wiki/Dependency_injection). Each extension point represents a part of Logspout that a module can hook into.

Here is a list of current extension point types in Logspout. Some are more advanced or internally used than others, but are available to module authors nonetheless.

 * **AdapterFactory** - allows you to add new types of route adapters (syslog, Kafka, etc)
 * **AdapterTransport** - allows you to add new adapter transports (UDP, TLS, etc)
 * **HttpHandler** - allows you to add new top level endpoints to the HTTP service
 * **Job** - allows you to add parallel running tasks (HTTP server, container pump, etc)
 * **LogRouter** - allows you to add new log routing intakes (containers, syslog, etc)

Extension *points* are package singletons where you register and access objects implementing the type for that extension point. Extension *types* like those listed above each have their own extension point. Extension types are either a Go interface, where an extension must implement the interface methods, or a function signature type definition, where an extension is literally a callback function.

Here is the simplest example of a module package hooking into an extension point. We implement the `HttpHandler` function signature, which just says to return a Go `http.Handler`, and register it with the `HttpHandlers` extension point on package initialization.

```go
package hello

import (
  "github.com/gliderlabs/logspout/router"
  "net/http"
)

func init() {
  router.HttpHandlers.Register(HelloHandler, "hello")
}

func HelloHandler() http.Handler {
  mux := http.NewServeMux()
  mux.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("Hello!"))
  })
  return mux
}

```

Adding an import for this package in `modules.go` and rebuilding will add a new `/hello` endpoint to the Logspout web server.

For more examples, check out the other default modules in the Logspout repository such as [httpstream](https://github.com/gliderlabs/logspout/tree/master/httpstream), [routesapi](https://github.com/gliderlabs/logspout/tree/master/routesapi), and of course the [adapter](https://github.com/gliderlabs/logspout/tree/master/adapters) and [transport](https://github.com/gliderlabs/logspout/tree/master/transports) modules. Even much of the core Logspout [router package](https://github.com/gliderlabs/logspout/tree/master/router) is implemented with extension points.

### Docker Log Drivers

Docker itself is about to [support log drivers](https://github.com/docker/docker/issues/7195). This introduces improvements to current Docker logging, and lets you recompile Docker with new log drivers.

Logspout will continue to be an easier and more configurable solution for drop-in container log forwarding. The built-in log drivers in Docker will actually help many Logspout deployments, since you'll be able to disable Docker writing logs to local disk. Let Logspout forward logs to where they should really be.

If you have questions about writing modules, using extension points, or using the latest Logspout, let us know via [Logspout issues](https://github.com/gliderlabs/logspout/issues), or join us in `#gliderlabs` on Freenode.
