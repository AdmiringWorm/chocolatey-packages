$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://desk.icons8.com/lunacy/LunacySetup.exe'
  softwareName   = 'Lunacy'
  checksum       = 'E6815E8143DEC1C9A917F6D613489451067BB9A0A01628654A7B64CD0AA674971A6B9F685A2FA4439411468EC52685DDD1F7D3A5ACDA21A0B5D6151A3722BD1F'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
