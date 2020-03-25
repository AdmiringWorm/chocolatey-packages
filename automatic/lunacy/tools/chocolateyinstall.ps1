$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://desk.icons8.com/lunacy/LunacySetup.exe'
  softwareName   = 'Lunacy'
  checksum       = 'B680C5038B5CDF1216AAB768EAA2D846209A78C60BEF056B1CE259648E60CDAA01FCF40141AF696A7029FA6312D1E45FA5F19BDC49910E3ED6BCF368A0B550E9'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
