$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '43B1A0D3CD25CE2C01ECE650716899CA904DB7BFB53D98C9255B46DDE6529FC381B13CA45F138284075B3C1C66E86F32ABD5576E958E0173F41C3E7D7655B6B0'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
