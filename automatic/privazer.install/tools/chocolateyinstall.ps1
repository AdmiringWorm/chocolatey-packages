$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PrivaZer'
  fileType       = 'exe'
  silentArgs     = '-silent'
  validExitCodes = @(0)
  url            = 'https://privazer.com/PrivaZer_free.exe'
  checksum       = 'c0f37f66bb0f197d5140d191c3f8fd1c0cd1484f1c2c7153885088052b05556e86c14d82946c53d05c06d1232bcf918f8e48df13468a2d01a2a775db3e0265fb'
  checksumType   = 'sha512'
}

Install-ChocolateyPackage @packageArgs
