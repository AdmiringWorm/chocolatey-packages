$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-3_0_1.zip'
  softwareName   = 'DeepGit'
  checksum       = 'd0b2e9fb58ee41ce3520290b235c43a4d3c17cb7d74f2d93dea1f4dcc1edca5c65997c46cc6a76c97f71711e3c0b37ee4ec974dfe9b78ec57b46606f1b66be61'
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
