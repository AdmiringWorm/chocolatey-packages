$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/downloads/deepgit/deepgit-win-setup-4_2.zip'
  softwareName   = 'DeepGit'
  checksum       = '3766d662c2442c6be3995850f64118f7f655b8444fffc285e477498d8e2dff26fd4a9c71a906f14a54481ad51ed8d199fa498318293d32d6385f1dae34178ca7'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
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

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | ForEach-Object { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
