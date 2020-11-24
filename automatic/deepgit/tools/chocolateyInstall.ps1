$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/downloads/deepgit/deepgit-win-setup-4_1.zip'
  softwareName   = 'DeepGit'
  checksum       = '636b81c83ab56d221b889038e2d2855ebfce1a39d35ce429b09d21a27a630c47cc6bbacbda7c8d921d39e78cdbb7ffd66acf6f062f44b321e7d3896f502ede43'
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
