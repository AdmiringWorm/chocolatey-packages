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

#Create shim
$installlogfile="$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log"
Write-Host "Searching for meld.exe installation directory in  $installlogfile"
$meldExe = Get-Content $installlogfile | Select-String -Pattern 'TARGETDIR\s*,\s*Object: ([^,]*)$' | % {$_.matches.groups[1].Value}
$meldExe = "$($meldExe)meld.exe"

if( Test-Path $meldExe -PathType Leaf ) {
  Install-BinFile -Name meld -Path "$meldExe"
} else {
  Write-Host "Could not find meld.exe at `"$meldExe`" - not Shimming"
}
