. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "boxcli" `
  -packagePath "$PSScriptRoot" `
  -streams "1.0","1.1","latest" `
  -expectedEmbeddedMatch "^BoxCLI-win10-x64\.msi$" `
  -customDirectoryArgument "INSTALLFOLDER=" `
  -licenseShouldMatch "Apache License" `
  -expectedDefaultDirectory "${env:ProgramFiles}\BoxCLI" `
