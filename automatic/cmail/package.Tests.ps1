. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "cmail" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^CMail_[\d\.]+_(x86|amd64).*\.zip$" `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\cmail\tools" `
  -expectedShimFiles "cmail.exe" `
  -test32bit
