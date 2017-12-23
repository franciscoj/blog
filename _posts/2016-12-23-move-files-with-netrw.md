---
title: Move files with netrw
date: 2016-12-23 20:25
categories:
  - vim
---

After some time with emacs I'm back to Vim. This time I'm using
[Neovim][neovim] to see what it has to offer.

One thing that I found myself trying to do a couple of days ago was to try to
move a set of files into a different folder from inside netrw (which is the file
explorer for Vim). Renaming each file one by one was not an option, so I digged
a bit on the Vim's help to see what could I find.

It turns out netrw has a `move` comand which you can invoke on a set of
selected files by using `mm`... problem is that it needs quite some setup for
it to work and it took me some time to realize how to do it:

1. Find the destination folder on netrw and mark it with `mt` this will set it
   as the target of the move.
2. Find the files you want to move and mark each one of them with
   `mf`.
3. Tell netrw that the original file's folder is the current folder with
   `:cd`
4. In netrw use `mm` in any of the marked files.

That would move the files to where you want. You can check the help in Vim
itself with `:h netrw-mm` but it doesn't tell you about the `:cd` part, which
is the one I was missing and was failing with a strange message about not being
able to move the files.

Honestly, too hard to be comfortable at all. I also don't think this works with
files from different folders.

[neovim]: https://neovim.io
