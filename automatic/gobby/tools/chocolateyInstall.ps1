$ErrorActionPreference = 'Stop';

$packageName    = 'gobby'

$url32          = ''

$checksum32     = ''
$checksumType32 = ''

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = "Gobby*"

  checksum      = $checksum32
  checksumType  = $checksumType32
  url           = $url32

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
