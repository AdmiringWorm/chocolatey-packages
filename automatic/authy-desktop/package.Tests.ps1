. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "authy-desktop" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:LocalAppData}\authy-electron\Authy Desktop.exe"
