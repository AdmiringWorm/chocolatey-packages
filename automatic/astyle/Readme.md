# [![Artistic Style](https://img.shields.io/chocolatey/v/astyle.svg?label=Artistic%20Style&style=for-the-badge)](https://community.chocolatey.org/packages/astyle)

Artistic Style is a source code indenter, formatter, and beautifier for the C, C++, C++/CLI, Objective-C, C# and Java programming languages.

When indenting source code, we as programmers have a tendency to use both spaces and tab characters to create the wanted indentation. Moreover, some editors by default insert spaces instead of tabs when pressing the tab key, and other editors (Emacs for example) have the ability to "pretty up" lines by automatically setting up the white space before the code on the line, possibly inserting spaces in a code that up to now used only tabs for indentation.

Since the NUMBER of space characters showed on screen for each tab character in the source code changes between editors (unless the user sets up the number to his liking...), one of the standard problems programmers are facing when moving from one editor to another is that code containing both spaces and tabs that was up to now perfectly indented, suddenly becomes a mess to look at when changing to another editor. Even if you as a programmer take care to ONLY use spaces or tabs, looking at other people's source code can still be problematic.

To address this problem, Artistic Style was created - a filter written in C++ that automatically re-indents and re-formats C / C++ / Objective-C / C++/CLI / C# / Java source files. It can be used from a command line, or it can be incorporated as classes in another C++ program.

## Features

- It's free and open source!
- Cross-platform application works on Windows, Linux, Mac OS X, and others.
- Supports 15 popular bracket styles.
- Over 90 formatting options.
- Detailed documentation for use and options
- Available in over 20 languages with easy additions
- Supports UTF8, UTF16, and most other character encodings.
- Can process entire projects recursively.
- Will not update unchanged files.
- Checksum prevents dropped or duplicated data.
- Seamless integration with many development environments and editors.
- Can be included in C/C++ and Objective-C projects as a shared (DLL) or static library.
- Can be included in Java projects as a Java Native Interface (KNI)
- Can be included in C#, Python, Pascal, and other projects as a shared library (DLL).

## Package Parameters

- `/KeepAllFiles` - Don't remove any of the source/build files and other unneeded files.

**Example**
`choco install astyle --params '"/KeepAllFiles"'
