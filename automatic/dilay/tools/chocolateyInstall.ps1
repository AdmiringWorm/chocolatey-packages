$ErrorActionPreference = 'Stop';

$packageName    = 'dilay'

$url32          = ''
$checksum32     = ''
$checksumType32 = ''

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	softwareName  = 'Dilay'

	checksum      = $checksum32
	checksumType  = $checksumType32
	url           = $url32

	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
	validExitCodes= @(0,3010,1641)
}

Install-ChocolateyPackage @packageArgs
