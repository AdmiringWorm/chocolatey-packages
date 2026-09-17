$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:chocolateyPackageName
  fileType      = 'exe'
  url           = 'https://www.kymoto.org/downloads/ISStudio_Latest.exe'
  checksum      = 'f2fa1c24674de9fc6aa60aa003d7daa8271ff1713def2c2119322c9a7e577b17'
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
