$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = "$toolsPath\Nagstamon-3.16.2-win32_setup.exe"
  file64         = "$toolsPath\Nagstamon-3.16.2-win64_setup.exe"
  softwareName   = 'Nagstamon*'
  silentArgs     = "/SILENT /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
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

Get-ChildItem $toolsPath\*.exe | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
