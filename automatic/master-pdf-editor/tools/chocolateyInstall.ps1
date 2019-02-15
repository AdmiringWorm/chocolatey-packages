$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://code-industry.net/public/MasterPDFEditor-setup.exe'
  softwareName   = 'Master PDF Editor*'
  checksum       = '883C83D6179E8FE696328FBA9297D35F4FAF6910BF0FC3C236007FC1C8C3F51F27F5519FF7F90BEEFD6EDFD37D8A9A358708DD1F2E171BB32A513B8A546DD512'
  checksumType   = 'sha512'
  silentArgs     = "/SILENT /NORESTART /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
