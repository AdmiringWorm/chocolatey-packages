$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.syntevo.com/static/smart/download/deepgit/deepgit-win32-setup-jre-2_0_3.zip'
  softwareName   = 'DeepGit'
  checksum       = 'a06bbc9f329ee6dfaf39b652623471e07a6b02a9cdea7fab06e1eeb7813017caa1dac13ddd2f6f1e56c3dbf4a4e5f56989bc29f64ec2563bb6c1422936028ab0'
  checksumType   = 'sha512'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  destination    = Get-PackageCacheLocation
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs.file = Get-ChildItem $packageArgs.destination -Filter "*.exe" | % { $_.FullName }
Install-ChocolateyInstallPackage @packageArgs
