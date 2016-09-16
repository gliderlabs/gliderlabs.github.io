+++
date = "2016-09-07T18:00:00-05:00"
title = "Testing your project's development setup"
author = "Jeff Lindsay"
tags = ["notes"]
+++

There are usually hidden assumptions about your project's development environment that you don't find out about until somebody else tries to setup the project. Very much like the first pass at a user interface.

In this case I'm not talking about installing or using your project, but setting it up for development. Onboarding new contributors. The bigger the project or the more languages involved, the more this can be an issue.

We've probably all noticed this problem before. Once everybody is setup for a project, nobody knows for sure what breaks a new setup. The answer should be obvious: test it.

<!--more-->

You might be thinking VMs or Vagrant, but Docker is really the best solution here.

"Wait," you say, "shouldn't you already just be developing your app in Docker?"

Maybe, though honestly, it's not always worth it. It's great to be able to build the production image and try it locally, but development can be a very different build and workflow. In some cases, Dockerizing the development workflow is more work and too much of a hit on contributor UX than it's worth.

If you do use Docker for development, you're basically already testing your environment. If you don't for whatever reason, testing setup is a good excuse to make a development-oriented Dockerfile anyway. Not necessarily to use, just to use as a test.

The base image doesn't have to be the same as production or development, though it's a good idea to at least match production. We use Alpine because it's small and fast to install packages, and we happen to also use Alpine for production images.

The fact it's different from development doesn't matter a huge amount in practice. People are going to have different platforms anyway. Mac, Linux, different distros, different versions. As long as you're installing the same versions of packages you need, it's a pretty good approximation. This Dockerfile can then become the reference for what needs to go into, for example, a Brewfile.

Don't expect it to be fast for larger projects, but using Docker and Alpine will make it pretty fast. I don't run this test all the time during development. I only run it when I'm changing files that affect the dev environment setup. Then I run `make test-env`, which simply builds the Dockerfile.

If the build fails, the test has failed. If it builds without error, the test has passed. Now if you were to, for example, add a JavaScript dependency but forget to add it to `package.json`, you'd find out from this test.

You might also run the tests or do the build as part of this Dockerfile. Ideally, you'd also run your development runner or harness in the image build if you have one. That can be tricky because they run indefinitely. Adding a timeout to the runner so it exits after a given time if provided handles that. Now you'll know it builds, but more importantly that the development harness runs.

We make sure the CI always runs this test. In fact, then we also run the usual CI tests using that container. We usually want to run CI tests in Docker anyway because it makes for a much simpler and debuggable CI setup. It's sort of convenient that our environment test is actually just a build. Here is a `circle.yml` for one of our projects:

```
machine:
  services:
    - docker

dependencies:
  override:
    - docker build -t automata -f dev/setup/Dockerfile .

test:
  override:
    - docker run automata /bin/sh -c "make test"

```

I've not run into many people that talk about testing their project development setup. I assume this means most aren't doing it. Though if you develop in Docker, you're already mostly doing it, maybe without realizing.

Whether or not you develop in Docker, though, after having a number of onboarding blunders, this now saves us from maybe 95% of them. We know with that level of certainty, given you have XYZ tools installed (which we check for), that anybody will get a working development environment with `make setup`.

YMMV ;)
