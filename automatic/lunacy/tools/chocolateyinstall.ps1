$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://lun-eu.icons8.com/s/setup/LunacySetup_8.6.2.exe'
  softwareName   = 'Lunacy'
  checksum       = '79942a0ce261e4432afddab42f9dd7b1149a2a54bd748730576de108d67e2b2c5980408d50746d14cefefe797b73be66b454b4ab92037748b39e2865a22657e4'
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
