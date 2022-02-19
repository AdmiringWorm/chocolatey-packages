# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@666991132c85cfd09e577d6caadd5a6256921012/icons/quassel.png" height="48" width="48" /> ![Quassel IRC](https://img.shields.io/chocolatey/v/quassel.svg?label=Quassel%20IRC&style=for-the-badge)](https://community.chocolatey.org/packages/quassel)

Quassel IRC is a modern, cross-platform, distributed [IRC][irc] client based on the [Qt4 framework][qt4].

Distributed means that one (or multiple) client(s) can attach to and detach from a central core that stays permanently online -- much like the popular combination of [screen][] and a text-based IRC client such as [WeeChat][weechat], and similar to (but much more featureful than) so-called [BNCs][bncs]. Re-attaching your client will show your IRC session in the same state as you left it in (plus whatever happened while you were gone), and this even when you re-attach from a different location. In addition, Quassel IRC can be used like a traditional client, with providing both client and core functionality in one binary. This so-called "Monolithic Client" completely hides the distributed nature, so for a purely local installation, Quassel IRC can be setup very easily.

Cross-platform means that Quassel IRC is developed for and tested on Linux®, Windows®, and MacOS X®. It should also run on any other platform that is supported by [Digia][digia]'s Qt4 library.

By modern we mean that Quassel IRC will have all the features you'd expect from an IRC client nowadays. It also innovates in many areas. For example, the GUI features a dockable nicklist and topic bar, or you can arrange your channel and query buffers in default or custom views, which are also dockable. This means that you can arrange your GUI as you please. The architecture allows for other innovations, such as on-demand creation of log files in custom formats from the backlog.

[irc]: http://en.wikipedia.org/wiki/IRC
[qt4]: http://www.trolltech.com/products/qt
[screen]: http://en.wikipedia.org/wiki/GNU_Screen
[weechat]: http://weechat.flashtux.org/
[bncs]: http://en.wikipedia.org/wiki/Bouncer_(networking)
[digia]: http://qt.digia.com/
