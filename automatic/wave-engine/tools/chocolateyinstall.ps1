$ErrorActionPreference = 'Stop';

$packageName  = $env:chocolateyPackageName

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = ''
  checksum      = ''
  checksumType  = ''

  validExitCodes= @(0, 3010, 1641)
  silentArgs    = "/exenoui /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

  softwareName  = 'WaveEngine'
}

Install-ChocolateyPackage @packageArgs
