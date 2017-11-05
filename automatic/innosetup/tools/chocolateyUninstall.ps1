﻿$ErrorActionPreference = 'Stop';

$packageName = 'innosetup'
$softwareName = 'Inno Setup*'
$installerType = 'EXE'

$silentArgs = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoUninstall.log`""
$validExitCodes = @(0)

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
	$key | % {
		$file = "$($_.UninstallString.Trim('"'))"

	Uninstall-ChocolateyPackage `
		-PackageName $packageName `
		-FileType $installerType `
		-SilentArgs "$silentArgs" `
		-ValidExitCodes $validExitCodes `
		-File "$file"
	}
} elseif ($key.Count -eq 0) {
	Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
	Write-Warning "$key.Count matches found!"
	Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
	Write-Warning "Please alert package maintainer the following keys were matched:"
	$key | % {Write-Warning "- $_.DisplayName"}
}

$appPathKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\"
if (Test-Path "$appPathKey\ISCC.exe") { Remove-Item "$appPathKey\ISCC.exe" -Force }
if (Test-Path "$appPathKey\$packageName.exe") { Remove-Item "$appPathKey\$packageName.exe" -Force }
Uninstall-BinFile "ISCC"
