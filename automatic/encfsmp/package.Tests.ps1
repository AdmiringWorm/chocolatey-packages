. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -streams "stable","beta" `
    -expectedEmbeddedMatch "^EncFSMP_[\d\.]+_Setup.exe$" `
    -licenseShouldMatch "MIT license" `
    -expectedDefaultDirectory "${env:ProgramFiles}\EncFSMP" `
    -installWithPreRelease
