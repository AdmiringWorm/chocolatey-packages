$ErrorActionPreference = 'Stop';

$packageName  = $env:chocolateyPackageName

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = 'https://waveenginefiles.blob.core.windows.net/installers/WaveEngineSetup_2_4_1.exe'
  checksum      = '8aae5abbc4c3489bad00798cadf027b90c072eb13280106a2c4279971a73adf4'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs    = "/exenoui /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""

  softwareName  = 'WaveEngine'
}

Install-ChocolateyPackage @packageArgs
