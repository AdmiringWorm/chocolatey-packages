$ErrorActionPreference = 'Stop';

$packageName    = 'dilay'

$url32          = 'https://github.com/abau/dilay/releases/download/1.5.0/dilay-1.5.0.msi'
$checksum32     = '365a4538f109b8d5230c5eefffba2d309f7b272eb2017f66996e8be083a758a9'
$checksumType32 = 'sha256'

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
