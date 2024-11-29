$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://lcdn.icons8.com/setup/LunacySetup_10.8.0.exe'
  softwareName   = 'Lunacy'
  checksum       = '12700d6c9d1bd95f6c2aaae53e09c6f23dd5b0d96e7b0bc67586f7f8cd14330e9c2f7a39a2831c20544a0ca8aa8a6b90b9b05b50c004d42625ecc6c3c46bfb38'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

Write-Host "Waiting 10 seconds for Lunacy program to open..."
Start-Sleep -Seconds 10
$process = Get-Process -Name "Lunacy" -ErrorAction SilentlyContinue

if ($process) {
  Write-Host "Trying to close Lunacy..."
  $process.CloseMainWindow() | Out-Null
}
