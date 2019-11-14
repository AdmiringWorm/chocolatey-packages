$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UplayInstaller.exe'
  softwareName   = 'Uplay'
  checksum       = 'D59CCBF3AC7C81370FC4F1E786372362871A547B6694B936B122F983168CEF91DE60DE363FD5DFDA0535E3FAE28E6FC819555834EAFB541ED1B8C1445DA1D5EB'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
