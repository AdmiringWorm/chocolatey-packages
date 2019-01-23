. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch 'GNU GENERAL PUBLIC LICENSE' `
  -expectedEmbeddedMatch '^golly-[\d\.]+-win-(32|64)bit.zip$' `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\golly\tools\golly-*" `
  -expectedShimFiles "bgolly.exe","Golly.exe" `
  -customInstallChecks @({
    It "Should register application in app paths" {
      "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Golly.exe" | Should -Exist
    }
  }) `
  -customUninstallChecks @({
    It "Should remove application in app paths" {
      "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Golly.exe" | Should -Not -Exist
    }
  }) `
  -test32bit
