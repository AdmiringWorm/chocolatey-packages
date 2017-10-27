param(
  [string]$version = '3.6',
  [switch]$replaceInfo
)

Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

# First we need to download the file, especially since we embedd them
# we do it as easy as we can, by making use of iwr
$versionNoDots = $version.Replace('.','')
$uri = "http://liquidninja.com/metapad/downloads/metapad$versionNoDots.zip"
$outFile = "$PSScriptRoot\tools\" + ($uri -split '\/' | select -last 1)
iwr -UseBasicParsing -Uri $uri -OutFile $outFile

if ($replaceInfo) {
  # Then we update all information in the nuspec file
  Update-Metadata -key "version" -value ("$version".TrimEnd('b'))
  . "$PSScriptRoot\..\..\scripts\Update-IconUrl.ps1" -Name metapad -PackagesDirectory "../manual" -Optimize

  $checksum = Get-FileHash -Algorithm 'sha256' -Path $outFile

  $lines = New-Object System.Collections.Generic.List[string]

  $replacement = @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(\s*1\..+)\<.*\>" = "`${1}<$uri>"
      "(?i)(^\s*checksum type\:).*" = "`${1} $($checksum.Algorithm)"
      "(?i)(^\s*checksum(32)?\:).*" = "`${1} $($checksum.Hash)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*`"" = "`${1}$([System.IO.Path]::GetFileName($outFile))`""
    }
    ".\update.ps1" = @{
      "([$]version\s*=\s*)'[\d\.]+'" = "`${1}'$($version)'"
    }
  }

  $replacement.GetEnumerator() | % {
    $values = $_.Value
    $lines = New-Object System.Collections.Generic.List[string]
    $path = Join-Path $PSScriptRoot $_.Key

    $utf8BomEncoding = New-Object System.Text.UTF8Encoding($true)
    $utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($false)

    Get-Content -Path $path -Encoding UTF8 | % {
      $text = $_
      foreach ($keyVal in $values.GetEnumerator()) {
        $text = $text -replace $keyVal.Key,$keyVal.Value
      }
      $lines.Add($text)
    } | Out-Null

    if ($path.EndsWith('.ps1')) {
      [System.IO.File]::WriteAllLines($path, $lines, $utf8BomEncoding)
    } else {
      [System.IO.File]::WriteAllLines($path, $lines, $utf8NoBomEncoding)
    }
  }
}

Set-DescriptionFromReadme -SkipFirst 1
