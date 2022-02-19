# Automatic Folder

This is where you put your Chocolatey packages that are automatically packaged up by [AU](https://community.chocolatey.org/packages/au).

## Automatic Updater (AU)

AU Works with packages without automatic package tokens necessary. So you can treat the packages as normal.

**NOTE:** Ensure when you are creating packages for AU, you don't use `--auto` as the packaging files should be normal packages.
AU doesn't need the tokens to do replacement (And it will fail the build if the version in the .nuspec file isn't a valid version).
