. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedEmbeddedMatch "^ResxTranslator_v[\d\.]+_release_signed\.zip$" `
  -licenseShouldMatch "GNU General Public License version 2" `
  -expectedShimFiles "ResxTranslator.exe" `
  -customInstallChecks @(
    {
      It "Should create ResxTranslator Start Menu shortcut" {
        $startMenu = [System.Environment]::GetFolderPath('Programs')
        "$startMenu\Resx Resource Translator.lnk" | Should -Exist
      }

      It "Should not create ResxTranslator Desktop shortcut during normal install" {
        $desktop = [System.Environment]::GetFolderPath('Desktop')
        "$desktop\Resx Resource Translator.lnk" | Should -Not -Exist
      }
    }
  ) `
  -customUninstallChecks @(
    {
      It "Should remove ResxTranslator Start Menu shortcut" {
        $startMenu = [System.Environment]::GetFolderPath('Programs')
        "$startMenu\Resx Resource Translator.lnk" | Should -Not -Exist
      }
    }
  )

Describe "$packageName configuration verification" {
  Context "Parameters" {
    It "Should create desktop shortcut when using 'CreateDesktopIcon' parameter" {
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/CreateDesktopIcon`"'" | Should -Be 0

        $desktop = [System.Environment]::GetFolderPath('Desktop')
        "$desktop\Resx Resource Translator.lnk" | Should -Exist
    }

    It "Should remove desktop shortcut when installed with 'CreateDesktopIcon' parameter" {
      Uninstall-Package `
        -packageName $packageName | Should -Be 0

        $desktop = [System.Environment]::GetFolderPath('Desktop')
        "$desktop\Resx Resource Translator.lnk" | Should -Not -Exist
    }

    It "Should NOT create start menu shortcut when using 'NoStartMenuIcon' parameter" {
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/NoStartMenuIcon`"'" | Should -Be 0

        $startMenu = [System.Environment]::GetFolderPath('Programs')
        "$startMenu\Resx Resource Translator.lnk" | Should -Not -Exist
    }

    It "Cleanup" {
      Uninstall-Package `
        -packageName $packageName | Should -Be 0
    }
  }
}
