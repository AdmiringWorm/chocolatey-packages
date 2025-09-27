. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams "latest" `
  -expectedEmbeddedMatch "^friture-[\d\.\-]+\.msi$" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Friture" `
  -customDirectoryArgument "/D="
