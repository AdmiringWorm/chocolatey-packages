. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedEmbeddedMatch "^disposablefixer.vsix$" `
    -licenseShouldMatch "Creative Commons Public Licenses" `
    -testChoco:$((Test-Path Env:\APPVEYOR))
