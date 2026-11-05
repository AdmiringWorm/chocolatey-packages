function Uninstall-OnionShare32() {
  # Upstream uses separate MSI upgrade codes for win32 and win64. Let the
  # win64 MSI handle its own upgrades; remove only the old win32 product family.
  $installer = New-Object -ComObject WindowsInstaller.Installer
  $upgradeCodes = @(
    '{E9DD4CB2-A74B-54B4-8389-1D554FE52C93}' # Briefcase MSI (2.3)
    '{12B9695C-965B-4BE0-BC33-21274E809576}' # WiX win32 MSI (through 2.6)
  )
  $productCodes = @($upgradeCodes | ForEach-Object { $installer.RelatedProducts($_) } | Select-Object -Unique)

  foreach ($productCode in $productCodes) {
    Write-Host 'Removing the previous 32-bit OnionShare MSI installation'
    $uninstallArgs = @{
      packageName    = $env:ChocolateyPackageName
      fileType       = 'msi'
      file           = ''
      silentArgs     = "$productCode /qn /norestart /l*v `"$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiMigration.log`""
      validExitCodes = @(0, 1605, 1614, 3010)
    }

    Uninstall-ChocolateyPackage @uninstallArgs
  }
}

function Report-LegacyInstalls() {
  [array]$keys = Get-UninstallRegistryKey "OnionShare*" | Where-Object {
    ($_.VersionMajor -eq 2 -and $_.VersionMinor -le 2) -or ($_.VersionMajor -le 1)
  }

  $keys | ForEach-Object {
    Write-Warning "Legacy installation of OnionShare was found, but no action has been taken"
    Write-Warning "Please uninstall OnionShare $($_.DisplayVersion) manually from Program & Software..."
  }
}
