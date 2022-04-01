$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.com/download/ghostdoc/pro/registered/'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Pro'
  checksum       = '4c6808e4ded2aa61f257644120cf296e9010b6e794520af2b1eed72801511c671f7185faa215e72bbdaf9ab0a4aadbdb0dbb9ad44bcb2186b091d6b441b191de'
  checksumType   = 'sha512'
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'https://submain.com/download/ghostdoc/pro/'
    }
  }
}

[array]$existingKey = Get-UninstallRegistryKey @packageArgs
$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if ($existingKey.Length -eq 1) {
  $existingKey | ForEach-Object {
    . "$toolsDir\helpers.ps1"
    Write-Host "Uninstalling previous version of GhostDoc Pro"
    UninstallGhostDoc "$($_.PSChildName)"
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs["file"] = Get-ChildItem $cacheDirectory -Filter "*.exe" -Recurse | Select-Object -First 1 -ExpandProperty FullName

if ($env:chocolateyInstallOverride -ne $true) {
  Start-Process "autohotkey.exe" "$toolsDir\ghostdocInstall.ahk","Pro"
}
Install-ChocolateyInstallPackage @packageArgs
