$ErrorActionPreference = 'Stop'
$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$filter = [system.text.regularexpressions.regex]::escape((Join-Path $toolsPath "te"))

Remove-Process -PathFilter $filter | Out-Null