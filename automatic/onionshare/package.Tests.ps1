. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams "stable" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedEmbeddedMatch "^OnionShare-[\d\.]+(\.[a-z\d]+)?\.msi$" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\OnionShare"
