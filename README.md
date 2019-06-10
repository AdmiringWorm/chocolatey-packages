# AdmiringWorm's Chocolatey Community packages
[![All Contributors](https://img.shields.io/badge/all_contributors-9-orange.svg?style=flat-square)](#contributors)
[![Liberapay donations](https://img.shields.io/liberapay/receives/admiringworm.svg?logo=liberapay&style=flat-square)]()

## Automatic Chocolatey Packages built by appveyor

[![Join the chat at https://gitter.im/wormie-packages/Lobby](https://badges.gitter.im/wormie-packages/Lobby.svg)](https://gitter.im/wormie-packages/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![AppVeyor Update Status](https://ci.appveyor.com/api/projects/status/github/AdmiringWorm/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/AdmiringWorm/chocolatey-packages)
[![Update Status](https://img.shields.io/badge/Update-Status-blue.svg)](https://gist.github.com/AdmiringWorm/747b3ede98c9404e5cb6a399595e7ad1)
[![chocolatey/AdmiringWorm](https://img.shields.io/badge/Chocolatey-AdmiringWorm-yellowgreen.svg)](https://chocolatey.org/profiles/AdmiringWorm)
[![Open Source Helpers](https://www.codetriage.com/admiringworm/chocolatey-packages/badges/users.svg)](https://www.codetriage.com/admiringworm/chocolatey-packages)

If you have any issues with one of the packages hosted in this repository, please feel free to open an issue (preferred instead of using `Contact Maintainers` on chocolatey.org), or jump into my [gitter channel](https://gitter.im/wormie-packages/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge).

This repository contains [chocolatey automatic packages](https://chocolatey.org/docs/automatic-packages).
The repository is setup so that you can manage your packages entirely from the GitHub web interface (using AppVeyor to update and push packages) and/or using the local repository copy.

## Prerequisites

To run locally you will need:

- Powershell 5+: `cinst powershell`.
- [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au): `Install-Module au` or `cinst au`.
- [Wormies Automatic Updater Helpers](https://github.com/WormieCorp/Wormies-AU-Helpers): `Install-Module wormies-au-helpers` or `cinst wormies-au-helpers`.

## Create a package

To create a new package see [Creating the package updater script](https://github.com/majkinetor/au#creating-the-package-updater-script).

## Testing the package

In a package directory run: `Test-Package`. This function can be used to start testing in [chocolatey-test-environment](https://github.com/majkinetor/chocolatey-test-environment) via `Vagrant` parameter or it can test packages locally.

## Automatic package update

### Single package

Run from within the directory of the package to update that package:

    cd <package_dir>
    ./update.ps1

If this script is missing, the package is not automatic.
Set `$au_Force = $true` prior to script call to update the package even if no new version is found.

### Multiple packages

To update all packages run `./update_all.ps1`. It accepts few options:

```powershell
./update_all.ps1 -Name a*                         # Update all packages which name start with letter 'a'
./update_all.ps1 -ForcedPackages 'cpu-z copyq'    # Update all packages and force cpu-z and copyq
./update_all.ps1 -ForcedPackages 'copyq:1.2.3'    # Update all packages but force copyq with explicit version
./update_all.ps1 -Root 'c:\packages'              # Update all packages in the c:\packages folder
```

The following global variables influence the execution of `update_all.ps1` script if set prior to the call:

```powershell
$au_NoPlugins = $true        #Do not execute plugins
$au_Push      = $false       #Do not push to chocolatey
```

You can also call AU method `Update-AUPackages` (alias `updateall`) on its own in the repository root. This will just run the updater for the each package without any other option from `update_all.ps1` script. For example to force update of all packages with a single command execute:

    updateall -Options ([ordered]@{ Force = $true })

## Pushing To Community Repository Via Commit Message

You can force package update and push using git commit message. AppVeyor build is set up to pass arguments from the commit message to the `./update_all.ps1` script.

If commit message includes `[AU <forced_packages>]` message on the first line, the `forced_packages` string will be sent to the updater.

Examples:

- `[AU pkg1 pkg2]`

Force update ONLY packages `pkg1` and `pkg2`.

- `[AU pkg1:ver1 pkg2 non_existent]`

Force `pkg1` and use explicit version `ver1`, force `pkg2` and ignore `non_existent`.

To see how versions behave when package update is forced see the [force documentation](https://github.com/majkinetor/au/blob/master/README.md#force-update).

You can also push manual packages with command `[PUSH pkg1 ... pkgN]`. This works for any package anywhere in the file hierarchy and will not invoke AU updater at all.

If there are no changes in the repository use `--allow-empty` git parameter:

    git commit -m '[AU copyq less:2.0]' --allow-empty
    git push

## Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<table><tr><td align="center"><a href="https://github.com/ericbn"><img src="https://avatars3.githubusercontent.com/u/4120606?v=4" width="100px;" alt="Eric Nielsen"/><br /><sub><b>Eric Nielsen</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Aericbn+label%3Abug" title="Bug reports">🐛</a></td><td align="center"><a href="http://ruilopes.com"><img src="https://avatars3.githubusercontent.com/u/43356?v=4" width="100px;" alt="Rui Lopes"/><br /><sub><b>Rui Lopes</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Argl+label%3Abug" title="Bug reports">🐛</a></td><td align="center"><a href="https://pauby.com"><img src="https://avatars2.githubusercontent.com/u/12760779?v=4" width="100px;" alt="Paul Broadwith"/><br /><sub><b>Paul Broadwith</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Apauby+label%3Abug" title="Bug reports">🐛</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=pauby" title="Code">💻</a></td><td align="center"><a href="https://twitter.com/scw"><img src="https://avatars3.githubusercontent.com/u/1314?v=4" width="100px;" alt="Shaun Walbridge"/><br /><sub><b>Shaun Walbridge</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Ascw" title="Ideas, Planning, & Feedback">🤔</a></td><td align="center"><a href="https://github.com/tylerszabo"><img src="https://avatars0.githubusercontent.com/u/315343?v=4" width="100px;" alt="Tyler Szabo"/><br /><sub><b>Tyler Szabo</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Atylerszabo" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=tylerszabo" title="Code">💻</a></td><td align="center"><a href="https://github.com/quincunx"><img src="https://avatars2.githubusercontent.com/u/279130?v=4" width="100px;" alt="Christian Schuerer-Waldheim"/><br /><sub><b>Christian Schuerer-Waldheim</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Aquincunx+label%3Abug" title="Bug reports">🐛</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=quincunx" title="Code">💻</a></td><td align="center"><a href="https://github.com/MathNum"><img src="https://avatars2.githubusercontent.com/u/30048020?v=4" width="100px;" alt="MathNum"/><br /><sub><b>MathNum</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3AMathNum" title="Ideas, Planning, & Feedback">🤔</a></td></tr><tr><td align="center"><a href="https://github.com/apps/imgbot"><img src="https://avatars0.githubusercontent.com/in/4706?v=4" width="100px;" alt="imgbot[bot]"/><br /><sub><b>imgbot[bot]</b></sub></a><br /><a href="#content-imgbot[bot]" title="Content">🖋</a></td><td align="center"><a href="https://github.com/AeliusSaionji"><img src="https://avatars3.githubusercontent.com/u/4342746?v=4" width="100px;" alt="Aelius"/><br /><sub><b>Aelius</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=AeliusSaionji" title="Code">💻</a></td></tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
