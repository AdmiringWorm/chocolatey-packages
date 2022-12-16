$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '2f2b109e7a21332d67a9ae4747370aaa6f3b2c43c136900a22aaec603a0c59b39f94b52f8a0a1a766fcecc3037fc1b79b85025d22125722aaa217ccee3df8541'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
