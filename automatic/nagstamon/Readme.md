# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@612b4f83873a31681e7fd54bd99b0737dc906d52/automatic/nagstamon/icons/256x256.png" height="48" width="48" /> ![Nagstamon](<https://img.shields.io/chocolatey/v/nagstamon.svg?label=Nagstamon%20(Install)&style=for-the-badge>)](https://community.chocolatey.org/packages/nagstamon)

Nagstamon is a status monitor for the desktop. It connects to multiple Nagios, Icinga, Opsview, Centreon, Op5 Monitor/Ninja, Check_MK Multisite and Thruk monitoring servers. It resides in systray, as a floating statusbar or fullscreen at the desktop showing a brief summary of critical, warning, unknown, unreachable and down hosts and services. It pops up a detailed status overview when being touched by the mouse pointer. Connections to displayed hosts and services are easily established by context menu via SSH, RDP, VNC or any self defined actions. Users can be notified by sound. Hosts and services can be filtered by category and regular expressions.

## Package Parameters

- `/UseInf:` - Change the inno setup configuration file to use/save when installing

**EXAMPLE**
`choco install nagstamon --params "'/UseInf:C:\nagstamon.inf'"`
