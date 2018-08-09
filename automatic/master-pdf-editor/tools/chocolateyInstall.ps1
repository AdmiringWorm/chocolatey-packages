$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://code-industry.net/public/MasterPDFEditor-setup.exe'
  softwareName   = 'Master PDF Editor*'
  checksum       = '27D073BEF6EB52BB1CF4360E8649F388E7A9EA922F5729F656E640F6F1FFB475C933F8949D13A8EEF62D5BF4DF2EC531F5E7FD24E26CAB6E8DBD5B639F01B796'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
