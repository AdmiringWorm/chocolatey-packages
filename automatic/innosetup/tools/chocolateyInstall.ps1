﻿$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$filePath = "$toolsDir\innosetup-6.0.2.exe"

$packageArgs = @{
	packageName   = 'innosetup'
	fileType      = 'exe'
	softwareName  = 'Inno Setup*'
  checksum      = '4AF479BD44E2BFB2A4BFAB6A19F9563E370EF52D86362E7B3D198E9DAFF62B64'
  checksumType  = 'sha256'
	file          = $filePath
	silentArgs    = "/SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
	validExitCodes= @(0,3010,1641)
}

$pp = Get-PackageParameters
if ($pp.UseInf) {
  if (Test-Path "$($pp.UseInf)") {
    Write-Host "Using existing configuration file at '$($pp.UseInf)'"
    $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /LOADINF=`"$($pp.UseInf)`""
  } else {
    Write-Host "Creating new configuration file at '$($pp.UseInf)'"
    $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /SAVEINF=`"$($pp.UseInf)`""
  }
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force $filePath

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
if ($installLocation) {
  Write-Host "$($packageArgs.packageName) installed to '$installLocation'"
  Register-Application "$installLocation\ISCC.exe"
  Register-Application "$installLocation\Compil32.exe" $packageArgs.packageName
  Install-BinFile "ISCC" "$installLocation\ISCC.exe"
} else {
  Write-Warning "Can't find $($packageArgs.packageName) install location"
}
