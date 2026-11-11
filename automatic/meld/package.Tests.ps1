. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams 'latest' `
  -expectedEmbeddedMatch '^meld-[\d\.]+\.exe$' `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedDefaultDirectory "$env:ProgramFiles\Meld" `
  -customDirectoryArgument '/INSTDIR=' `
  -expectedShimFiles 'meld.exe' `
  -expectedUninstallKeys 'Meld' `
  -failsOn32bit
