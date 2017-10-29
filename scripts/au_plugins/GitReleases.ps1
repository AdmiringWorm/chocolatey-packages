param(
    $Info,
    [string]$ApiToken,
    [ValidateSet('date', 'package')]
    [string]$releaseType,
    [string]$releaseHeader = $null,
    [string]$releaseDescription = $null,
    [string]$dateFormat = '{0:yyyy-MM-dd}',
    [switch]$Force
)

function GetOrCreateRelease() {
    param(
        [string]$tagName,
        [string]$releaseName,
        [string]$releaseDescription,
        [string]$repository,
        $headers)

    try {
        Write-Host "Checking for a release using the tag: $tagName..."
        Write-Debug "Checking releases with`nInvoke-RestMethod -UseBasicParsing -Uri `"https://api.github.com/repos/$repository/releases/tags/$tagName`" -Headers $headers"
        $response = Invoke-RestMethod -UseBasicParsing -Uri "https://api.github.com/repos/$repository/releases/tags/$tagName" -Headers $headers | ? tag_name -eq $tagName
        if ($response) {
            return $response
        }
    }
    catch {
    }

    $json = @{
        "tag_name"         = $tagName
        "target_commitish" = "master"
        "name"             = $releaseName
        "body"             = $releaseDescription
        "draft"            = $false
        "prerelease"       = $false
    } | ConvertTo-Json -Compress

    Write-Host "Trying to create the new release $tagName..."
    Write-Debug "Creating release with`nInvoke-RestMethod -UseBasicParsing -Method Post -Uri `"https://api.gitub.com/repos/$repository/releases`" -Body $json -Headers $headers"
    return Invoke-RestMethod -UseBasicParsing -Method Post -Uri "https://api.github.com/repos/$repository/releases" -Body $json -Headers $headers
}

[array]$packages = if ($Force) { $Info.result.updated } else { $Info.result.pushed }
if ($packages.Length -eq 0) { Write-Host "No package updated, skipping"; return }

$origin = git config --get remote.origin.url

if (!($origin -match "github.com\/([^\/]+\/[^\/\.]+)")) {
    Write-Warning "Unable to parse the repository information, skipping..."
    return;
}
$repository = $Matches[1]

$headers = @{
  Authorization = "token $ApiToken"
}

if ($releaseType -eq 'date' -and !$releaseHeader) {
  $releaseHeader = 'Packages updated on <date>'
} elseif (!$releaseHeader) {
  $releaseHeader = '<PackageName> <RemoteVersion>'
}

if ($releaseType -eq 'date' -and !$releaseDescription) {
  $releaseDescription = 'We had packages that was updated on <date>'
} elseif (!$releaseDescription) {
  $releaseDescription = '<PackageName> was updated from version <NuspecVersion> to <RemoteVersion>'
}

$date = Get-Date -UFormat $dateFormat

if ($releaseType -eq 'date') {
  $release = GetOrCreateRelease `
    -tagName $date `
    -releaseName ($releaseHeader -replace '<date>',$date) `
    -releaseDescription ($releaseDescription -replace '<date>',$date) `
    -repository $repository `
    -headers $headers

  if (!$release) {
    Write-Error "Unable to create a new release, please check your permissions..."
    return
  }
}

$uploadHeaders = $headers.Clone()
$uploadHeaders['Content-Type'] = 'application/zip'

$packages | % {
  if ($releaseType -eq 'package') {
    $releaseName = $releaseHeader -replace '<PackageName>',$_.Name -replace '<RemoteVersion>',$_.RemoteVersion -replace '<NuspecVersion>',$_.NuspecVersion -replace '<date>',$date
    $packageDesc = $releaseDescription -replace '<PackageName>',$_.Name -replace '<RemoteVersion>',$_.RemoteVersion -replace '<NuspecVersion>',$_.NuspecVersion -replace '<date>',$date

    $release = GetOrCreateRelease `
      -tagName "$($_.Name)-$($_.RemoteVersion)" `
      -releaseName $releaseName `
      -releaseDescription $packageDesc `
      -repository $repository `
      -headers $headers
  }

  $path = Resolve-Path "$($_.Path)\*.nupkg"
  $fileName = [System.IO.Path]::GetFileName($path)
  $dirName = [System.IO.Path]::GetFileName($_.Path)

  $existing = $release.assets | ? name -eq $fileName
  if ($existing) {
    Write-Host "Removing existing $fileName asset..."
    Invoke-RestMethod -UseBasicParsing -Uri $existing.url -method Delete -Headers $headers | Out-Null
  }

  $uploadUrl = $release.upload_url -replace '\{.*\}$',''
  $rawContent = [System.IO.File]::ReadAllBytes($path)
  Write-Host "Uploading $fileName asset..."
  Invoke-RestMethod -UseBasicParsing -Uri "${uploadUrl}?name=${fileName}&label=$($_.Name) v$($_.RemoteVersion)" -Body $rawContent -Headers $uploadHeaders -Method Post | Out-Null
}
