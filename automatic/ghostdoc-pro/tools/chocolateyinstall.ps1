$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.com/download/GhostDocPro_v5.9.zip'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Pro'
  checksum       = '2B03A28ED6DBC5D76B473CD3FB5678BD50C4CDA14F1E4C5153D9F2AB7831E9D42961FBBCEA3E150E6B1D363D05E162AEF716AB2BBFEFFAA70C1DF6E8D9FA63E1'
  checksumType   = 'sha512'
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'http://submain.com/download/ghostdoc/pro/'
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
  Start-Process "autohotkey.exe" "$toolsDir\ghostdocInstall.ahk"
}
Install-ChocolateyInstallPackage @packageArgs
