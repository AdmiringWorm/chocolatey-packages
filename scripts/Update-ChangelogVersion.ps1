
function Update-ChangelogVersion([string]$version, [string]$format = "## Version: {VERSION} ({DATE})`n") {

  if (!(Test-Path "Changelog.md")) { return }

  Write-Host "Updating changelog version."

  $path = (Resolve-Path "Changelog.md")
  [string[]]$changelog = gc $path -Encoding UTF8 | % {
    if ($_ -match '## Upcoming') {
      $line = ($format -replace '\{VERSION\}',$version -replace '\{DATE\}',(Get-Date -Format 'yyyy-MM-dd'))
    } else {
      $line = $_
    }
    $line
  }

  $utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($false)
  $changelogText = ($changelog -join "`n").Trim()
  [System.IO.File]::WriteAllText($path, "$changelogText`n", $utf8NoBomEncoding)
}
