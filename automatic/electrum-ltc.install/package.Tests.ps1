. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedEmbeddedMatch "^electrum-ltc-[\d\.]+-setup\.exe$" `
    -licenseShouldMatch "The MIT License" `
    -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Electrum-LTC" `
    -customDirectoryArgument "/D="
