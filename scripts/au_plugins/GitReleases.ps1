param(
  $Info,
  [string]$ApiToken,
  [switch]$Force
)

[array]$packages = if ($Force) { $Info.result.updated } else { $Info.result.pushed }
if ($packages.Length -eq 0) { Write-Host "No package updated, skipping"; return }

$root = Split-Path $packages[0].Path
$origin = git config --get remote.origin.url

if (!($origin -match "github.com\/([^\/]+\/[^\/\.]+)")) {
  Write-Warning "Unable to parse the repository information, skipping..."
  return;
}

$repository = $matches[1]

Write-Host "Checking if a release already exists"
$date = Get-Date -UFormat "{0:yyyy-MM-dd}"

$headers = @{
  Authorization = "token $ApiToken"
}

try {
  $response = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/$repository/releases/latest" -Headers $headers
  if ($response.tag_name -eq $date) {
    $release = $response
  }
} catch {
  $release = $null
}

if (!$release) {
  $json = @{
    "tag_name" = $date
    "target_commitish" = "master"
    "name" = "Packages updated on $date"
    "body" = "Here we have the packages that was updated on the following date: $date"
    "draft" = $false
    "prerelease" = $false
  } | ConvertTo-Json -Compress

  Write-Host "Creating the new release $date..."
  $release = Invoke-RestMethod -UseBasicParsing -Method Post -Uri "https://api.github.com/repos/$repository/releases" -Body $json -Headers $headers
  if (!$release) {
    Write-Warning "Creating a new release failed, skipping..."
    return
  }
}

$uploadHeaders = $headers.Clone()
$uploadHeaders['Content-Type'] = 'application/zip'
$uploadUrl = $release.upload_url -replace '\{.*\}$',''

$packages | % {
  $path = Resolve-Path "$($_.Path)\*.nupkg"
  $fileName = [System.IO.Path]::GetFileName($path)
  $dirName = [System.IO.Path]::GetFileName($_.Path)
  $version = $fileName.Replace($dirName, '').Replace('.nupkg', '')

  $existing = $release.assets | ? name -eq $fileName
  if ($existing) {
    Write-Host "Removing existing $fileName asset..."
    Invoke-RestMethod -UseBasicParsing -Uri $existing.url -Method Delete -Headers $headers
  }

  $rawContent = [System.IO.File]::ReadAllBytes($path)
  Write-Host "Uploading $fileName asset..."
  Invoke-RestMethod -UseBasicParsing -Uri "${uploadUrl}?name=${fileName}&label=$($_.Name) v$($_.RemoteVersion)" -Body $rawContent -Headers $uploadHeaders -Method Post | Out-Null
}
