$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.brightfort.net/downloads/spywareblastersetup56.exe'

  softwareName   = 'SpywareBlaster *'
  checksum       = 'd371114362df3d5f0f725cb3991d0c38342fab4e343fd66f8260a7ce552cf4459a502be39a8329f02f238cfda25b9fb8e78c526199171f0f86382611b1cef2fe'
  checksumType   = 'sha512'

  silentArgs     = "/SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
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

Start-Process "autohotkey.exe" "$toolsPath\install.ahk"
Install-ChocolateyPackage @packageArgs
