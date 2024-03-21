. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^tinyMediaManager-[\d\.]+-windows-amd64\.zip$" `
  -expectedDefaultDirectory "C:\tools\tinyMediaManager" `
  -expectedShimFiles "tinyMediaManagerCMD.exe" `
  -customInstallChecks @(
  {
    It "Should create tinyMediaManager Start Menu shortcut" {
      $startMenu = [System.Environment]::GetFolderPath('Programs')
      "$startMenu\tinyMediaManager.lnk" | Should -Exist
    }

    It "Should create tinyMediaManager desktop shortcut" {
      $desktop = [System.Environment]::GetFolderPath('Desktop')
      "$desktop\tinyMediaManager.lnk" | Should -Exist
    }
  }
) `
  -customUninstallChecks @(
  {
    It "Should remove tinyMediaManager Start Menu shortcut" {
      $startMenu = [System.Environment]::GetFolderPath('Programs')
      "$startMenu\tinyMediaManager.lnk" | Should -Not -Exist
    }

    It "Should remove tinyMediaManager desktop shortcut" {
      $desktop = [System.Environment]::GetFolderPath('Desktop')
      "$desktop\tinyMediaManager.lnk" | Should -Not -Exist
    }
  }
) `
  -failsOn32bit
