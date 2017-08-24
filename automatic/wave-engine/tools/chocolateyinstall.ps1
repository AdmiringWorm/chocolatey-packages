$ErrorActionPreference = 'Stop';

$packageName  = $env:chocolateyPackageName

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = 'https://wave.blob.core.windows.net/waveinstallers/WaveEngineSetup_2_4_0.exe'
  checksum      = '3e7afc82bf779dead1ed1599c315332bfae458f427f1bf1655c721b243c8d8ef'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs    = "/exenoui /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

  softwareName  = 'WaveEngine'
}

Install-ChocolateyPackage @packageArgs
