$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://www.mindgems.com/software/FolderSize.exe'
  softwareName   = 'Folder Size*'
  checksum       = '5C199A791B614D047F0079E932536AAF6444B01DBB29E498BE30E134A9044C198379FDD70E6E8AFD12DDB4FBAB5CF35A66CF6B805B81F2C534F653A0A0CBEE71'
  checksumType   = 'sha512'
  silentArgs     = "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
