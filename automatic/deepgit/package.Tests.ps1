. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$toolsPath = if (Test-Path Env:\ChocolateyToolsLocation) { $env:ChocolateyToolsLocation } else { "$env:SystemDrive\tools" }

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles(x86)}\DeepGit" `
  -customDirectoryArgument "/DIR=" `
  -customUninstallChecks @( { It "Sleeping" { sleep -Seconds 5 } })

# TODO: Added parameter testing

Describe "$packageName configuration verification" {
  Context "Parameters" {
    It "Should create configuration file when 'UseInf' is specified" {
      # Remove the configuration file if it exists
      $confFile = "${env:SystemDrive}\deepgit.inf"
      if (Test-Path "$confFile") { rm "${confFile}" }
      Install-Package `
        -packageName $packageName `
        -packagePath $PSScriptRoot `
        -additionalArguments "--params '`"/UseInf:${confFile}`"'" | Should -Be 0

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
        -additionalArguments "--params '`"/UseInf:${PSScriptRoot}\test.inf`"'" | Should -Be 0

      "C:\Testing\DeepGit" | Should -Exist
      $startMenu = [System.Environment]::GetFolderPath('CommonPrograms')
      "$startMenu\NewDeepGit" | Should -Exist
      $desktop = [System.Environment]::GetFolderPath('CommonDesktopDirectory')
      "$desktop\DeepGit.lnk" | Should -Not -Exist
    }

    It "Should uninstall package after creating configuration file" {
      Uninstall-Package `
        -packageName $packageName

      sleep -Seconds 5

      "C:\Testing\DeepGit" | Should -Not -Exist
      $startMenu = [System.Environment]::GetFolderPath('CommonStartMenu')
      "$startMenu\NewDeepGit" | Should -Not -Exist
    }
  }
}
