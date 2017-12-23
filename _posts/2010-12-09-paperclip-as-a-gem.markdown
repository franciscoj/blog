---
title: Paperclip as a gem
date: 2010-12-09 00:00
categories: ruby
---

**Edit 2012-07-04:** You won't have those problems with latest rails and
paperclip. As far as I know this only happens with rails 2.

I love [paperclip](http://github.com/thoughtbot/paperclip). To be clear it just
works. It makes what it has been designed for and makes it easy and flexible
enough to do some other things.

However, there's something with paperclip that always disappoints me, it have
some problems when you want to install it as a gem, and, in my case, when you
want to use it with [bundler](http://gembundler.com).

The problem is that it doesn't load the rake tasks nor the should macros.
Shoulda macros are loaded without problem if the gem is vendored in the project
dir, since shoulda will look for it. But to load the macros when not vendored
you need the following code on your `test_helper.rb` just before `class ActiveSupport::TestCase`.

{% gist 734635 %}

That way the macros are properly load and you can use them on your tests.

To load the rake tasks you need a similar approach. Just include this line in
your Rakefile. If you're using Rails 3 it will properly load automatically the
rake tasks for you so no need for this trick.

{% gist 734642 %}
