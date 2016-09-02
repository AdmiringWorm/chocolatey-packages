$ErrorActionPreference = 'Stop';

$packageName  = 'Wave Engine'
$url          = 'https://wave.blob.core.windows.net/waveinstallers/WaveEngineSetup_2_2_1.exe'
$checksum     = '2d88e6cbfb0841e60c97d8541fc7f9957d8d03b3ae18400ecc6b5f853dd0b1e9'
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
