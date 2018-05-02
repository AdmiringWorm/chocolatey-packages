$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:chocolateyPackageName
  fileType      = 'exe'
  url           = 'https://www.kymoto.org/downloads/ISStudio_Latest.exe'
  checksum      = '3e453334a89edcf6e50439e3296ec84913f6bb0c2b3efcb469c11ec8965d10bb'
  checksumType  = 'sha256'
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
