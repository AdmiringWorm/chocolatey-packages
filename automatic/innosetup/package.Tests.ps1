[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseCmdletCorrectly")]
param()
. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Write-Host "Ensuring that $packageName is not already installed"
Install-Package `
        -packageName $packageName `
        -packagePath "$PSScriptRoot" `
        -additionalArguments "-n"

Uninstall-Package -packageName $packageName

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -streams "latest","major-1","major-2","major-3","major-4","major-5" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\Inno Setup*" `
  -customDirectoryArgument "/DIR=" `
  -expectedShimFiles "ISCC.exe" `
  -expectedEmbeddedMatch "innosetup-[\d\.]+(-unicode)?(-beta|-dev-[\d]+)?\.exe" `
  -customInstallChecks @(
    {
      It "Should create iss file extension in registry" {
        "HKLM:\SOFTWARE\Classes\.iss" | Should -Exist
      }

      It "Should create ISCC.exe app path" {
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\ISCC.exe" | Should -Exist
      }

      It "Should create innosetup.exe app path" {
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\innosetup.exe" | Should -Exist
      }
    }
  ) `
  -customUninstallChecks @(
    {
      It "Should remove iss file extension in registry" {
        "HKLM:\SOFTWARE\Classes\.iss" | Should -Not -Exist
      }

      It "Should remove ISCC.exe app path" {
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\ISCC.exe" | Should -Not -Exist
      }

      It "Should remove innosetup.exe app path" {
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\innosetup.exe" | Should -Not -Exist
      }
    }
  )

Describe "$packageName configuration verification" {
  Context "Parameters" {
    It "Should create configuration file when 'UseInf' is specified" {
      # Remove the configuration file if it exists
      $confFile = "${env:SystemDrive}\Inno-Setup.inf"
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
      "C:\Testing\Inno Setup" | Should -Exist
    }

    It "Should have created desktop icon during install" {
      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\Inno Setup Compiler.lnk" | Should -Exist
    }

    It "Should NOT have created iss file extension in registry" {
      "HKLM:\SOFTWARE\Classes\.iss" | Should -Not -Exist
    }

    It "Should uninstall package after creating configuration file" {
      Uninstall-Package `
        -packageName $packageName
    }

    It "Should have removed directory used in configuration file" {
      "C:\Testing\Inno Setup" | Should -Not -Exist
    }

    It "Should have removed desktop icon after uninstall" {
      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\Inno Setup Compiler.lnk" | Should -Not -Exist
    }
  }
}
