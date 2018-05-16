$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://desk.icons8.com/lunacy/LunacySetup.exe'
  softwareName   = 'Lunacy'
  checksum       = '8593766F9B64D080FC800B375C5F7D5A1D9FB52E3F727AFECA8A049B61BFB20E8BFE9A7B3BBB4CAD8BC4BD1246B877C7B972D52DCF2C7D0EE2261C4FA5850CC9'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
