# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@c83e5c78e07916aca67a4eabb48fc5b81f17cef7/icons/geoserver.png" height="48" width="48" /> ![GeoServer](https://img.shields.io/chocolatey/v/geoserver.svg?label=GeoServer&style=for-the-badge)](https://community.chocolatey.org/packages/geoserver)

GeoServer implements industry standard OGC protocols such as Web Feature Service (WFS), Web Map Service (WMS), and Web Coverage Service (WCS). Additional formats and publication options are available as extensions including Web Processing Service (WPS), and Web Map Tile Service (WMTS).

## Notes

- This package do not install any form of Java, and before use fo the program the java of your choice needs to be installed.
  Some helpful packages to install java includes: [`javaruntime`](https://community.chocolatey.org/packages/javaruntime), [`adoptopenjdk-jre`](https://community.chocolatey.org/packages/adoptopenjdkjre).
- GeoServer is not shut down as part of the upgrade or uninstall process, please do so before upgrading this package.
- Shutdown and Startup scripts are available on `PATH` under the names `geoserver-startup` and `geoserver-shutdown`
