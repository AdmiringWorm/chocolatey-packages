$ErrorActionPreference = 'Stop';

$packageName  = 'Wave Engine'
$url          = 'https://wave.blob.core.windows.net/waveinstallers/WaveEngineSetup_2_3_1.exe'
$checksum     = 'a0ac361dcd60eef9180ac836aa7b8b382b65f357e2c6d5db5b1489b8d8ccd597'
$checksumType = 'sha256'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum     = $checksum
  checksumType = $checksumType

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = "/exenoui /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

  softwareName  = 'WaveEngine'
}

Install-ChocolateyPackage @packageArgs
