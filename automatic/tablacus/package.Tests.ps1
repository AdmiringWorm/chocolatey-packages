. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^te[\d]+\.zip$" `
  -licenseShouldMatch "MIT License" `
  -expectedShimFiles "TE32.exe","TE64.exe"
