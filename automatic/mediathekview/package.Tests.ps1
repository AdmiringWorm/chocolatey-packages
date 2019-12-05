. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedEmbeddedMatch "^MediathekView\-[\d\.]+\-win\.zip$" `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\MediathekView\tools\MediathekView" `
  -expectedShimFiles "MediaThekView.exe"
