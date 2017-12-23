---
title: From Mac Ports to Homebrew
date: 2010-07-04 00:00
categories:
  - mac
  - ruby
---

**Update: April 24th 2014**: I no longer use mac, so this might be very outdated.

I've lately moved from [Mac Ports](http://www.macports.org/) to
[Homebrew](http://github.com/mxcl/homebrew). I find Homebrew an easier and more
intuitive system than Mac Ports and it gives me the option to customize the
installations.

Homebrew is composed of a set of "formulas" with the instructions to compile
and install pieces of software, like ImageMagick or ffmpeg. Each one of these
formulas can be customized to make it suit your needs in an easy way. This is
an example formula from their web site.

```ruby
class Wget < Formula
  homepage "https://www.gnu.org/software/wget/"
  url "https://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz"
  sha256 "52126be8cf1bddd7536886e74c053ad7d0ed2aa89b4b630f76785bac21695fcd"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
```

As you see, plain Ruby, easy to customize :)

To install it the first step for me was to remove Mac Ports, the [instructions are on its homepage](http://guide.macports.org/chunked/installing.macports.uninstalling.html).
After this is quite easy to install Homebrew just following the instructions on
[it's homepage](http://wiki.github.com/mxcl/homebrew/installation).

Once it's done, you can install something as easy as.

`brew install imagemagick`

In fact I needed imagemagick just to [install rmagick](http://rmagick.rubyforge.org/install-faq.html) gem, which have this
library as a dependency.
