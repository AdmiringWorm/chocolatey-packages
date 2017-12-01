. "$PSScriptRoot\common.ps1"

If (Test-Path $shortcutFile){
  Remove-Item $shortcutFile
}