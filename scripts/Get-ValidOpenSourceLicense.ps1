function Get-ValidOpenSourceLicense() {
  param(
    [Parameter(Mandatory = $true, ParameterSetName = "text")]
    [string[]]$content,
    [Parameter(Mandatory = $true, ParameterSetName = "filesystem")]
    [string]$path
  )

  $validMatches = @(
    '^\s*GNU (AFFERO|LESSER)? GENERAL PUBLIC LICENSE'
    "^Mozilla Public License Version 2.0"
    '^\s*Apache License'
    '^MIT License'
    '^ISC License'
    '\<http\:\/\/unlicense\.org\>\s*$'
  )

  if ($path) {
    $content = Get-Content -Encoding UTF8 -Path $path
  }

  $hasMatch = $content | ? {
    $line = $_
    $validMatches | % { $line -match $validMatches }
  }

  if ($hasMatch) { return $true } else { return $false }
}
