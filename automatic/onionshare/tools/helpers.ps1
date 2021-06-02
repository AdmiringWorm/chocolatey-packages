function Report-LegacyInstalls() {
  [array]$keys = Get-UninstallRegistryKey "OnionShare*" | Where-Object {
    ($_.VersionMajor -eq 2 -and $_.VersionMinor -le 2) -or ($_.VersionMajor -le 1)
  }

  $keys | ForEach-Object {
    Write-Warning "Legacy installation of OnionShare was found, but no action has been taken"
    Write-Warning "Please uninstall OnionShare $($_.DisplayVersion) manually from Program & Software..."
  }
}
