$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '0fbbe90f5fb49b534532237af60b69246ecfb8bc23970359c825c691482cf37a01b8134b708ea644707d771d21f5f25c46ba3f288055e3da8b370fb4907f4cbb'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
