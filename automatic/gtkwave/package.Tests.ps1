. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -licenseShouldMatch 'GNU General Public License' `
  -expectedEmbeddedMatch '^gtkwave-[\d\.]+-bin-win32.zip$' `
  -expectedDefaultDirectory "${env:ChocolateyInstall}\lib\gtkwave\tools\gtkwave" `
  -expectedShimFiles "gtkwave.exe" `
  -notExpectedShimFiles "evcd2vcd.exe","fst2vcd.exe","fstminer.exe","ghwdump.exe","lxt2miner.exe","lxt2vcd.exe","rtlbrowse.exe","shmidcat.exe","twinwave.exe","vcd2lxt.exe","vcd2vzt.exe","vermin.exe","vzt2vcd.exe","vztminer.exe","xml2stems.exe" `
  -customInstallChecks @(
    {
      It "Should have removed archive from package directory" {
        "${env:ChocolateyInstall}\lib\gtkwave\tools\*.zip" | Should -Not -Exist
      }

      It "Should create file to generate gui shim" {
        "${env:ChocolateyInstall}\lib\gtkwave\tools\gtkwave\bin\gtkwave.exe.gui" | Should -Exist
      }
    }
  )
