$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$filePath = "$toolsDir\innosetup-5.5.9-unicode.exe"

$packageArgs = @{
	packageName   = 'innosetup'
	fileType      = 'exe'
	softwareName  = 'Inno Setup*'
	file          = $filePath
	silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
	validExitCodes= @(0,3010,1641)
}

Install-ChocolateyInstallPackage @packageArgs

Remove-Item -Force $filePath

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
if ($installLocation) {
  Write-Host "$($packageArgs.packageName) installed to '$installLocation'"
  Register-Application "$installLocation\ISCC.exe"
  Register-Application "$installLocation\Compil32.exe" $packageArgs.packageName
  Install-BinFile "ISCC" "$installLocation\ISCC.exe"
} else {
  Write-Warning "Can't find $($packageArgs.packageName) install location"
}
