$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://desk.icons8.com/lunacy/LunacySetup.exe'
  softwareName   = 'Lunacy'
  checksum       = '6EC065E6126D59B79C8212926C2678BE7806403A48BE7F67CB9BB42D54FA02ECD68288B5498363D75FCE46265983DC4850E53279146695ED10DA08914ED6C2ED'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
