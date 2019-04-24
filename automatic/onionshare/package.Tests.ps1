. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedEmbeddedMatch "^onionshare-[\d\.](\.[a-z\d])?+-setup\.exe$" `
  -customDirectoryArgument "/D=" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\OnionShare"
