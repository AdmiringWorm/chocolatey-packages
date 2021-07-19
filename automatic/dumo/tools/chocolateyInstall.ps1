$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://kcsoftwares.com/files/dumo_lite.exe'
  softwareName   = 'KC Softwares DUMo'
  checksum       = '340D3AF748D1F9C191A777753AD838585FC688AB86EF42C3AD2CDA70B6252CE54CED390D034C20597C1D2B1B236AF92A9437F58370784D5642DC0805EA82F3B2'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

$ahkExec = Get-Command "AutoHotKey" | Select-Object -ExpandProperty Path

Write-Host "Closing DUmo..."
Start-ChocolateyProcessAsAdmin -exeToRun $ahkExec -statements "$toolsPath\install.ahk" -elevated:$false
