$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$filePath = "$toolsDir\innosetup-5.6.1-unicode.exe"

$packageArgs = @{
	packageName   = 'innosetup'
	fileType      = 'exe'
	softwareName  = 'Inno Setup*'
  checksum      = '27D49E9BC769E9D1B214C153011978DB90DC01C2ACD1DDCD9ED7B3FE3B96B538'
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
