# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@5470b935d572ee4593af7ece11494ecff9806d16/icons/nagstamon.png" height="48" width="48" /> ![Nagstamon (Install)](https://img.shields.io/chocolatey/v/nagstamon.install.svg?label=Nagstamon%20(Install)&style=for-the-badge)](https://chocolatey.org/packages/nagstamon.install)

Nagstamon is a status monitor for the desktop. It connects to multiple Nagios, Icinga, Opsview, Centreon, Op5 Monitor/Ninja, Check_MK Multisite and Thruk monitoring servers. It resides in systray, as a floating statusbar or fullscreen at the desktop showing a brief summary of critical, warning, unknown, unreachable and down hosts and services. It pops up a detailed status overview when being touched by the mouse pointer. Connections to displayed hosts and services are easily established by context menu via SSH, RDP, VNC or any self defined actions. Users can be notified by sound. Hosts and services can be filtered by category and regular expressions.

## Package Parameters
- `/UseInf:` - Change the inno setup configuration file to use/save when installing

**EXAMPLE**
`choco install nagstamon.install --params "'/UseInf:C:\nagstamon.install.inf'"`
