$ErrorActionPreference = 'Stop'

$packageName = 'inno-script-studio'
$url = 'https://www.kymoto.org/downloads/ISStudio_Latest.exe'
$checksum = '9573ef597f822e7f234efcfc31e9c0cf9956925bf7347495f760a55bc9c440c6'
$checksumType = 'sha256'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
  softwareName  = 'Inno Script Studio*'
}

Install-ChocolateyPackage @packageArgs
