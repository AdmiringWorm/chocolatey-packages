$ErrorActionPreference = 'Stop';

$packageName  = 'Wave Engine'
$url          = 'https://wave.blob.core.windows.net/waveinstallers/WaveEngineSetup_2_3_0.exe'
$checksum     = '4ede0aa748ebb2f28385b6331205079a6753fa98beee09fc834221327ac159f8'
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
