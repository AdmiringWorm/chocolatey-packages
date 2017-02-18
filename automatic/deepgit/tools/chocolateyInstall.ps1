$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-1_0_1.zip'
  softwareName   = 'DeepGit'
  checksum       = '67ed158795f3c23a83e54620c00337cba148d70dcaeea94e8423fa5c8c585981b9d6c87b8b884094f5517a9030a05b648fca86e2a0f8aaaa9eea966cd5ee80ed'
  checksumType   = 'sha512'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | % { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
