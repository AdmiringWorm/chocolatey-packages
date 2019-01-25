. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams 'stable','latest' `
  -licenseShouldMatch 'GNU GENERAL PUBLIC LICENSE' `
  -expectedEmbeddedMatch '^hardentools\.exe$' `
  -expectedShimFiles "hardentools.exe"
