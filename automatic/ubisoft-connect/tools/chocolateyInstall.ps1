$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe'
  softwareName   = 'Ubisoft Connect'
  checksum       = '6015B990BE4129A5C6DCE4E951472432E40D6465BF9201D5D8271AB2EC6D59EE892D63A5AD2DE82C97C58A93FBC34E3EFAB7C841A5044695831E5E147E86D8CB'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
