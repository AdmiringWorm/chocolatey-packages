$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Unigine Valley Benchmark*'
  fileType      = 'exe'
  url           = 'https://assets.unigine.com/d/Unigine_Valley-1.0.exe'
  checksum      = '753224d5557d13035097b514e6bb5fffe5195432dbb79742fd26d681598bf0fc7a9d0836182fa5b86c2b25c8ea7db8505c411710e885703d8a1d2c0bf64fa185'
  checksumType  = 'sha512'
  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
