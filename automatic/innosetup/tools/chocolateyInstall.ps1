$ErrorActionPreference = 'Stop';

$packageName    = 'innosetup'
$url32          = 'http://files.jrsoftware.org/is/5/innosetup-5.5.9-unicode.exe'

$checksum32     = '5b51ae6977bebba937ac18e0e80c1899e37dfaa12f51ccd817978ef07ae19cb3'
$checksumType32 = 'sha256'

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'exe'
	softwareName  = 'Inno Setup*'

	checksum      = $checksum32
	checksumType  = $checksumType32
	url           = $url32

	silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
	validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
