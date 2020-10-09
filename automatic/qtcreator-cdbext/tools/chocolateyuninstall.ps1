$toolsDir = Get-ToolsLocation

$pluginDirs = @(
  "$toolsDir\qtcreator\lib\qtcreatorcdbext64"
  "$toolsDir\qtcreator\lib\qtcreatorcdbext32"
)

$pluginDirs | Where-Object { Test-Path $_ } | ForEach-Object {
  Remove-Item -Recurse -Force $_
}
