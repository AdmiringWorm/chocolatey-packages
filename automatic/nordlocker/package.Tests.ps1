. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles}\$packageName" `
  -expectedUninstallKeys "$packageName", "${packageName} FS" `
  -skipUninstallCheck `
  -testChoco $($env:APPVEYOR_BUILD_WORKER_IMAGE -ne "Visual Studio 2015")
