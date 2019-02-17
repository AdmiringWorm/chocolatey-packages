. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch "Microsoft Public License" `
  -expectedEmbeddedMatch "^MonoGameSetup\.exe$" `
  -customDirectoryArgument "/D=" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\MonoGame\*"
