---
title: My emacs setup
date: 2016-03-08 20:25
categories:
  - emacs
  - spacemacs
---

I moved to emacs some time ago. Before using it I was a Vim user and after using
it for quite a long time I decided to try emacs to see what it had to offer.

I started by using [prelude](https://github.com/bbatsov/prelude) it worked
pretty well and I was pretty happy with it. The only problem I found on it is
that I missed modal edition too much. So, after some time with prelude I moved
to [Spacemacs](http://spacemacs.org/).

Spacemacs puts together emacs with a quite sane configuration for
[evil](https://www.emacswiki.org/emacs/Evil)

It works pretty well, if you're a Vim user and you're thinking on trying emacs
this is a good way to move. If after some time you don't want to use the modal
edition anymore you can configure it to work the "emacs way" and it will work as
well as with evil. I'm not going to explain all the cool things on Spacemcas,
for that you can just check their page and amazing documentation, it explains
everything pretty well.

I've very little customizations for emacs, I mostly use the spacemacs' default
config expcept for some stuff:

## Emacs as daemon

Starting spacemacs takes a bit of time, so the best way to have it working is to
start emacs as a daemon and then using the `emacsclient` command to connect to
it.

By default, starting spacemcas starts it as a daemon but sometimes I found
myself starting Spacemacs from the desktop environment and then connecting to it
for small editions like quick git commits. Right now I use
[Arch Linux](https://www.archlinux.org/) on my development machine so I started
playing with [systemd](https://wiki.archlinux.org/index.php/systemd) to start it
for me. It turned out to be a very quick win. One good thing with arch and
systemd is that you can set up systemd to have user managed unit files (not
started by root). To do so you just have to create the unit on
`~/.config/systemd/user/emacs.service`

This is the one I use for spacemacs:

{% gist 7a15ebbd161c8a639dbe %}

After adding the file just do:

```sh
systemctl --user enable emacs # to make it start with the machine
systemctl --user start emacs # to start it right away
systemctl --user stop emacs # to stop the daemon
systemctl --user restart emacs # to restart the daemon
```

## Connect to emacs daemon from the terminal

Now, to connect into your emacs daemon you just have to do `emacsclient -t`.

I usually set it as my default editor with this on my zshrc:

```sh
export EDITOR="emacsclient -t"
```

and then I set an alias for it:

```sh
alias e=$EDITOR
```

Then, when I want to edit a file I just do: `e filename.ext`

## Connect to emacs daemon from the desktop environment

That's pretty cool for quick edits in the terminal, but most of the times I work
on an emacs window on my desktop environment. I wanted to be able to connect to
the daemon too, so I ended up adding this to
`~/.local/share/applications/spacemacs.desktop`:

{% gist 8b86895de284d9548012 %}

The `-c` flag asks emacsclient to create a new frame controlled by the window
manager. In my case Gnome Shell.

## Emacs customizations

As I said before I almost use "vanilla" spacemacs. Most of its config is good
enough for everything I do, except for a couple of things.

All this configs go in the `dotspacemcas/user-config()` function on your `~/.spacemacs`

### Word movement:

If you're a Vim user, you'd expect that moving 1 word in `method-name` would
take you to the last `e`. This is not the case in emacs. To change it in ruby
and javascript:

```lisp
(add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
```

### Edit rabl files with ruby:

```lisp
;; *.rabl files are ruby
(add-to-list 'auto-mode-alist '("\\.rabl" . ruby-mode)))
```

### Open the project root when selecting a project with projectile

```lisp
;; Go to project root folder when switching to it
(setq projectile-switch-project-action 'projectile-dired)
```

### Have a separate file for the emacs customizations.

Emacs has an easy customization mechanism
[(see)](https://www.gnu.org/software/emacs/manual/html_node/emacs/Easy-Customization.html).
I don't use it most of the times, but there're some times in which emacs stores
stuff in the `~/.spacemacs` file because of it even if you don't want it. To
avoid it I use a separate file for this customizations. To do so, add this to
your `dotspacemacs/user-init()`:

```lisp
(setq custom-file "~/.emacs-custom.el")
(load custom-file)
```

All customizations will to to `~/.emacs-custom.el` instead of your dotspacemacs file.

### Others

I also have other stuff customized, like the layers I load, etc... but not much.
If you're curious you can check
[my dotspacemacs file](https://github.com/franciscoj/dot-files/blob/master/emacs/spacemacs#L1)

I'm sure I'm missing something, but this is most of it. Enjoy emacs and good hacking!
