. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "dilay-[\d\.]+.msi" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Dilay" `
  -customDirectoryArgument "INSTALLDIR="
