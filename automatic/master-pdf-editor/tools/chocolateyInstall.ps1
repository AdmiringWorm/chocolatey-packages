$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://code-industry.net/public/MasterPDFEditor-setup.exe'
  softwareName   = 'Master PDF Editor*'
  checksum       = 'C611CDDD2FBF6E0B6B43D0B5DBBC2878CEC650DB257BE3E28E285F46DA35ADBD626FD44A401E790117DC165458A2D0DEA7EA39DA0B29AAB30EAE754E94E76056'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
