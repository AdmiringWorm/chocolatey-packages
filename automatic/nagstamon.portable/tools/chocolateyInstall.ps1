$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

if ((Get-OSArchitectureWidth 32) -or $env:ChocolateyForceX86) {
  throw ("32bit archive have been removed from package until issue regarding high virus count number is resolved.`n" +
        "See issue for more to monitor situation: https://github.com/HenriWahl/Nagstamon/issues/528")
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  file           = ""
  file64         = "$toolsPath\Nagstamon-3.4-win64.zip"
  destination    = $toolsPath
  validExitCodes = @(0)
}

Get-ChocolateyUnzip @packageArgs

Remove-Item "$toolsPath\*.zip" -ea 0
