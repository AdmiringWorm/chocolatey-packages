$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = "$toolsPath\vacuum-im_1.2.5.20150608_win32-msvc2010_qt487.msi"
  softwareName   = 'vacuum-im*'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 2010, 1641)
}

$pp = Get-PackageParameters
if ($pp.GPO) {
  "Switching to GPO edition..."
  $packageArgs['file'] = "$toolsPath\vacuum-im_1.2.5.20150608_win32-msvc2010_qt487_GPO.msi"
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.msi | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }
