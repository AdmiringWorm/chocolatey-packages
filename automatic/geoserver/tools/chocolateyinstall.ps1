
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path (Get-ToolsLocation) "GeoServer"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = $installDir
  file        = "$toolsDir\geoserver-2.25.0-bin.zip"
}

Get-ChocolateyUnzip @packageArgs


@('startup'; 'shutdown') | ForEach-Object {
  Install-BinFile "geoserver-$_" "$installDir\bin\$_.bat"
}

Write-Host "Adding environment variable for GeoServer install location"
Install-ChocolateyEnvironmentVariable -VariableName "GEOSERVER_HOME" -VariableValue "$installDir" -VariableType 'Machine'
