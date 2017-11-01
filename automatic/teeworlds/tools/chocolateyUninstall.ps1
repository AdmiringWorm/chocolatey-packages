$ErrorActionPreference = 'Stop'

# Shortcuts to remove
@(
  [System.Environment]::GetFolderPath('CommonDesktopDirectory')
  [System.Environment]::GetFolderPath('CommonStartMenu')
) | % {
  if (Test-Path "$_\Teeworlds.lnk") { Remove-Item "$_\Teeworlds.lnk" }
  if (Test-Path "$_\Teeworlds Server.lnk") { Remove-Item "$_\Teeworlds Server.lnk"}
}
