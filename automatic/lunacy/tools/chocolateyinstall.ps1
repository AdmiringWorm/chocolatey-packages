$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://lun-eu.icons8.com/s/setup/LunacySetup_8.3.0.exe'
  softwareName   = 'Lunacy'
  checksum       = 'd9b7e31e886117d5c14d82baf6e3ab1698c33d8e958df4b4e93e99c8f89b94283f5dd1c570b8851e4b9d76637a54902d874238dbb0ec1366eb19ada8df5bb6d8'
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
