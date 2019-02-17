. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "${env:ProgramFiles}\Tibbo\Ninja*" `
  -customDirectoryArgument "INSTALLDIR=" `
  -test32bit `
  -customUninstallArgs '--skip-autouninstaller' # Necessary due to a driver package
