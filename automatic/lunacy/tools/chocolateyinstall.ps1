$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://desk.icons8.com/lunacy/LunacySetup.exe'
  softwareName   = 'Lunacy'
  checksum       = 'F1DDF7EECF30DD2B5DEE5132644F00EBF1D1D3181A9C8E763C8AA5E1923F7C1D71A319A7DFAE6EFDA7013B98B29F54ED2A4D91256B4766BBA13A471EE83003AB'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
