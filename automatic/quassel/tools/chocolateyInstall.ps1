$ErrorActionPreference = 'Stop'
$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$fileLocation   = Get-Item $toolsPath\*_x32.exe
$file64Location = Get-Item $toolsPath\*_x64.exe

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = $fileLocation
  file64         = $file64Location
  softwareName   = 'Quassel*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
