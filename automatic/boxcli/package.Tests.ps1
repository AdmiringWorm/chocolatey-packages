. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
    -packageName "boxcli" `
    -packagePath "$PSScriptRoot" `
    -streams "latest" `
    -expectedEmbeddedMatch "^box-v[\d\.]+-(x64|x86)\.exe$" `
    -customDirectoryArgument "/D=" `
    -licenseShouldMatch "Apache License" `
    -expectedDefaultDirectory "${env:ProgramFiles}\`@boxcli" `
    -test32Bit `
    -customUninstallChecks @({ It "Sleeping" { sleep -Seconds 5 } })
