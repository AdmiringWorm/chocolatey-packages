. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Inno Script Studio" `
  -customDirectoryArgument "/DIR="

Describe "$packageName configuration verification" {
  Context "Parameters" {
    It "Should create configuration file when 'UseInf' is specified" {
      # Remove the configuration file if it exists
      $confFile = "${env:SystemDrive}\Inno-Script-Studio.inf"
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

    It "Should use existing configuration file when 'UseInf' is specified" {
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--package-parameters='`"/UseInf:${PSScriptRoot}\test.inf`"'" | Should -Be 0
    }

    It "Should have created installation directory" {
      "C:\Testing\Inno Script Studio" | Should -Exist
    }

    It "Should have created desktop icon during install" {
      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\Inno Script Studio.lnk" | Should -Exist
    }

    It "Should have associated iss files during install" -Skip {
      # TODO: Not sure how to test this
    }

    It "Should uninstall package after creating configuration file" {
      Uninstall-Package `
        -packageName $packageName
    }

    It "Should have removed directory used in configuration file" {
      "C:\Testing\Inno Script Studio" | Should -Not -Exist
    }

    It "Should have removed desktop icon after uninstall" {
      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\Inno Script Studio.lnk" | Should -Not -Exist
    }

    It "Should have remove iss file association during uninstall" -Skip {
      # TODO: Not sure how to test this
    }
  }
}
