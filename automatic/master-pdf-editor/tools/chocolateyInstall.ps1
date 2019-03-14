$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://code-industry.net/public/MasterPDFEditor-setup.exe'
  softwareName   = 'Master PDF Editor*'
  checksum       = '13CBEAB798520519B5E8CD913F1D3FA13334862E2EE910C0EE409E8A4901110BFB0499D14D490DCEFE940CEA9915EB57B40E62E879A4B74570399C396770CB6D'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
