. "$PSScriptRoot\..\..\scripts\Run-PesterTests.ps1"

$packageName = Split-Path -Leaf $PSScriptRoot

if ((Test-Path Env:\ChocolateyToolsLocation)) {
  $defaultDir = $env:ChocolateyToolsLocation
}
else {
  $defaultDir = "C:\Tools"
}

Run-PesterTests `
  -packageName "$packageName" `
  -packagePath "$PSScriptRoot" `
  -expectedDefaultDirectory "$defaultDir\tools\lib\qtcreatorcdbext64" `
  -expectedDefaultDirectory32 "$defaultDir\tools\lib\qtcreatorcdbext32" `
  -test32bit
