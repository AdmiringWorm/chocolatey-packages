. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "claws-mail" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^claws-mail-[\d\.]+(-\d+)?\-(32|64)bit\.exe$" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedDefaultDirectory "${env:ProgramFiles}\Claws Mail" `
  -customDirectoryArgument "/D=" `
