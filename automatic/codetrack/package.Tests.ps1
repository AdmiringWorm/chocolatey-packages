. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedEmbeddedMatch "^codetrack[_\d]+.zip$" `
    -licenseShouldMatch "The Software can be copied and distributed" `
    -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\codetrack\tools" `
    -expectedShimFiles "CodeTrack.exe"
