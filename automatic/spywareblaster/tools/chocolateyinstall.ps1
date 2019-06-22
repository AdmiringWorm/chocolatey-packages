$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.brightfort.net/downloads/spywareblastersetup55.exe'

  softwareName   = 'SpywareBlaster *'
  checksum       = '616d909a54e2f7ece430056ee3c59834e05728b16f583733c775cea6d2e1d36d93f8dd772e30d68373c0929ba2f117d6d1036fc6da83b90f13da1f131c6a4f9a'
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
