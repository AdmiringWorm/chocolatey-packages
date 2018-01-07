# [<img src="https://cdn.rawgit.com/AdmiringWorm/chocolatey-packages/cd0c4e8a38fbfebfdeca8eb337fefe6ebf66bdb6/icons/nagstamon.png" height="48" width="48" /> ![Nagstamon](https://img.shields.io/chocolatey/v/Nagstamon.svg?label=Nagstamon&style=for-the-badge)](https://chocolatey.org/packages/Nagstamon)

Nagstamon is a status monitor for the desktop. It connects to multiple Nagios, Icinga, Opsview, Centreon, Op5 Monitor/Ninja, Check_MK Multisite and Thruk monitoring servers. It resides in systray, as a floating statusbar or fullscreen at the desktop showing a brief summary of critical, warning, unknown, unreachable and down hosts and services. It pops up a detailed status overview when being touched by the mouse pointer. Connections to displayed hosts and services are easily established by context menu via SSH, RDP, VNC or any self defined actions. Users can be notified by sound. Hosts and services can be filtered by category and regular expressions.

## Package Parameters
- `/UseInf:` - Change the inno setup configuration file to use/save when installing

**EXAMPLE**
`choco install nagstamon --params "'/UseInf:C:\nagstamon.inf'"`
