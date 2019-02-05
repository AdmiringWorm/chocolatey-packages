. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedEmbeddedMatch "^Unit_Test_Boilerplate_Generator_v[\d\.]+\.vsix$" `
    -licenseShouldMatch "including without limitation the rights to use, copy, modify, merge, publish, distribute" `
    -testChoco:$((Test-Path Env:\APPVEYOR))
