. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot
$runChocoUnitTests = Test-Path Env:\APPVEYOR_BUILD_WORKER_IMAGE -and ($env:APPVEYOR_BUILD_WORKER_IMAGE -eq 'Visual Studio 2017') # DisposableFixer only supports Visual Studio 2017 right now.

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedEmbeddedMatch "^disposablefixer.vsix$" `
    -licenseShouldMatch "Creative Commons Public Licenses" `
    -testChoco:$runChocoUnitTests
