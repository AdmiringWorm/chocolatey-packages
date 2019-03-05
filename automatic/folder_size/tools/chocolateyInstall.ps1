$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.mindgems.com/software/FolderSize.exe'
  softwareName   = 'Folder Size*'
  checksum       = 'A286202E2E63336F8EEE833FF424C676E8BD0549888599EE79078FFE9E5E185E9534E4DA1EAD2096DE6A2D35B06DE1F6E173CF793D92352220B154A61984390A'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
