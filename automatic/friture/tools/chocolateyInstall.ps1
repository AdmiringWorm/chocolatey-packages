$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$uninstallKey = Get-UninstallRegistryKey 'friture*' | Where-Object ModifyPath -NotMatch 'Msi'

if ($uninstallKey) {
  . "$toolsPath\helpers.ps1"

  Write-Host 'Uninstalling old versions of Friture'
  $uninstallKey | ForEach-Object { Uninstall-Program $_.UninstallString }
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = "$toolsPath\friture-0.36-20190201.exe"
  softwareName   = 'Friture*'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*. | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
