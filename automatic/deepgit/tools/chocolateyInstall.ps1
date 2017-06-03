$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-2_0_1.zip'
  softwareName   = 'DeepGit'
  checksum       = 'ba07cacc66357ffd7260af51bfd90fa995bf2d5e1b055b7a0e2d9a4e056e6bf30cdc5187c92e95595934d7b82e5421a20b9ae08fbad735a6504062323411b8c5'
  checksumType   = 'sha512'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | % { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
