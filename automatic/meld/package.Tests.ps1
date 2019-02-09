. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams 'latest' `
  -expectedEmbeddedMatch "^Meld\-[\d\.]+\-mingw\.msi$" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Meld" `
  -customDirectoryArgument "TARGETDIR="
