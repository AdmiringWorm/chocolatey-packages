$ErrorActionPreference = 'Stop'

$installPath = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'zip'
  file        = "$toolsPath\qilin-windows.zip"
  destination = $installPath
}

Get-ChocolateyUnzip @packageArgs
rm $packageArgs.file -ea 0

$execPath = "$installPath/win64/qilin.exe"
mv "$installPath/win64/me.laniewski.qilin.exe" $execPath -Force
Install-BinFile -Name "qilin" -Path $execPath -UseStart
