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
  -expectedDefaultDirectory "$defaultDir\qtcreator\lib\qtcreatorcdbext64" `
  -expectedDefaultDirectory32 "$defaultDir\qtcreator\lib\qtcreatorcdbext32" `
  -test32bit
