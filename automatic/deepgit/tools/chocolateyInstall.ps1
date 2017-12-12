$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-3_0_2.zip'
  softwareName   = 'DeepGit'
  checksum       = 'bb0c65072d15388a5f6c55de76b4f3a19d1d3613a03d753af1b521f659d960a54701da1055ad59c0eae1e3991c44fdc861fcc4fd5ef9fc9fb2ac7c490e79ae24'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
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

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | % { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
