. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^rethinkdb-[\d\.]+\.zip$" `
  -licenseShouldMatch "Apache License" `
  -expectedShimFiles "rethinkdb.exe"
