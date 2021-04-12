$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://kcsoftwares.com/files/dumo_lite.exe'
  softwareName   = 'KC Softwares DUMo'
  checksum       = '7C97049530AACF85F8D8C0D806C9E17F2CD5C97C5F4DB7CF7604320C2669159C91E69DC3944484D006D243A5D339B3FD53ED851743C8B347AC96D6E4C1A53588'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

$ahkExec = Get-Command "AutoHotKey" | Select-Object -ExpandProperty Path

Write-Host "Closing DUmo..."
Start-ChocolateyProcessAsAdmin -exeToRun $ahkExec -statements "$toolsPath\install.ahk" -elevated:$false
