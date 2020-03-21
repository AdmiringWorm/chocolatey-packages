$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/downloads/deepgit/deepgit-win-setup-4.zip'
  softwareName   = 'DeepGit'
  checksum       = 'c0c12bcb4cf06c363156a2e7de63299bef515d40bcc48195a54261b6caf355ef7f0df0a3e83fcfff427db5231b45c178e5600918ac8160758a08ee155000c433'
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
