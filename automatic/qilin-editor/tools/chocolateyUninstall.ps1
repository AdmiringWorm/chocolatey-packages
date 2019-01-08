$toolsPath = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

Uninstall-BinFile -Name "qilin" -Path (Join-Path $toolsPath "qilin.exe")

if (Test-Path $toolsPath) {
  Write-Host "Removing qilin editor directory"
  Remove-Item -Recurse -Force $toolsPath
}
