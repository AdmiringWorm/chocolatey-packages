$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.mindgems.com/software/FolderSize.exe'
  softwareName   = 'Folder Size*'
  checksum       = '6A570D74887B32E81C17D921D8A68508633381158BF59A0618656B78B485ECFD363797B94362D0A69383D8DFEDFB0855FBDCEEE20F134F4EEFDF42C30FC4AA30'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
