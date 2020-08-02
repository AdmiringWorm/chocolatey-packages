$ErrorActionPreference = 'Stop'

$uninstallArgs = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'NordVPN*'
  fileType       = 'msi'
  silentArgs     = ""
  validExitCodes = @(0, 3010, 1641)
}

$uninstalled = $false

[array]$key = Get-UninstallRegistryKey @packageArgs | Where-Object { $_.UninstallString -match 'MsiExec' }

if ($key.Count -eq 2 -or $key.Count -eq 1) {
  $key | ForEach-Object {
    $packageArgs['packageName'] = $_.DisplayName
    $packageArgs['silentArgs'] = "$($_.PSChildName) $uninstallArgs"
    $packageArgs['file'] = ''

    Uninstall-ChocolateyPackage @packageArgs
  }
}
elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.Count -gt 2) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert the package maintainer that the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}

Write-Host "Removing NordVPN certificates"
Get-ChildItem Cert:\LocalMachine\TrustedPublisher | Where-Object Subject -Match "nordvpn" | Remove-Item
