# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@9ccc1bd8a9b4d7010facb296948c70aa3b3125c7/icons/fstar.png" height="48" width="48" /> ![F* language](https://img.shields.io/chocolatey/v/fstar.svg?label=F*%20language&style=for-the-badge)](https://chocolatey.org/packages/fstar)

F*: An ML-like language aimed at program verification
=====================================================

[![Build status](https://travis-ci.org/FStarLang/FStar.svg?branch=master)](https://travis-ci.org/FStarLang/FStar)

## Notice
This package will install F* language with compatable version of z3.  
It is recommended that you remove your z3 package and then install F*

### F\* website

More information on F\* can be found at www.fstar-lang.org

### Installation

See [INSTALL.md](https://github.com/FStarLang/FStar/blob/master/INSTALL.md)

### Tutorial

The [F\* tutorial](https://www.fstar-lang.org/tutorial/) provides a first taste of verified programming in
F\*, explaining things by example.

### Wiki

The [F\* wiki](https://github.com/FStarLang/FStar/wiki) contains additional, usually more in-depth, technical
documentation on F\*.

### Editing F* code

You can edit F\* code using your favourite text editor, but Emacs,
Atom, and Vim have extensions that add special support for F\*,
including syntax highlighting and interactive development. More
details on [editor support](https://github.com/FStarLang/FStar/wiki/Editor-support-for-F*) on the [F\* wiki](https://github.com/FStarLang/FStar/wiki) .

### Executing F* code

By default F* only verifies the input code, it does not compile or execute it.
To execute F* code one needs to translate it to either OCaml or F\#, using
F\*'s code extraction facility---this is invoked using the command line
argument `--codegen OCaml` or `--codegen FSharp`. More details on
[executing F\* code](https://github.com/FStarLang/FStar/wiki/Executing-F*-code) on the [F\* wiki](https://github.com/FStarLang/FStar/wiki) .

### Community mailing list

The [fstar-club mailing list](http://lists.gforge.inria.fr/mailman/listinfo/fstar-club) is dedicated to F* users. Here is where
all F* announcements are made to the general public (e.g. for
releases, new papers, etc) and where users can ask questions, ask for
help, discuss, provide feedback, announce jobs requiring at least 10
years of F* experience, etc.

[List archives](https://lists.gforge.inria.fr/pipermail/fstar-club/) are public, but only members can post.
[Join here](http://lists.gforge.inria.fr/mailman/listinfo/fstar-club)!


### Slack channel

Users can also ask questions on the `#fstar` Slack channel at
< http://fpchat.com/ >

### Reporting issues

Please report issues using the [F\* issue tracker](https://github.com/FStarLang/FStar/issues) on GitHub.
Before filing please use search to make sure the issue doesn't already exist.
We don't maintain old releases, so if possible please use the
[online F\* editor](https://www.fstar-lang.org/run.php) or directly [the GitHub sources](https://github.com/FStarLang/FStar/blob/master/INSTALL.md#building-f-from-source) to check
that your problem still exists on the `master` branch.


### Blog

The [F\* for the masses](https://fstarlang.github.io/) blog is also expected to become an important
source of information and news on the F\* project.


### License

This new variant of F* is released under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0);
see `LICENSE` for more details.
