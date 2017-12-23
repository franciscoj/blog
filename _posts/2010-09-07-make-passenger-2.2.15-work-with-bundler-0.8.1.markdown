---
title: How to make Passenger 2.2.15 work with Bundler 0.8.1
date: 2010-09-07 00:00
categories: ruby
---

**Edit 2012-07-03:** If you have the same problems... Try to switch to a better
solution like [Pow](http://pow.cx).

From now I'm using Passenger with Apache and [Passenger Pane](http://github.com/alloy/passengerpane) in my development environment. The
only problem is that in most cases we're using Bundler 0.8.1 in production,
which is old and deprecated. To keep my dev environment similar to the
production one I just use 0.8.1 in my dev machine.

To make them work together you just have to add the empty file
`config/setup_load_paths.rb` to your application. This file will be required
before Passenger loads you gems as an alternative way to loading those gems...
and it will just do nothing. You can get more info
[here](http://www.modrails.com/documentation/Users%20guide%20Apache.html#bundler_support)
Once this is done your application will just work :)
