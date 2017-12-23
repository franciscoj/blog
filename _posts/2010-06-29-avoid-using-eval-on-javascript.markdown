---
title: Avoid using eval() on Javascript
date: 2010-06-29 20:02
categories: javascript
---

Javascript's eval() function is evil. Its performance is bad, and it's very
difficult to debug. If you ever use it the [goto raptor](http://xkcd.com/292/)
will come for you...

OK, now I know why not to use `eval()` but... How could I avoid that evil
function in my code?

The 3 main uses I've found for `eval()` are:

 * Assign a property to an object when you have its name calculated in a
   variable
 * Call a function when you've it's name calculated in a variable
 * Create an object from a class when you've it's name calculated in a variable

To sum up, **do any access of any kind to any object's property when you've this
property name in a variable**. This kind of access can be accomplished using
this notation.

{% gist 1128154 sample1.js%}

If you don't believe it, just copy&paste the previous code on Firebug and see
how it works.

So, let's now see an example on the previous cases

{% gist 1128154 sample2.js%}

Those were just a couple of basic examples that I could remember, but I'm quite
sure that there are much more other evil uses of `eval()` out there that you
can destroy :D
