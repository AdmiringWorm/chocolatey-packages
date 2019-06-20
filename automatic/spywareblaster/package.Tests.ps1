. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\SpywareBlaster" `
  -customDirectoryArgument "/DIR=" `
  -expectedUninstallKeys "SpywareBlaster *"
