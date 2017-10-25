﻿$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$32bitExec = "$toolsPath\"
$64bitExec = "$toolsPath\"
$destination = "$toolsPath\tx.exe"

if (Test-Path $destination) { Remove-Item -Force $destination }

if ((Get-ProcessorBits 32) -or ($env:chocolateyForceX86 -eq $true)) {
  Move-Item -Force $32bitExec $destination
  Remove-Item -Force $64bitExec
} else {
  Move-Item -Force $64bitExec $destination
  Remove-Item -Force $32bitExec
}
