$ErrorActionPreference = 'Stop';

[array]$key = Get-UninstallRegistryKey -SoftwareName 'GhostDoc Pro'
$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    . "$toolsDir\helpers.ps1"
    UninstallGhostDoc "$($_.PSChildName)"
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$env:chocolateyPackageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert the package maintainer that the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}
