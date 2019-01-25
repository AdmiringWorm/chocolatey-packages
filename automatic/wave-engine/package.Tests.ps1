. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

$runChocoUnitTests = (Test-Path Env:\APPVEYOR_BUILD_WORKER_IMAGE) -and !($env:APPVEYOR_BUILD_WORKER_IMAGE -ne 'Visual Studio 2017') # Somehow, the VS 2017 image will not work with this package, due to prompting installation of GTKSharp (even the dependency does not work as it should)

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Wave Engine" `
  -testChoco:$runChocoUnitTests
