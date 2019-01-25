$ErrorActionPreference = 'Stop';

$cacheDirectory = Get-PackageCacheLocation

$packageArgs = @{
  packageName    = $env:chocolateyPackageName
  fileType       = 'exe'
  url            = 'https://submain.s3.amazonaws.com/Download/GhostDocEnt_v2018.1.18330.zip?AWSAccessKeyId=AKIAITSGJRBAOEKGU26Q&Expires=1548449721&Signature=pokOX2fYB%2BXQn2q505f59i6euSA%3D'
  unzipLocation  = $cacheDirectory
  softwareName   = 'GhostDoc Enterprise'
  checksum       = '7FCD43F31863179E9A72F421158B3A3DFFACF9A2C259CBDBE2A4CC282CB2C19C17DAA8D52B42239994644A5AC5CB065E22B630CE70D096ACCF688099E56A98CB'
  checksumType   = 'sha512'
  silentArgs     = ''
  validExitCodes = @(0)
  options        = @{
    Headers = @{
      Referer = 'http://submain.com/download/ghostdoc/enterprise/'
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
