$ErrorActionPreference = 'Stop';
$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file           = "$toolsPath\Linux_Reader.exe"
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'DiskInternals Linux Reader'
}

Install-ChocolateyInstallPackage @packageArgs

$pp = Get-PackageParameters
$shortcutName = 'DiskInternals Research.lnk'
$shortcut = Join-Path ([Environment]::GetFolderPath("Desktop")) $shortcutName

if ($pp['NOICON']) {
  if (Test-Path $shortcut) {
    Remove-Item $shortcut
    Write-Host -ForegroundColor green 'Removed ' $shortcut
  }
  else {
    Write-Warning 'Did not find ' $shortcut
  }
}
