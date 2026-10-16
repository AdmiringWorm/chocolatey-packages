# ![OnionShare Changelog](https://img.shields.io/badge/OnionShare-Package%20Changelog-blue.svg?style=for-the-badge)

## Version: 2.6.5 (2026-09-17)

- **BREAKING CHANGE:** Support only 64-bit Windows and reject `--x86` before changing existing installations.
- **ENHANCEMENT:** Automatically remove the previous 32-bit MSI installation when upgrading to 64-bit.
- **BUG:** Read GitHub release assets and select only the win64 MSI.

## Version: 2.1-dev1 (2019-04-24)

- **BUG:** updater is unable to check for update [#65](https://github.com/AdmiringWorm/chocolatey-packages/issues/65)

## Version: 2.0 (2019-02-19)

- **BREAKING CHANGE:** Removed chocolatey-core.extension as a dependency
- **ENHANCEMENT:** Added autohotkey to uninstall unattended

## Version: 1.2 (2018-01-19)

- **ENHANCEMENT:** Add package changelogs [#6](https://github.com/AdmiringWorm/chocolatey-packages/issues/6)
- **ENHANCEMENT:** Expanded chocolatey script aliases

## Version 1.1 (2017-10-30)

- Initial implementation of the onionshare chocolatey package
