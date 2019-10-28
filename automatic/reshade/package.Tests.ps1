[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseCmdletCorrectly")]
param()
. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^reshade\.exe$" `
  -expectedShimFiles "reshade.exe" `
  -customInstallChecks @(
    {
      It "Should create Reshade Start Menu shortcut" {
        $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
        "$startMenu\ReShade.lnk" | Should -Exist
      }

      It "Should not create ReShade Desktop shortcut during normal install" {
        $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
        "$desktop\ReShade.lnk" | Should -Not -Exist
      }
    }
  ) `
  -customUninstallChecks @(
    {
      It "Should remove ReShade Start Menu shortcut" {
        $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
        "$startMenu\ReShade.lnk" | Should -Not -Exist
      }
    }
  )

Describe "$packageName configuration verification" {
  Context "Parameters" {
    It "Should create desktop shortcut when using 'Desktop' parameter" {
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/Desktop`"'" | Should -Be 0

        $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
        "$desktop\ReShade.lnk" | Should -Exist
    }

    It "Should remove desktop shortcut when installed with 'Desktop' parameter" {
      Uninstall-Package `
        -packageName $packageName | Should -Be 0

        $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
        "$desktop\ReShade.lnk" | Should -Not -Exist
    }

    It "Should NOT create start menu shortcut when using 'NoStartMenu' parameter" {
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/NoStartMenu`"'" | Should -Be 0

        $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
        "$startMenu\ReShade.lnk" | Should -Not -Exist
    }

    It "Cleanup" {
      Uninstall-Package `
        -packageName $packageName | Should -Be 0
    }
  }
}
