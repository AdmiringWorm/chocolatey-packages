$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.mindgems.com/software/FolderSize.exe'
  softwareName   = 'Folder Size*'
  checksum       = '0F034F62CA56E778841F57BDB9280B193A1F4F3A22FE61CD205C0C5341838F29F407E1B33F3136E8409D16C669ACF2D647DF1BF96AFD9E65BBC223B829B79E20'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
