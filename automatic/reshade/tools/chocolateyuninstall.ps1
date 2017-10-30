# Shortcuts to remove
@(
  [System.Environment]::GetFolderPath('CommonDesktopDirectory')
  [System.Environment]::GetFolderPath('CommonStartMenu')
) | % {
  if (Test-Path "$_\ReShade.lnk") { Remove-Item "$_\ReShade.lnk" }
}
