
function resolveLatestRelease {
  param(
    $response,
    [boolean] $usePrerelease
  )
  $verRegex = "((\d+)(\.\d+){1,3}(\-[a-z]+[0-9]+)?)$";
  if ($usePrerelease) {
    $release = $response | ? tag_name -Match $verRegex | select -First 1;
  }
  else {
    $release = $response | ? prerelease -EQ $usePrerelease | ? tag_name -Match $verRegex | select -First 1;
  }

  if (!$release) {
    return @{};
  }

  $version = $matches[1];

  [array]$assetUrls = $release.assets | ? name -Match "\.(msi|exe|zip|7z)$" | select -expand browser_download_url;
  $assetUrls += @($release.tarball_url; $release.zipball_url)

  return @{
    Name         = $release.name
    Version      = $version
    Assets       = $assetUrls
    IsPreRelease = $release.prerelease -eq "true"
    ReleaseUrl   = $release.html_url
    Body         = $release.body
  };
}

function Get-LatestGithubReleases {
  param(
    [string]$repoUser,
    [string]$repoName,
    [boolean]$includePreRelease = $true
  )

  If (!$includePreRelease) {
    $apiUrl = "https://api.github.com/repos/$($repoUser)/$($repoName)/releases/latest";
  }
  Else {
    $apiUrl = "https://api.github.com/repos/$($repoUser)/$($repoName)/releases";
  }

  $headers = @{}

  If (Test-Path Env:\github_api_key) {
    $headers.Authorization = "token " + $env:github_api_key;
  }

  $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers;

  $latestStableRelease = resolveLatestRelease -response $response -usePrerelease $false;
  $latestRelease = resolveLatestRelease -response $response -usePrerelease $includePreRelease;

  return @{ latest = $latestRelease ; latestStable = $latestStableRelease};
}
