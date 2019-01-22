. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "astyle" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch '^AStyle_[\d\.]+_windows\.zip$' `
  -licenseShouldMatch 'MIT License' `
  -expectedDefaultDirectory "${env:chocolateyInstall}\lib\astyle\tools" `
  -expectedShimFiles "AStyle.exe"
