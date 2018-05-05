# [<img src="https://cdn.rawgit.com/AdmiringWorm/chocolatey-packages/8a6d25834cf98f5df36d4b3fa67a6e5677f61700/icons/origin.png" height="48" width="48" /> ![Origin](https://img.shields.io/chocolatey/v/origin.svg?label=Origin&style=for-the-badge)](https://chocolatey.org/packages/origin)

Origin is an online gaming, digital distribution and digital rights management (DRM) platform developed by Electronic Arts that allows users to purchase games on the internet for PC and mobile platforms, and download them with the Origin client (formerly EA Download Manager, EA Downloader and EA Link).

Origin contains social features such as profile management, networking with friends with chat and direct game joining along with an in-game overlay, streaming via TwitchTV and sharing of game library and community integration with networking sites like Facebook, Xbox Live, PlayStation Network, and Nintendo Network.

## Package Parameters
- `/NoAutoUpdate` - Disable the auto updating of the origin client. *NOTE: May also disable auto updating of installed games, but that is not tested*
- `/InstallDir:` - Select the location to where the origin client should be installed (*Defaults to `C:\Program Files\Origin` (32bit), `C:\Program Files (x86)\Origin` (64bit), or the previously installed location*)
- `/LaunchOrigin` - Start Origin Client after installation
- `/StartOrigin` - Alias for `/LaunchOrigin`
- `/NoStartMenuIcon` - Don't create a shortcut on the start menu
- `/DesktopIcon` - Create a shortcut on the desktop
