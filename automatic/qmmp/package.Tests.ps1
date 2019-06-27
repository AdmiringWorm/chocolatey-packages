. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^qmmp-[\d\.]+-win32.exe$" `
  -licenseShouldMatch 'GNU GENERAL PUBLIC LICENSE' `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Qt-based Multimedia Player" `
  -customDirectoryArgument "/D=" `
  -expectedUninstallKeys "Qt-based Multimedia Player"
