$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '54614CEA8C2876982442E9B8C1B5D8E736439C23C6EC9AC849E25AAC909EFA6ABA2B2FAC7DDBFF158901BDC16994FDE3EB369DFE580DD1338CCA5404DECDB3FC'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
