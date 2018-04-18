$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'http://ubi.li/4vxt9'
  softwareName   = 'Uplay'
  checksum       = '7ACE4EBD71B7DDDA01BCF2F6F99DC626F03863242FDD2F9391D7D9AF9293B2E8C717625C9E7620F4EB47E9F4E9253BD531C7237DFA8F8BDC6CC9DEBD28304757'
  checksumType   = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
