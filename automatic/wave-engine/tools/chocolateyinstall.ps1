$ErrorActionPreference = 'Stop';

$packageName  = 'Wave Engine'
$url          = 'https://wave.blob.core.windows.net/waveinstallers/WaveEngineSetup_2_3_1.exe'
$checksum     = '00be934ad571fe408d78a9711417079b6513bafb9c68da8b988cf7b1e3bef3c7'
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
