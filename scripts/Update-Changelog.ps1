function Get-IssueDetails() {
  param([int]$issueId)

  $headers = @{}
  if (Test-Path Env:\github_api_key) {
    $headers.Authorization = "token " + $env:github_api_key
  }

  # First check by convention if the upstream url have been set
  $repoUrl = (git remote get-url upstream 2>$null) -split '\.git$' | select -first 1
  if (!($repoUrl)) {
    $repoUrl = (git remote get-url origin 2>$null) -split '\.git$' | select -first 1
  }

  $repoUrl = $repoUrl -replace "^.*github\.com\/(.*)$", '$1'

  $response = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/$repoUrl/issues/$issueId" -Headers $headers


  $result = @{
    Title     = $response.title
    Issue     = $response.html_url
    IssueId   = $response.number
    Labels    = $response.labels | select -expand name
    MainLabel = 'general'
  }

  foreach ($label in $result.Labels) {
    if ($label -match 'migration|bug|enhancement|feature|documentation') {
      $result.MainLabel = $label
      break
    }
  }

  return $result
}


function Parse-ChangelogLine() {
  param($line, [switch]$useIssueTitle)

  $type = $line -replace '.*\*\*([A-Z]+)\:?\*\*\:?.*', '$1'
  $title = $line -replace '.*\*\*([A-Z]+)\:?\*\*\:?\s*'

  if ($title -match '\#([\d]+)') {
    $issueDetails = Get-IssueDetails $Matches[1]

    $title = if ($useIssueTitle) {
      $issueDetails.title -replace '^\([^\)]+\)\s*', ''
    }
    else {
      $title
    }

    $title = $title.Trim()

    return @{
      Title   = $title
      Type    = $issueDetails.MainLabel
      Issue   = $issueDetails.Link
      IssueId = $issueDetails.Id
    }
  }

  $result = @{
    Type  = if ($type -and $type -ne $line) { $type } else { 'general' }
    Title = $title.TrimStart('-', ' ')
  }

  return $result
}

function Parse-Changelog() {
  param($changelogFile, [switch]$useIssueTitle)

  $parsingUpcoming = $false
  $content = Get-Content $changelogFile -Encoding UTF8
  foreach ($line in $content) {
    if (!$parsingUpcoming) {
      if ($line -match '^## UPCOMING') { $parsingUpcoming = $true }
      continue
    }
    elseif ($parsingUpcoming -and [string]::IsNullOrWhiteSpace($line)) {
      continue
    }
    elseif (![string]::IsNullOrWhiteSpace($line) -and $line.StartsWith('##')) {
      break
    }

    Parse-ChangelogLine $line -useIssueTitle:$useIssueTitle
  }
}

function Parse-GitCommit() {
  param($line, [switch]$useIssueTitle)

  if ($line -contains 'skip:changelog' -or $line -contains 'changelog:skip') { return }

  $splits = $line -split ' '
  $commitHash = $splits[0]

  $commitDetail = git show -s --format=%B $commitHash

  $issueLine = $commitDetail | ? { $_ -match "\#[\d]+" } | select -last 1
  $changelogLine = $commitDetail | ? { $_ -match "changelog\:\s*[a-z]*" }
  if ($issueLine) {
    $index = $splits.IndexOf($issueLine)
    if ($index -ge 0) {
      $splits[$index] = $null
    }

    $issueDetails = Get-IssueDetails ($issueLine -replace '.*\#(\d+).*', '$1')
    $title = if ($useIssueTitle) {
      $issueDetails.Title -replace '^\([^\)]+\)\s*', ''
    }
    else {
      [string]::Join(' ', $splits, 1, $splits.Count - 1)
    }

    $title = $title.Trim()

    @{
      Title   = $title
      Type    = $issueDetails.MainLabel
      Issue   = $issueDetails.Issue
      IssueId = $issueDetails.IssueId
    }
  }
  elseif ($changelogLine) {
    $type = $changelogLine -split ':' | select -last 1

    @{
      Title = [string]::Join(' ', $splits, 1, $splits.Count - 1 ).Trim()
      Type  = if ($type) { $type.Trim() } else { 'general' }
    }

  }
}

function Parse-GitHistory() {
  param($directory, [switch]$useIssueTitle)
  $nameOnly = $directory -split '\/|\\' | select -last 1

  $commits = git log --pretty=oneline $directory
  $re = "\($([regex]::Escape($nameOnly))\)"
  $re2 = '\[AU\s*[^\]]*\]'

  foreach ($commit in $commits) {
    if ($commit -match "\s*AU\:.*updated.*") { break; }
    if ($commit -match "$re") {
      Parse-GitCommit ($commit -replace "$re|$re2") -useIssueTitle:$useIssueTitle
    }
  }
}

function HaveItemWithTitle() {
  param([System.Collections.Generic.List[hashtable]]$collection, [string]$title)

  return $null -ne (GetItemWithTitle -collection $collection -title $title)
}

function GetItemWithTitle() {
  param([System.Collections.Generic.List[hashtable]]$collection, [string]$title)

  return $collection | ? { $_.Title -eq $title } | select -first 1
}

function Update-Changelog() {
  param($changelogFile = ".\Changelog.md", [switch]$useIssueTitle, [switch]$skipVersionReplace)
  $changelogFile = Resolve-Path $changelogFile -ea 0

  if (!(Test-Path $changelogFile)) {
    Write-Warning "No Changelog file available and new changelog file disabled."
    return;
  }

  $lines = New-Object 'System.Collections.Generic.List[hashtable]'
  if (Test-Path $changelogFile) {
    Parse-Changelog $changelogFile -useIssueTitle:$useIssueTitle | % { $lines.Add($_) }
  }

  Parse-GitHistory -directory ([System.IO.Path]::GetDirectoryName($changelogFile)) -useIssueTitle:$useIssueTitle | ? { $_ } | % {
    if (!(HaveItemWithTitle $lines $_.Title )) {
      $lines.Add($_)
    }
    else {
      $item = GetItemWithTitle $lines $_.Title
      $item.Issue = $_.Issue
      $item.IssueId = $_.IssueId
      $item.MainLabel = $_.MainLabel
    }
  }

  $changelog = $lines | sort { "$($_.Type) $($_.Title)" } | % {
    $result = "- "
    if ($_.Type -ne 'general') { $result += "**$($_.Type.ToUpper()):** "}
    $result += $_.Title

    if ($_.Issue) {
      $result += " [#$($_.IssueId)]($($_.Issue))"
    }

    $result
  }

  if ($changelog.Count -eq 0) {
    Write-Host "Skipping update of changelog. Nothing to write..."
    return
  }

  Write-Host "Updating changelog`nUpcoming Changes:"
  Write-Host "$changelog"

  $changelog = "## UPCOMING`n" + [string]::join("`n", $changelog) + "`n`n"

  if (Test-Path $changelogFile) {
    $content = Get-Content $changelogFile -Raw
  }
  else {
    $dirName = [System.IO.Path]::GetDirectoryName($changelogFile) -split '\/|\\' | select -last 1
    $content = ""
    $changelog = "# Package changelog for [$dirName](https://community.chocolatey.org/packages/$dirName)`n`n$($changelog.TrimEnd())`n"
  }

  $index = $content.IndexOf('##')
  if ($index -ge 0) {
    $lineIndex = $content.IndexOf("`n", $index)
    if ($lineIndex -ge 0) {
      $substring = $content.Substring($index + 2, $lineIndex - $index - 2).Trim()
      if ($substring -eq 'UPCOMING') {
        $lineIndex = $content.IndexOf('##', $lineIndex)
        if ($lineIndex -eq -1) {
          $lineIndex = $content.Length
        }
        $content = $content.Remove($index, $lineIndex - $index)
      }
    }
  }
  else {
    $index = 0
  }

  $content = $content.Insert($index, $changelog)

  $utf8NoBom = New-Object System.Text.UTF8Encoding($false)

  [System.IO.File]::WriteAllText($changelogFile, $content, $utf8NoBom)

  if ($Latest -and $Latest.Version -and !$skipVersionReplace) {
    Update-ChangelogVersion -version $Latest.Version
  }
}
