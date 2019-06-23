. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^qilin-windows.zip$" `
  -licenseShouldMatch 'MIT License' `
  -expectedShimFiles 'qilin.exe' `
  -notExpectedShimFiles 'chromedriver.exe','me.laniewski.qilin.exe','nwjc' `
  -installWithPreRelease
