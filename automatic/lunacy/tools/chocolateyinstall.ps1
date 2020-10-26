$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://desktop.icons8.com/lunacy/LunacySetup_6.3.1.exe'
  softwareName   = 'Lunacy'
  checksum       = '68fb56ea181f6329f6d67360b33737d2317b2715daa5b60c9dbb2ba189d8eab1ddb11aa1a57d2ad0721e1b68f160ff85675fa168bab1dfda804e63567aaa762d'
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
