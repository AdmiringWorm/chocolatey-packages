$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$softwareName = 'Meld'

[array]$legacyMsiKeys = Get-UninstallRegistryKey -SoftwareName $softwareName | Where-Object {
  $_.UninstallString -match '(?i)\bmsiexec(?:\.exe)?\b'
}

$legacyMsiKeys | ForEach-Object {
  Write-Host "Removing legacy Meld MSI installation $($_.DisplayVersion)"
  $legacyUninstallArgs = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = $softwareName
    fileType       = 'msi'
    file           = ''
    silentArgs     = "$($_.PSChildName) /qn /norestart"
    validExitCodes = @(0, 1605, 1614, 1641, 3010)
  }

  Uninstall-ChocolateyPackage @legacyUninstallArgs
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = ''
  file64         = "$toolsPath\meld-3.24.0.exe"
  softwareName   = 'Meld'
  silentArgs     = '/S /AllUsers'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }

[array]$meldKeys = Get-UninstallRegistryKey -SoftwareName $softwareName | Where-Object {
  $_.UninstallString -notmatch '(?i)\bmsiexec(?:\.exe)?\b'
}

if ($meldKeys.Count -ne 1) {
  throw "Expected exactly one NSIS uninstall entry for Meld, but found $($meldKeys.Count)."
}

$meldExe = Join-Path $meldKeys[0].InstallLocation 'meld.exe'

if (Test-Path $meldExe -PathType Leaf) {
  Write-Host "Found executable path: $meldExe"
  Install-BinFile -Name meld -Path "$meldExe"
}
else {
  throw "Could not find meld.exe at '$meldExe'."
}
