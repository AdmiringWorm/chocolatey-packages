$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = '797672C402D002AEF6BB7F85CDC0DC2B516DBCF68989B00E2DC32BB0678CA5FCF12DF2DF1A8086F94B6986BDBE01BCD20869E8E43CA3C5C7E7B43BBC04C58297'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
