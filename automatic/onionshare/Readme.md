# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@c17eafc7449264771b68e5854e6b952371c6b517/automatic/onionshare/icons/128x128.png" height="48" width="48" /> ![OnionShare](https://img.shields.io/chocolatey/v/onionshare.svg?label=OnionShare&style=for-the-badge)](https://community.chocolatey.org/packages/onionshare)

OnionShare lets you securely and anonymously share files of any size. It works by starting a web server, making it accessible as a Tor onion service, and generating an unguessable URL to access and download the files. It doesn't require setting up a server on the internet somewhere or using a third party file-sharing service. You host the file on your own computer and use a Tor onion service to make it temporarily accessible over the internet. The other user just needs to use Tor Browser to download the file from you.

### Notes

- This package supports only 64-bit Windows. Upgrades automatically uninstall the previous 32-bit MSI installation (OnionShare 2.3 through 2.6) before installing the 64-bit version. Installation with `--x86` is no longer supported. If you need 32-bit support, install version 2.6.0 with `choco install onionshare --version=2.6.0`.
- Versions prior to 2.3 will not get uninstalled automatically by this package, due to problems with the uninstaller not running unattended. Please remove OnionShare manually before installing this package.
