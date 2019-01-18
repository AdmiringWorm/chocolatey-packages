﻿$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86) {
  throw "The SheepIt windows client does not support 32bit windows..."
}

# Check if the sheepit process is running
$runningProcess = Get-Process -Name "sheepit*"
if ($runningProcess) {
  # We can't try closing it, as the main program is detected as 'OpenJDK'
  throw "The SheepIt client is running, please close it before trying to install/upgrade a new version."
}

$packageToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packageClientPath = "$packageToolsPath\"
$toolsPath = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
$clientOutputPath = "$toolsPath\sheepit.exe"

if (!(Test-path $toolsPath)) {
  Write-Host "Creating $env:ChocolateyPackageName tools directory..."
  mkdir $toolsPath -Force
}
Write-Host "Moving $env:ChocolateyPackageName executable to tools directory..."
mv -Path $packageClientPath $clientOutputPath -Force
