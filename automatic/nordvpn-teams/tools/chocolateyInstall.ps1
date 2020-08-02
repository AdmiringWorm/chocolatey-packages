$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$toolsPath\helpers.ps1"
Write-Host "Importing necessary certificates..."
$certificates = Get-ChildItem "$toolsPath\*.cer"
$certificates | ForEach-Object {
  Import-Certificate -FilePath $_ -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"
}

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://downloads.nordteams.com/win/latest/NordVPNTeamsSetup.exe'
  softwareName   = 'NordVPN Teams*'
  checksum       = '17DEB7BDFD05F12A269B89ED8A91E0C92C1A0E65E35671E14389194168D35A7AA62F8AC28B1E656AC9BE49DA237861046CD83460BF631D5C08454AF5E98E4905'
  checksumType   = 'sha512'
  silentArgs     = "/exenoui /exenoupdates /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
