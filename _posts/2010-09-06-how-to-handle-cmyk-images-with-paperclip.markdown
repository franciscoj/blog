---
title: How to handle CMYK images with Paperclip
date: 2010-09-06 00:00
categories: ruby
---

**Update April 24th 2014**: This is quite old and might not work with
  the current version of paperclip.

In the last project I've worked I found myself reviewing the application again
and again on Internet Explorer since suddenly some images started showing a
beautiful "not-found-red-cross".

After some research I found some blogs telling that Internet Explorer doesn't
support images with a CMYK color scheme ([like this one](http://www.plaveb.com/blog/cmyk-images-not-displayed-in-internet-explorer)).

Since I'm using [Paperclip](http://github.com/thoughtbot/paperclip) to handle
the uploads to the application it wasn't difficult to find a way to solve this.
That's what I did:

{% gist 566895 %}

As you can see I define a "normalized" style which doesn't change geometry,
however it's used to apply the color scheme conversion. Since it's the default
style you can use it like `current_user.avatar.url` without worrying about the
style.
