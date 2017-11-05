$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'r.project'
  fileType      = 'exe'
  softwareName  = 'R for Windows*'
  file          = "$toolsDir\R-3.4.2-win.exe"
  silentArgs    = "/SILENT /NORESTART /SP- /SUPPRESSMSGBOXES"
  validExitCodes= @(0)
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

Install-ChocolateyInstallPackage @packageArgs
