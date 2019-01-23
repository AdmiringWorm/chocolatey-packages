. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch 'Apache License' `
  -expectedEmbeddedMatch 'fstar_[\d\.]+_Windows_x64.zip' `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\FStar\tools\fstar" `
  -expectedShimFiles "fstar.exe" `
  -notExpectedShimFiles "z3.exe" `
  -failsOn32bit
