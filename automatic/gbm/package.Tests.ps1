. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch 'GNU GENERAL PUBLIC LICENSE' `
  -expectedEmbeddedMatch 'GBM.v[\d\.]+(32|64)-bit.Installer.exe' `
  -expectedDefaultDirectory "${env:ProgramFiles}\Game Backup Monitor" `
  -customDirectoryArgument "/D=" `
  -test32bit
