. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\teeworlds\tools\teeworlds-*-win32" `
  -testChoco:$(Test-Path Env:\APPVEYOR)
