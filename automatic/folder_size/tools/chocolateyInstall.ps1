$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://www.mindgems.com/software/FolderSize.exe'
  softwareName   = 'folder_size*'
  checksum       = '4D7A758FDA01E9C00FD14B3ED09BCC9253A8462488BE2F438A2B5AAA44F9EBA2EF6B32D52FF9D57A86B7C53250C87FCC0661A2C6A4992B8E0286F2EC783AA81F'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
