# AdmiringWorm's Chocolatey Community packages

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->

[![All Contributors](https://img.shields.io/badge/all_contributors-18-orange.svg?style=flat-square)](#contributors-)

<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Automatic Chocolatey Packages built by appveyor

[![GitHub Updater Status](https://img.shields.io/github/actions/workflow/status/AdmiringWorm/chocolatey-packages/.github%2Fworkflows%2Fpackage-updater.yml?style=flat-square&logo=github&label=updater)](https://github.com/AdmiringWorm/chocolatey-packages/actions/workflows/package-updater.yml)
[![Update Status](https://img.shields.io/badge/Status-blue?style=flat-square&label=Update)](https://gist.github.com/AdmiringWorm/747b3ede98c9404e5cb6a399595e7ad1)
[![chocolatey/AdmiringWorm](https://img.shields.io/badge/AdmiringWorm-yellowgreen?style=flat-square&logo=chocolatey&label=Chocolatey)](https://community.chocolatey.org/profiles/AdmiringWorm)

If you have any issues with one of the packages hosted in this repository, please feel free to open an issue (preferred instead of using `Contact Maintainers` on chocolatey.org).

This repository contains [chocolatey automatic packages](https://docs.chocolatey.org/en-us/create/automatic-packages).
The repository is setup so that you can manage your packages entirely from the GitHub web interface (using AppVeyor to update and push packages) and/or using the local repository copy.

On the community repository there are certain functions that can not be used inside the package.
Please see <https://gist.github.com/AdmiringWorm/500f244c0098dddfd36474f63d3216af> for currently known functions to avoid, or provide fallback helpers for.

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
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/ericbn"><img src="https://avatars3.githubusercontent.com/u/4120606?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Eric Nielsen</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Aericbn+label%3Abug" title="Bug reports">🐛</a></td>
    <td align="center"><a href="http://ruilopes.com"><img src="https://avatars3.githubusercontent.com/u/43356?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Rui Lopes</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Argl+label%3Abug" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://pauby.com"><img src="https://avatars2.githubusercontent.com/u/12760779?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Paul Broadwith</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Apauby+label%3Abug" title="Bug reports">🐛</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=pauby" title="Code">💻</a></td>
    <td align="center"><a href="https://twitter.com/scw"><img src="https://avatars3.githubusercontent.com/u/1314?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Shaun Walbridge</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Ascw" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/tylerszabo"><img src="https://avatars0.githubusercontent.com/u/315343?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Tyler Szabo</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Atylerszabo" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=tylerszabo" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/quincunx"><img src="https://avatars2.githubusercontent.com/u/279130?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Christian Schuerer-Waldheim</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Aquincunx+label%3Abug" title="Bug reports">🐛</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=quincunx" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/MathNum"><img src="https://avatars2.githubusercontent.com/u/30048020?v=4?s=100" width="100px;" alt=""/><br /><sub><b>MathNum</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3AMathNum" title="Ideas, Planning, & Feedback">🤔</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/apps/imgbot"><img src="https://avatars0.githubusercontent.com/in/4706?v=4?s=100" width="100px;" alt=""/><br /><sub><b>imgbot[bot]</b></sub></a><br /><a href="#content-imgbot[bot]" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/AeliusSaionji"><img src="https://avatars3.githubusercontent.com/u/4342746?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Aelius</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=AeliusSaionji" title="Code">💻</a></td>
    <td align="center"><a href="http://www.jimhester.com"><img src="https://avatars3.githubusercontent.com/u/205275?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Jim Hester</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=jimhester" title="Documentation">📖</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=jimhester" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/phihub"><img src="https://avatars2.githubusercontent.com/u/6604490?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Philipp</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Aphihub" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://ghuser.io/jayvdb"><img src="https://avatars1.githubusercontent.com/u/15092?v=4?s=100" width="100px;" alt=""/><br /><sub><b>John Vandenberg</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Ajayvdb" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://github.com/kintrupf"><img src="https://avatars3.githubusercontent.com/u/8496344?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Frank Kintrup</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Akintrupf+label%3Abug" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://github.com/soul4soul"><img src="https://avatars2.githubusercontent.com/u/5142635?v=4?s=100" width="100px;" alt=""/><br /><sub><b>soul4soul</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Asoul4soul" title="Ideas, Planning, & Feedback">🤔</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/michaelweghorn"><img src="https://avatars2.githubusercontent.com/u/6560939?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Michael Weghorn</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=michaelweghorn" title="Code">💻</a></td>
    <td align="center"><a href="http://www.zaltys.org"><img src="https://avatars2.githubusercontent.com/u/42079499?v=4?s=100" width="100px;" alt=""/><br /><sub><b>James Grant</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Ajamesg-nz" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="http://www.redheads.de"><img src="https://avatars.githubusercontent.com/u/2370091?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Moritz 'Morty' Strübe</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/issues?q=author%3Acmorty" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=cmorty" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/TakataSanshiro"><img src="https://avatars.githubusercontent.com/u/25909315?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Sanshiro</b></sub></a><br /><a href="https://github.com/AdmiringWorm/chocolatey-packages/commits?author=TakataSanshiro" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
