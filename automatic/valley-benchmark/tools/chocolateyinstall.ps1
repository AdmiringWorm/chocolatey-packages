$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Unigine Valley Benchmark*'
  fileType      = 'exe'
  url           = 'https://assets.unigine.com/d/Unigine_Valley-1.0.exe'
  checksum      = '3af5226446b4cb15e2ef9b00e96d4962fea04d0353cdae6f334bde6e4fa59a4449aee2a0d02508fabd357e411c4762fa24f8d1268149a510579ffd71a23e1117'
  checksumType  = 'sha512'
  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
