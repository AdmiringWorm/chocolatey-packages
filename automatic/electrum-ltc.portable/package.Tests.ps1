. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedEmbeddedMatch "^electrum-ltc.exe$" `
    -licenseShouldMatch "The MIT License" `
    -expectedShimFiles "electrum-ltc.exe"
