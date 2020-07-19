$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

. "$toolsPath/helpers.ps1"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = "$toolsPath\lilypond-2.20.0-1.mingw.exe"
  softwareName   = 'LilyPond'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

$key = Get-UninstallRegistryKey @packageArgs | Select-Object -First 1

if ($key) {
  Write-Host "Removing previously installed LilyPond application."
  Uninstall-LilyPond $key
  Start-Sleep -Seconds 3
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
