$ErrorActionPreference = 'Stop'

if ((Get-OSArchitectureWidth -Compare 32) -or $env:ChocolateyForceX86) {
  throw 'OnionShare now supports only 64-bit Windows. For 32-bit support, install version 2.6.0 with: choco install onionshare --version=2.6.0. The existing installation has not been changed.'
}

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Report-LegacyInstalls

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = ''
  file64         = "$toolsPath\OnionShare-win64-2.6.5.msi"
  softwareName   = 'OnionShare'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`" ALLUSERS=1 MSIINSTALLPERUSER=0"
  validExitCodes = @(0, 3010)
}

if (!(Test-Path -LiteralPath $packageArgs.file64 -PathType Leaf)) {
  throw "The embedded 64-bit installer is missing: $($packageArgs.file64)"
}

Uninstall-OnionShare32
Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.msi | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
