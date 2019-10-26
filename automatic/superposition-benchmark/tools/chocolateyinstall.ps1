$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Unigine Superposition Benchmark*'
  fileType      = 'exe'
  url           = 'https://assets.unigine.com/d/Unigine_Superposition-1.1.exe'
  checksum      = 'f9fed5eb8eeb54a533900278fc6b6ec6472e89b4d5a7088e123010e7029111f079d7a15132fac43f34c0fb5336e8b53aeba009ff6acbd5ceb011ba4c20f737ea'
  checksumType  = 'sha512'
  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
