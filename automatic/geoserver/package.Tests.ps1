. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch 'GNU GENERAL PUBLIC LICENSE' `
  -expectedEmbeddedMatch 'geoserver-[\d\.]+-bin.zip' `
  -expectedDefaultDirectory "$env:SystemDrive\tools\GeoServer" `
  -expectedShimFiles "geoserver-startup", "geoserver-shutdown"
