. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\NordVPN Teams" `
  -expectedUninstallKeys 'NordVPN Teams', 'NordVPN Teams TAP Adapter'
