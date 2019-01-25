$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.s3.amazonaws.com/Download/GhostDocPro_v2018.1.18330.zip?AWSAccessKeyId=AKIAITSGJRBAOEKGU26Q&Expires=1548449721&Signature=ca4OIVui%2Bbu%2FgAn%2F%2B2D7I9Wm4KA%3D'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Pro'
  checksum       = '4A9D28473759EF40484F377002179E70048785383367804EFECCCADEEA5C0B1E21DF79F68AD8C9D8A934268BEDBA2BC955109C6A091EA553C670CF6E8F240995'
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
  Start-Process "autohotkey.exe" "$toolsDir\ghostdocInstall.ahk","Pro"
}
Install-ChocolateyInstallPackage @packageArgs
