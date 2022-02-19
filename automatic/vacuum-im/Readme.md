# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@c20f2a17e916fd4bfd2e30946f8f015c9de3b0d0/icons/vacuum-im.ico" height="48" width="48" /> ![Vacuum-IM](https://img.shields.io/chocolatey/v/vacuum-im.svg?label=Vacuum-IM&style=for-the-badge)](https://community.chocolatey.org/packages/vacuum-im)

Full-featured crossplatform Jabber/XMPP client.
The core program is just a plugin loader, all functionality is made available
via plugins. This enforces modularity and ensures well defined component
interaction via interfaces.

## Features

- Nested roster groups
- Multiple accounts in profile
- Support for Adium message styles
- Full support for Jabber conferences
- Easy access to recent contacts and conferences
- Ability to combine contact to meta-contact from several accounts
- Storage of history both locally and on the server (XEP-136)
- Create a bookmark at the conference with the possibility autologin
- Support for CAPTCHA forms, with the possibility of transmission without the use of browser
- Automated change of transport with preservation of names, groups, subscriptions and archive messages
- Lists of privacy, with the possibility of ignoring or setting in invisible mode for individual contacts and groups
- Multi-stage automatic change of status depending on the time of inactivity
- Ability to set different status icons for individual contacts, and groups of contacts are connected through transport
- Support for avatars with the ability to specify a contact an arbitrary image as an avatar
- Ability to add annotation to contact

## Package Parameters

- `/GPO` - Install the GPO edition of Vacuum-IM

Example: `choco install vacuum-im --package-parameters="'/GPO'"`
