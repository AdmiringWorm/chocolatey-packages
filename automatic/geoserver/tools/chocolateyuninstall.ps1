$ErrorActionPreference = 'Stop';

Write-Host "Removing shim files"
@('startup'; 'shutdown') | ForEach-Object {
  Uninstall-BinFile "geoserver-$_"
}

$installPath = Join-Path (Get-ToolsLocation) "GeoServer"

if (Test-Path $installPath) {
  Write-Host "Removing installation directory..."
  Remove-Item -Recurse -Force $installPath
}
else {
  Write-Warning "Installation directory NOT found. Ignoring..."
}

Write-Host "Removing environment variable for GeoServer install location"
Uninstall-ChocolateyEnvironmentVariable -VariableName "GEOSERVER_HOME" -VariableType "Machine"
