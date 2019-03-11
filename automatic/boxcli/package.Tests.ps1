. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "boxcli" `
  -packagePath "$PSScriptRoot" `
  -streams "1.0","1.1","1.2" `
  -expectedEmbeddedMatch "^BoxCLI-win10-x64\.msi$" `
  -customDirectoryArgument "INSTALLFOLDER=" `
  -licenseShouldMatch "Apache License" `
  -expectedDefaultDirectory "${env:ProgramFiles}\BoxCLI"

  Run-PesterTests `
    -packageName "boxcli" `
    -packagePath "$PSScriptRoot" `
    -streams "latest" `
    -expectedEmbeddedMatch "^box-v[\d\.]+-(x64|x86)\.exe$" `
    -customDirectoryArgument "/D=" `
    -licenseShouldMatch "Apache License" `
    -expectedDefaultDirectory "${env:ProgramFiles}\`@boxcli" `
    -test32Bit
