$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

. "$toolsDir/helpers.ps1"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  softwareName = 'LilyPond'
}

$uninstalled = $false

[array]$key = Get-UninstallRegistryKey @packageArgs

if ($key.Count -eq 1) {
  $key | ForEach-Object {

    Uninstall-LilyPond $_

  }
}
elseif ($key.Count -eq 0) {
  Write-Warning "$($packageArgs.packageName) has already been uninstalled by other means."
}
elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert the package maintainer that the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}
