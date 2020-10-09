. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles}\SnapGene Viewer" `
  -customDirectoryArgument "/D=" `
  -customUninstallChecks @( {
    It "Sleeping" { sleep -Seconds 5 }
  })
