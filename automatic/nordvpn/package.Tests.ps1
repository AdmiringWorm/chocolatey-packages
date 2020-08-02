. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles}\NordVPN" `
  -expectedUninstallKeys 'NordVPN', 'NordVPN network TAP', 'NordVPN network TUN'
