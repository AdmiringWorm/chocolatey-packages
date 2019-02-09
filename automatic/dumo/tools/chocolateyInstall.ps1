$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://kcsoftwares.com/files/dumo_lite.exe'
  softwareName   = 'KC Softwares DUMo'
  checksum       = '28F2CFB15F48D99D81FDA90DF9C5D1E2D2C177DF21FC8E4F4D141D2895E09C1D7C0365FD26185DDC9472DBB4452BE82B8F44E19903C979DD15C6AC4860027D01'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

$ahkExec = Get-Command "AutoHotKey" | Select-Object -ExpandProperty Path

Write-Host "Closing DUmo..."
Start-ChocolateyProcessAsAdmin -exeToRun $ahkExec -statements "$toolsPath\install.ahk" -elevated:$false
