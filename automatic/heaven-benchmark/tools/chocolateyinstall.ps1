$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Heaven Benchmark*'
  fileType      = 'exe'
  url           = 'https://assets.unigine.com/d/Unigine_Heaven-4.0.exe'
  checksum      = '2bcb187d4eb3323e209d1666521089f4cd91f62e1a54dde5a76bdad11c035bc47f2e31187921a746f3da8cca0b6b81ca6c546b025524fc933664bd6ca41f8bd7'
  checksumType  = 'sha512'
  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
