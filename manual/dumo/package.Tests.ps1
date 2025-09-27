. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
    -packageName "$packageName" `
    -packagePath "$PSScriptRoot" `
    -expectedDefaultDirectory "${env:ProgramFiles(x86)}\KC Softwares\DUMo" `
    -customDirectoryArgument "/DIR=" `
    -customInstallChecks @(
      {
        It "Dumo window should have been closed" {
          Get-Process -Name "DUMO*" -ea 0 | Should -BeNullOrEmpty
        }
      }
    ) `
    -customUninstallChecks @( { It "Sleeping" { sleep -Seconds 5 } }) # We'll sleep 5 seconds so the uninstall can exit before doing additional tests
