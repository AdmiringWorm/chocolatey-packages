
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file          = "$toolsDir\"

  softwareName  = 'geoserver*'
}

Get-ChocolateyUnzip @packageArgs
