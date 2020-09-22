$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:chocolateyPackageName
  fileType      = 'exe'
  url           = 'https://www.kymoto.org/downloads/ISStudio_Latest.exe'
  checksum      = '0a1b9c7fb0a199da14bddd6bef52318134e8a39418a97fc9ee1f7367e71c997e'
  checksumType  = 'sha256'
  silentArgs    = "/SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
  softwareName  = 'Inno Script Studio*'
}

$pp = Get-PackageParameters
if ($pp.UseInf) {
  if (Test-Path "$($pp.UseInf)") {
    Write-Host "Using existing configuration file at '$($pp.UseInf)'"
    $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /LOADINF=`"$($pp.UseInf)`""
  }
  else {
    Write-Host "Creating new configuration file at '$($pp.UseInf)'"
    $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /SAVEINF=`"$($pp.UseInf)`""
  }
}

Install-ChocolateyPackage @packageArgs
