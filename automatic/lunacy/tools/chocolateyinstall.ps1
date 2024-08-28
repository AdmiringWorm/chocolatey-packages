$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://lcdn.icons8.com/setup/LunacySetup_10.0.1.exe'
  softwareName   = 'Lunacy'
  checksum       = '235ce920205e054fee9c82ff33b6cb82683ce5b7637a8f3f7443803573d235e039f72cd3c41493dab1b5023c9e8fa9f2991be7f1c72d66a45a64313bfdca8784'
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
