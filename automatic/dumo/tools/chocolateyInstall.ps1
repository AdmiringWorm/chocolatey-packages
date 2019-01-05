$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = ''
  softwareName   = 'dumo*'
  checksum       = ''
  checksumType   = ''
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

$ahkExec = Get-Command "AutoHotKey" | select -ExpandProperty Path

Write-Host "Closing DUmo..."
Start-ChocolateyProcess -exeToRun $ahkExec -statements "$toolsPath\install.ahk" -elevated:$false
