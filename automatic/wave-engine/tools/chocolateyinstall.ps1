$ErrorActionPreference = 'Stop';

$packageName  = $env:chocolateyPackageName

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = 'https://waveenginefiles.blob.core.windows.net/installers/WaveEngineSetup_2_5_0.exe'
  checksum      = '00fcad5db799b6731db76ea7401f34ccd999b558d6a67dfe48baf06ad437b091'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs    = "/exenoui /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

  softwareName  = 'Wave Engine'
}

Install-ChocolateyPackage @packageArgs
