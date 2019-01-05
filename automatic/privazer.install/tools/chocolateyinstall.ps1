$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = '2a59b2eb3aa160295811d88dc50a2a22eae5a8b8ea5871b50915954266f2379e86a641774affcb6f4994a0ed3568444da3007b765591ca7863bdcdd7a8f4d20c'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
