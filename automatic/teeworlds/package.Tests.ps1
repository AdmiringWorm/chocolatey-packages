[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseCmdletCorrectly")]
param()
. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams 'latest' `
  -expectedEmbeddedMatch "^teeworlds-[\d\.]+-win32\.zip$" `
  -licenseShouldMatch "CC-BY-SA 3.0" `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\teeworlds\tools\teeworlds-*-win32" `
  -customInstallChecks @({
    It "Should have created Start Menu shortcut for teeworlds" {
      $startMenu = [System.Environment]::GetFolderPath("CommonStartMenu")
      "$startMenu\Teeworlds.lnk" | Should -Exist
    }
    It "Should have created Start Menu shortcut for teeworlds server" {
      $startMenu = [System.Environment]::GetFolderPath("CommonStartMenu")
      "$startMenu\Teeworlds Server.lnk" | Should -Exist
    }
  }) `
  -customUninstallChecks @({
    It "Should have removed Start Menu shortcut for teeworlds" {
      $startMenu = [System.Environment]::GetFolderPath("CommonStartMenu")
      "$startMenu\Teeworlds.lnk" | Should -Not -Exist
    }
    It "Should have removed Start Menu shortcut for teeworlds server" {
      $startMenu = [System.Environment]::GetFolderPath("CommonStartMenu")
      "$startMenu\Teeworlds Server.lnk" | Should -Not -Exist
    }
  })

Describe "$packageName Package Validation" {
  Context "Package Parameters" {
    It "Should Create desktop shortcut when correct parameter is passed" {
      Install-Package -packageName $packageName -packagePath $PSScriptRoot -additionalArguments "--package-parameters='`"/Desktop`"'" | Should -Be 0

      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\Teeworlds.lnk" | Should -Exist
      "$desktop\Teeworlds Server.lnk" | Should -Exist
    }

    It "Should Remove desktop shortcuts if they are created" {
      Uninstall-Package -packageName $packageName | Should -Be 0

      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\Teeworlds.lnk" | Should -Not -Exist
      "$desktop\Teeworlds Server.lnk" | Should -Not -Exist
    }

    It "Should NOT create start menu shortcuts when parameter is passed" {
      Install-Package -packageName $packageName -packagePath $PSScriptRoot -additionalArguments "--package-parameters='`"/NoStartMenu`"'" | Should -Be 0

      $startMenu = [System.Environment]::GetFolderPath("CommonStartMenu")
      "$startMenu\Teeworlds.lnk" | Should -Not -Exist
      "$startMenu\Teeworlds Server.lnk" | Should -Not -Exist
    }

    It "Cleanup by running chocolatey uninstall" {
      Uninstall-Package -packageName $packageName
    }
  }
}
