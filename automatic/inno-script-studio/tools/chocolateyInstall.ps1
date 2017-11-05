$ErrorActionPreference = 'Stop'

$packageName = 'inno-script-studio'
$url = 'https://www.kymoto.org/downloads/ISStudio_Latest.exe'
$checksum = '9573ef597f822e7f234efcfc31e9c0cf9956925bf7347495f760a55bc9c440c6'
$checksumType = 'sha256'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs    = "/SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
  softwareName  = 'Inno Script Studio*'
}

$pp = Get-PackageParameters
if (!$pp.UseInf) {
  $pp.UseInf = "$env:TEMP\$env:chocolateyPackageName.Install.inf"
}

if (Test-Path "$($pp.UseInf)") {
  Write-Host "Using existing configuration file at '$($pp.UseInf)'"
  $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /LOADINF=`"$($pp.UseInf)`""
} else {
  Write-Host "Creating new configuration file at '$($pp.UseInf)'"
  $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /SAVEINF=`"$($pp.UseInf)`""
}

Install-ChocolateyPackage @packageArgs
