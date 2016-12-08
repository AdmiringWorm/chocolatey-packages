$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$filePath = "$toolsDir\dilay-1.5.0.msi"

$packageArgs = @{
	packageName   = 'dilay'
	fileType      = 'msi'
	softwareName  = 'Dilay'
	file          = $filePath
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
	validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force $filePath
