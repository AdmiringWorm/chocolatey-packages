[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseCmdletCorrectly")]
param()
. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams "latest" `
  -expectedEmbeddedMatch "^(Enki-v[\d\.]+.exe|Install_Enki.exe)$" `
  -licenseShouldMatch "GNU GENERAL PUBLIC LICENSE" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Enki" `
  -customDirectoryArgument "/DIR=" `
  -customUninstallChecks @({ It "Sleeping" { sleep -Seconds 5 } })

Describe "$packageName configuration verification" {
  Context "Parameters" {
    It "Should create configuration file when 'UseInf' is specified" {
      # Remove the configuration file if it exists
      $confFile = "${env:SystemDrive}\Enki.inf"
      if (Test-Path "$confFile") { rm "${confFile}" }
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/UseInf:${confFile}`"'" | Should -Be 0

      ${confFile} | Should -Exist

      if (Test-Path "$confFile") { rm "${confFile}" }
    }

    It "Should uninstall package after creating configuration file" {
      Uninstall-Package `
        -packageName $packageName | Should -Be 0
    }

    It "Sleeping" { sleep -Seconds 5 }

    It "Should use existing configuration file when 'UseInf' is specified" {
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/UseInf:${PSScriptRoot}\test.inf`"'" | Should -Be 0
    }

    It "Should have created installation directory" {
      "C:\Testing\Enki" | Should -Exist
    }

    It "Should have created start menu folder during install" {
      $startMenu = [System.Environment]::GetFolderPath('CommonPrograms')
      "$startMenu\NewEnki" | Should -Exist
    }

    It "Should uninstall package after creating configuration file" {
      Uninstall-Package `
        -packageName $packageName
    }

    It "Sleeping" { sleep -Seconds 5 }

    It "Should have removed directory used in configuration file" {
      "C:\Testing\Enki" | Should -Not -Exist
    }

    It "Should have removed start menu folder after uninstall" {
      $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
      "$startMenu\NewEnki" | Should -Not -Exist
    }
  }
}
