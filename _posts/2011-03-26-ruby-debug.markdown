---
title: How to debug a ruby script
date: 2011-03-26 00:00
categories: ruby
---

Debugging r00lz. Maybe you're trying to find an elusive bug or how that
spaghetti piece of code works, in any case is a quite powerful tool and you
should add it to your day to day job.

Debugging in ruby is easy... and you don't even need a GUI for it! Ruby has the
amazing `ruby-debug` gem. That gem provides an executable to debug your ruby
software. There're versions for ruby 1.8.x and ruby 1.9.x. I will explain here
how to install and use the version for ruby 1.8, but ruby 1.9 version is quite
similar.

First install the gem with `gem install ruby-debug`. This will give you an
executable called `rdebug` which executes the ruby interpreter in debug mode
allowing you to debug your script.

I will use this small script to debug.

{% gist 889122 small_script.rb %}

Now we can just run the debugger with `rdebug small_script.rb`. And... voila!

{% gist 889122 debug_1.rb %}

Here you can see the debugger.

Here's the file in which you've stopped:
`[-4, 5] in /projects/889122/small_script.rb`

This arrow indicates that you're stopped there:
`=> 1 dude = true`

And this is the rdebug console where you can give commands to the debugger.:
`(rdb:1) _`

Let's give it a quick try to see how the commands work. Type `help` and press
enter.

{% gist 889122 rdebug_help %}

As you can see there're plenty of commands in the debugger, those ones you will
use them a lot.

 * **next** (you can use it shortened as `n` as well) will make the
   script go one step forward.
 * **continue** (shortened as `c`) will make the script continue until it
   finds a breakpoint.
 * **step** (shortened as `s`) will step into a method.
 * **break** (shortened as `b`) sets a breakpoint with the format `b
   file_name.rb:XX` where XX is the line number.

For everything else... I encourage you to spend 15 minutes reading each command
help 1 by 1. Special mention to `irb`, `where`, `up` and `down` commands.

Enjoy your debugging!!
