$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/privazer_free.exe'
  checksum       = 'b2a022487618a2d48b87577c264e5ab8cdf1cba637c9a0631ac7911ab9cff04a6815209f5b1e9af4361da0f163643d2fd55947d2667b4cc58fb05f12d57fc45a'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
