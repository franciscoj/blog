---
title: How to include a flowplayer video inside a fancybox modal window
date: 2010-09-10 00:00
categories: javascript
---

Thats how I make to integrate [flowplayer](http://flowplayer.org/) inside a
[fancybox](http://fancybox.net/) modal window.

This following code shows a hidden `div` which will include the video. When
clicking the "Play video" link it will show a fancybox modal window with the
flowplayer video inside.

When closing the fancybox it will unload the video player and hide the div.

{% gist 571643 %}
