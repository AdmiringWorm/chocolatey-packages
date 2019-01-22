. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

Run-PesterTests `
  -packageName "cmder" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^cmder.7z$" `
  -licenseShouldMatch 'MIT License' `
  -expectedDefaultDirectory "$toolsPath\cmder" `
  -filesAvailableOnPath "Cmder.exe"
