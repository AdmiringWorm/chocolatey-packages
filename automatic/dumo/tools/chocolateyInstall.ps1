$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://kcsoftwares.com/files/dumo_lite.exe'
  softwareName   = 'KC Softwares DUMo'
  checksum       = 'EA2F17E776EE6034C78F6E6F738F95561E9C402728AC2EEC6456746D9D073327A9AB68712FCD76526CADAD79FDEA7CD74A4E0D34AB8DCE4E444DB2AD9221D9AB'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

$ahkExec = Get-Command "AutoHotKey" | Select-Object -ExpandProperty Path

Write-Host "Closing DUmo..."
Start-ChocolateyProcessAsAdmin -exeToRun $ahkExec -statements "$toolsPath\install.ahk" -elevated:$false
