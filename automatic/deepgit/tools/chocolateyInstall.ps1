$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/downloads/deepgit/deepgit-win-4_3.zip'
  softwareName   = 'DeepGit'
  checksum       = 'bf2ca414efada03ae351c618c747580dfe263cceded6d3298480aff515f23e61f792536bed5587db5495c2eab07d6b7ade34c6bc84535c3b342a1743f61c420d'
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
