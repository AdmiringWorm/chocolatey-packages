$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-2.zip'
  softwareName   = 'DeepGit'
  checksum       = '8a65534e5bc1897fda7f5e91b4f7f4f52f2517abda2d09cd8f9957d10cf5a0b0254a178b5bc09dbeace8b0c878fded2858bb59a32e5bea1b0c22c7fc017fe241'
  checksumType   = 'sha512'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | % { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
