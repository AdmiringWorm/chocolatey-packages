$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.mindgems.com/software/FolderSize.exe'
  softwareName   = 'Folder Size*'
  checksum       = '0033D66BB58CD5B3EAEE0260D8B111B3C12D64298E4C4EE9C879F34BFB42BA63B9783C8338A11FAD1BBCCFD38FEC14987D8383BBBF0FAD4E6AD35B1EF0C3BA8C'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
