$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:chocolateyPackageName
  fileType      = 'exe'
  url           = 'https://www.kymoto.org/downloads/ISStudio_Latest.exe'
  checksum      = '03a8e6e59f7ad1bb087672000dcfce515452876e10a4cbd48be1cc087a520fcb'
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
