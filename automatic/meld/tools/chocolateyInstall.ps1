$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = "$toolsPath\Meld-3.20.3-mingw.msi"
  softwareName   = 'Meld'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 2010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.msi | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" } }

$meldExe = @(
  "HKLM:\SOFTWARE\Meld"
  "HKLM:\SOFTWARE\Wow6432Node\Meld"
) | Where-Object {
  Test-Path $_
} | ForEach-Object {
  $key = Get-ItemProperty $_ -Name "Executable" -ea 0 | ForEach-Object Executable
  if ($key) { Write-Host "Found executable path: $key" }
  $key
} | Select-Object -First 1

if ( Test-Path $meldExe -PathType Leaf ) {
  Install-BinFile -Name meld -Path "$meldExe"
}
else {
  Write-Host "Could not find meld.exe at `"$meldExe`" - not Shimming"
}
