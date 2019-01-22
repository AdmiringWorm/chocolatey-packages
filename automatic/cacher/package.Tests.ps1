. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

Run-PesterTests `
  -packageName "cacher" `
  -packagePath "$PSScriptRoot" `
  -customDirectoryArgument "/D=" `
  -expectedDefaultDirectory "${env:LocalAppData}\Programs\cacher" `
