. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^OpenMPT-[\d\.]+-Setup(-x64)?\.exe$" `
  -expectedDefaultDirectory "${env:ProgramFiles}\OpenMPT" `
  -licenseShouldMatch "are permitted provided that the following conditions are met" `
  -customDirectoryArgument "/DIR=" `
  -customUninstallChecks { sleep 100 } `
  -test32bit
