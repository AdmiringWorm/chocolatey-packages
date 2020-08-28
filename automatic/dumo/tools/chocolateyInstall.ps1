$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://kcsoftwares.com/files/dumo_lite.exe'
  softwareName   = 'KC Softwares DUMo'
  checksum       = '57C7797465B27E0AB05FAFF87ADDC25E7B3DCA57D40E1312F8417FE1FCE1AFC841702DBD2EE0A48DCFA937762F338DB9206CD48E068E2B7E93750314219EF850'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

$ahkExec = Get-Command "AutoHotKey" | Select-Object -ExpandProperty Path

Write-Host "Closing DUmo..."
Start-ChocolateyProcessAsAdmin -exeToRun $ahkExec -statements "$toolsPath\install.ahk" -elevated:$false
