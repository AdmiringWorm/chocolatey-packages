$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Heaven Benchmark*'
  fileType      = 'exe'
  url           = 'https://assets.unigine.com/d/Unigine_Heaven-4.0.exe'
  checksum      = 'abaddab621c71ccc43e907d0d6be957c87769c1c6f958e8c01e1eaaed6e2831db81aff9a95a017ed663d4b769c8cb077e390a4e189e33290129fdcabe4f06936'
  checksumType  = 'sha512'
  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
