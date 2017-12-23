---
title: Rock your gitting
date: 2014-04-27 20:00
categories: git
---

GIT. What a monster, uh? A tool developers use everyday. Unfortunately
we don't always give it as much attention as it needs. Gitting as a
pro will give you tools enough to make your everyday work as a
developer easier.

I'd like to write a series of posts about git. Some tricks and some
good practices that I apply.

## I know nothing about git, where to start?

If you are a complete newbie read
[the git book](http://git-scm.com/book) and play with it.

## What should I do if I have problems with git?

1. Read the manuals. For a given command, you can read the manual with
`git help command`, e.g. `git help commit`.
2. Read the books. If you want to get a good theoretical understanding
   of git, this is the source,
   [the git book](http://git-scm.com/book). It explains pretty much
   everything about git.
3. Google. If you are getting into a problem with git and nobody has
   ever had it you are either doing it wrong or a super expert git
   user (and there's very little help you van find in this blog about
   git).

## git config and basic tools

First step to get into a new level with git is to tune up your
config. This is pretty much a personal choice and you should take some
time to understand the config options you have and to test
them. [These](https://github.com/franciscoj/dot-files/blob/master/git/gitconfig)
are my config choices in case you want to have something as a base.

Most of the things there are pretty much autoexplained, so I will just
go through the ones which are not.

```
[push]
  default = current
```

This prevents you from pushing all your branches if you `git push`
with no other paremeters.

```
[core]
  excludesfile = /some/path/.gitignore
```

```
[alias]
  l = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)an>%Creset' --abbrev-commit --date=relative
  co = checkout
  s = status --short -b
```

`git l` will pretty print the log. Pretty easy to have a global view
of how's your repo going.

`git s` will show the short status. This means that you will have
something like this:

```
## master...origin/master
 D Gemfile
AM _posts/2013-04-27-rock-your-gitting.markdown
?? file
```

instead of something like this:

```
On branch master
Your branch is up-to-date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   _posts/2013-04-27-rock-your-gitting.markdown

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        deleted:    Gemfile
        modified:   _posts/2013-04-27-rock-your-gitting.markdown

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        file
```

You still can see the full status with `git status` instead of `git s`.

This is a list of global ignores. Which means that they are applied to
all the files on all your git managed projects. Things like personal
OrgMode files, notes, todos, personal scripts, .ruby-version
files... anything you want to use and don't want to share with your
coworkers but it is not in the project's `.gitignore`.

There are dozens of other config options you can be interested
in. Have a look to the `git config` help.

Pretty much everybody uses github nowadays one way or another. I've
seen people struggling with getting the keys working many, many
times. Have a look
[here](https://help.github.com/articles/generating-ssh-keys) on how to
do it since they explain it very well.

If you want a good command line tool to help a bit with git (kind of a
GUI in your terminal) have a look to
[tig](https://github.com/jonas/tig) AFAIK it is included in Ubuntu
repos and mac's homebrew as well so it is pretty easy to install.

There're are some good helpers in the
[git-extras](https://github.com/visionmedia/git-extras) repo. Special
mention for `git undo` and `git ignore` commands. Those are included
on Ubuntu and mac's homebrew as well.

Give some love to your shell too. Try to find a way to show your
current git branch and your current git status on your branch. I use
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) with the
`sunrise` theme to get something like this:

```
--- src/blog ‹master* AMD?› »
```

If you use emacs, have a look to
[magit](http://magit.github.io/magit.html).

If you use Vim, have a look
to [fugitive](https://github.com/tpope/vim-fugitive).

If you use other IDE/editor please add your tool of choice to the
comments!

That's pretty much everything to go from "I annoyingly work with git"
to "We do understand each other".
