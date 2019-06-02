$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://code-industry.net/public/MasterPDFEditor-setup.exe'
  softwareName   = 'Master PDF Editor*'
  checksum       = '3C7972AA7002B1639AEE64ECBC41E4CC295918509FD033133F3499C91CE905FF2924DF965EE16D9356265D8C828A8CDC8458008EA6C28E7A33836CC34D8406D4'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
