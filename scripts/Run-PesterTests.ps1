function Run-PesterTests() {
  param(
    [Parameter(Mandatory = $true)][string]$packageName,
    [Parameter(Mandatory = $true)][string]$packagePath,
    [string[]]$streams = $null,
    [string]$expectedEmbeddedMatch,
    [string]$licenseShouldMatch,
    [string]$expectedDefaultDirectory,
    [string]$customDirectoryArgument,
    [string[]]$expectedShimFiles,
    [switch]$metaPackage
  )

  function installPackage([string[]]$additionalArguments) {
    $arguments = @(
      "install"
      $packageName
      "--source=`"$packagePath;chocolatey`""
      "--ignorepackagecodes"
      "--cache-location=C:\chocolatey-cache"
      "-y"
    )
    if ($additionalArguments) { $arguments += $additionalArguments }

    $chocoPath = Get-Command choco.exe | % Source

    Start-Process -Wait -NoNewWindow -FilePath $chocoPath -ArgumentList $arguments

    return $LASTEXITCODE
  }

  function uninstallPackage([string[]]$additionalArguments) {
    $arguments = @(
      "uninstall"
      $packageName
      "--allversions"
      "-y"
    )
    if ($additionalArguments) { $arguments += $additionalArguments }

    $chocoPath = Get-Command choco.exe | % Source

    Start-Process -Wait -NoNewWindow -FilePath $chocoPath -ArgumentList $arguments

    return $LASTEXITCODE
  }

  Import-Module Pester

  Describe "$packageName package verification" {
    rm "$packagePath\*.nupkg"

    Context "Updating" {
      if ($streams) {
        # First remove the existing nupkg files
        $streams | % {
          $streamName = $_
          It "Should update and create a new nupkg file with stream: $streamName" {
            # First gather the current package count
            $currentPkgCount = ([array](ls "$packagePath\*.nupkg")).Count
            $expectedPkgCount = $currentPkgCount + 1
            . (Resolve-Path "$PSScriptRoot\..\update_all.ps1") -Name $packageName -ForcedPackage "$packageName\$streamName"

            $nowPkgCount = ([array](ls "$packagePath\*.nupkg")).Count

            $nowPkgCount | Should -BeExactly $expectedPkgCount
          }
        }
      }
      else {
        It "Should update and create a new nupkg file" {
          . (Resolve-Path "$PSScriptRoot\..\update_all.ps1") -Name $packageName -ForcedPackage "$packageName"

          $nowPkgCount = ([array]"ls $packagePath\*.nupkg").Count
          $nowPkgCount | Should -BeExactly 1
        }
      }

      It "All packages should be less than 200MB in size" {
        $maxSize = 200MB

        ls "$packagePath\*.nupkg" | % {
          $_.Length | Should -BeLessOrEqual $maxSize
        }
      }

      if (!$metaPackage) {
        It "Nuspec should include tools directory" {
          $nuspecContent = Get-Content "$packagePath\$packageName.nuspec" -Encoding UTF8

          $hasMatch = $nuspecContent | ? { $_ -match '^\s*<file.*src="tools\\\*\*"' }

          $hasMatch | Should -BeTrue
        }
      }

      if ($expectedEmbeddedMatch) {
        It "All embedded files should match" {
          [array]$allFiles = ls "$packagePath\tools" | ? { $_.Extension -match "^.*\.(exe|msi|zip|vsix|7z)$" }

          $allFiles.Count | Should -BeGreaterThan 0

          $allFiles | % {
            $_.Name | Should -MatchExactly $expectedEmbeddedMatch
          }
        }

        It "Nuspec should include legal directory" {
          $nuspecContent = Get-Content "$packagePath\$packageName.nuspec" -Encoding UTF8

          $hasMatch = $nuspecContent | ? { $_ -match '^\s*<file.*src="legal\\\*\*"' }

          $hasMatch | Should -BeTrue
        }

        It "LICENSE.txt file should be inside legal directory" {
          $legalDir = "$packagePath\legal"
          $licensePath = "$legalDir\LICENSE.txt"

          $legalDir | Should -Exist
          $licensePath | Should -Exist
          if ($licenseShouldMatch) {
            $licensePath | Should -FileContentMatch $licenseShouldMatch
          }
        }

        It "VERIFICATION.txt file should be inside legal directory" {
          $legalDir = "$packagePath\legal"
          $verificationPath = "$legalDir\VERIFICATION.txt"

          $legalDir | Should -Exist
          $verificationPath | Should -Exist
        }
      }
    }

    if (!$metaPackage) {
      # TODO: Need to test every nupkg package in the folder

      Context "Installing/Uninstalling" {

        It "Should install package with default arguments" {
          installPackage | Should -Be 0

          if ($expectedDefaultDirectory) {
            $expectedDefaultDirectory | Should -Exist
          }
        }

        if ($expectedShimFiles -and $expectedShimFiles.Count -gt 0) {
          $expectedShimFiles | % {
            $shimFile = $_
            It "Should have created shimfile $shimFile" {
              "${env:ChocolateyInstall}\bin\$shimFile" | Should -Exist
            }
          }
        }

        It "Should uninstall package with default arguments" {
          uninstallPackage | Should -Be 0

          if ($expectedDefaultDirectory) {
            $expectedDefaultDirectory | Should -Not -Exist
          }
        }

        if ($expectedShimFiles -and $expectedShimFiles.Count -gt 0) {
          $expectedShimFiles | % {
            $shimFile = $_
            It "Should have removed shimfile $shimFile" {
              "${env:ChocolateyInstall}\bin\$shimFile" | Should -Not -Exist
            }
          }
        }


        if ($customDirectoryArgument) {
          $customPath = "C:\$([System.Guid]::NewGuid().ToString())"
          It "Should install package with custom path" {
            installPackage -additionalArguments "--install-arguments=`"${customDirectoryArgument}$customPath`"" | Should -Be 0

            $customPath | Should -Exist
          }

          if ($expectedShimFiles -and $expectedShimFiles.Count -gt 0) {
            $expectedShimFiles | % {
              $shimFile = $_
              It "Should have created shimfile $shimFile when using custom directory" {
                "${env:ChocolateyInstall}\bin\$shimFile" | Should -Exist
              }
            }
          }

          It "Should uninstall package with custom path" {
            uninstallPackage | Should -Be 0

            $customPath | Should -Not -Exist
          }

          if ($expectedShimFiles -and $expectedShimFiles.Count -gt 0) {
            $expectedShimFiles | % {
              $shimFile = $_
              It "Should have removed shimfile $shimFile" {
                "${env:ChocolateyInstall}\bin\$shimFile" | Should -Not -Exist
              }
            }
          }
        }
      }
    }
  }


}
