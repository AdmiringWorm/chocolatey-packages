# wormie-visualstudio.extension

This package contains modules that extends Chocolatey with the ability to manage Visual Studio Extensions for Visual Studio 2017 and above.
These functions may be used in Chocolatey install/uninstall scripts by declaring this package as a dependency in your package's nuspec file.

## Installation

Install via chocolatey: `choco install wormie-visualstudio.extension`

The module is usually automatically installed as a dependency.

## Usage

To create a package that uses an extension function, add the following to the `nuspec` specification:

```xml
<dependencies>
    <dependency id="wormie-visualstudio.extension" version="SPECIFY_LATEST_VERSION" />
</dependencies>
```

**NOTE:** Make sure you use adequate *minimum* version.

To test the functions you can import the module directory, or via the `chocolateyInstaller.psm1` module:

```powershell
PS> import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1
PS> import-module $env:ChocolateyInstall\extensions\wormie-visualstudio\*.psm1
```

You can now test any of the functions:

```powershell
PS> Install-VisualStudioExtension "packageName" "https://download.loc"
```

Keep in mind that function may work only in the context of the `chocolateyInstaller.ps1`.

To get the list of fucntions, load the module directory and invoke the following command:

```powershell
PS> Get-Command -Module wormie-visualstudio
```

To get the help for the specific function, use `man`:

```powershell
PS> man Install-VisualStudioExtension
```
