$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.brightfort.net/downloads/spywareblastersetup60.exe'

  softwareName   = 'SpywareBlaster *'
  checksum       = '228dc0d7865e01c893aa5156b36ac9cc19d27044acac96e432e68951a90b878ff6216fc43619a11f85b533993ee93eeb6017978240969873e9e3ea04aa620541'
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
