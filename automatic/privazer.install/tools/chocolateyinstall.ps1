$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '35028113cfa2a09d05d29e50b4218194744b4e3fc8b9832b69cc9b3694479e0bb1bc17494e077a95dfb127f5f11e712597cd227a81d1d71783b762878cf03558'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
