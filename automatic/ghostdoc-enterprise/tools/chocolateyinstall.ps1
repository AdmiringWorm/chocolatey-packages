$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.com/download/ghostdoc/enterprise/registered/'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Enterprise'
  checksum       = 'd8819897ab165de866b8f4d7f948c12dae81e53eb80185dceddad898cba4fb6e1a7ebe49052d7023b8adb422cd62c4e317e1a843b347cce026184f970b51bff1'
  checksumType   = 'sha512'
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'https://submain.com/download/ghostdoc/enterprise/'
    }
  }
}

[array]$existingKey = Get-UninstallRegistryKey @packageArgs
$toolsDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if ($existingKey.Length -eq 1) {
  $existingKey | ForEach-Object {
    . "$toolsDir\helpers.ps1"
    Write-Host "Uninstalling previous version of $($packageArgs.softwareName)"
    UninstallGhostDoc "$($_.PSChildName)"
  }
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs["file"] = Get-ChildItem $cacheDirectory -Filter "*.exe" -Recurse | Select-Object -First 1 -ExpandProperty FullName

if ($env:chocolateyInstallOverride -ne $true) {
  Start-Process "autohotkey.exe" "$toolsDir\ghostdocInstall.ahk","Enterprise"
}
Install-ChocolateyInstallPackage @packageArgs
