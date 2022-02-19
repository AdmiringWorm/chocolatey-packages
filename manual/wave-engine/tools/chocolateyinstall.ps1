$ErrorActionPreference = 'Stop';

$packageName  = $env:chocolateyPackageName

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = 'https://waveenginefiles.blob.core.windows.net/installers/WaveEngineSetup_2_5_0.exe'
  checksum      = '29b17c94bc4fe021b34dbe55f7ac337b8669fd86dcd36e122ed3aa703e80849b'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs    = "/exenoui /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

  softwareName  = 'Wave Engine'
}

Install-ChocolateyPackage @packageArgs
