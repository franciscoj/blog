---
title: Rails debug with passenger
date: 2011-03-27 00:00
categories: ruby
---

**Edit 2012-07-05:** You can now install `rack-debug` in a much more easy way by
using my [debugger-rails](http://github.com/Zorros/debugger-rails) gem.

## Without Passenger

In my last post we learned [how to debug ruby scripts](http://dev.otrobloggeek.com/2011/03/26/ruby-debug.html). It can be done
as well with a rails application, you just have to start it with `script/server
-u`. The `-u` means to start on debug mode. Just make sure you have the
`ruby-debug` gem installed.

## With Passenger

That works amazing... unless you use Passenger on development. If you do, then
you'll need a different way to run the debugger. Don't panic, it's quite easy,
thanks to the [rack-debug](http://github.com/ddollar/rack-debug) gem.
Rack::Debug is a gem which provides an easy interface to `ruby-debug` for
applications running on Passenger. And the good thing about it is that... it
just works!

To use it, just add the `ruby-debug` gem to your Gemfile, make sure to use the
[1.4.x version](http://github.com/ddollar/rack-debug/tree/stable-1.4) if you're
running ruby 1.8.x, since the new [2.x version](http://github.com/ddollar/rack-debug) is prepared for ruby 1.9.2.

{% gist 889606 Gemfile %}

Now that your gem is installed, add the middleware to Rails.

{% gist 889606 development.rb %}

And the helper rake tasks.

{% gist 889606 Rakefile %}

Now you can just add a `debugger` statement on any line on your application,
restart it and run `rake debug` so that the Rack::Debug gem connects to the
debugger. Easy, eh?

Enjoy the debugging!
