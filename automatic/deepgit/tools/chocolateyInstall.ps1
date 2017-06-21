$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-2_0_2.zip'
  softwareName   = 'DeepGit'
  checksum       = 'bcee471488c149f74e74cc9260c7206af3563d429a506bb3a303b0c443c59b8354de44d0b34654a245c56883c3cd225659c98f346475bd4756adfe18b6e2d819'
  checksumType   = 'sha512'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | % { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
