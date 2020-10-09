$toolsDir = Get-ToolsLocation

$pluginDirs = @(
  "$toolsDir\qtcreator\lib\qtcreatorcdbext64"
  "$toolsDir\qtcreator\lib\qtcreatorcdbext32"
)

$pluginDirs | ? { Test-Path $_ } | % {
  Remove-Item -Recurse -Force $_
}
