$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = '660c90aa67bf23f2b359798040763fedc4f614d78f54b860279f5b8666b05957f9c3a1ce0e201f29ad61f7763b81fd3fbf7fd3d892c01b4c471c29c19e9d8fcc'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
