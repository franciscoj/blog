---
title: How to use Twitter bootstrap with simple_form
date: 2011-11-02 00:00
categories: rails
---

**Edit April 24th 2014**: This is too old to be still
  relevant. There's even new versions of bootstrap, so don't trust the
  content in this article.
**Edit 2012-07-03**: As you can see in the comments, simple_form has
  build it support for bootstrap. And built in a much better way than
  this. Check the
  [wiki](https://github.com/plataformatec/simple_form/wiki/Twitter-Bootstrap-v2-and-simple_form-v2)
  to see how to make it work.

I [Twitter’s bootstrap](http://twitter.github.com/bootstrap/). It’s
easy to use and perfect to start your new applications with a good
result. It provides some basic CSS tools like a grid system together
with some other fancy things.

However it has a small problem. You cannot make it work with a Rails
application out of the box. Don’t worry, it’s not a big problem. You
can make it work with just a bit of hacking here and there.

This are the minimum config options that I’ve found that you need on
simple_form to have it working with bootstrap so that it applies the
right classes. On fields and wrappers.

{% gist 1334203 simple_form.rb %}

We’re almost there… there’s one more step needed. Bootstrap uses an
extra div container around each input field. I’m afraid I couldn’t
find any way to add this extra wrapper with simple_form, so I ended up
with this patch.

{% gist 1334203 simple_form_bootstrap.rb %}

So far it works well, we couldn't find any caveats yet… but if you do,
or if you find a better way to integrate these pieces of amazing soft,
please let me know!
