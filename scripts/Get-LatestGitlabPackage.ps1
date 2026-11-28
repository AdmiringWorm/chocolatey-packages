function Get-LatestGitlabPackage {
  param(
    [Parameter(Mandatory = $true)]
    [int]$projectId,
    [Parameter(Mandatory = $true)]
    [string]$packageName,
    [string]$gitlabHost = 'https://gitlab.com'
  )

  $gitlabHost = $gitlabHost.TrimEnd('/')
  $apiRoot = "$gitlabHost/api/v4/projects/$projectId"
  $apiHeaders = @{
    Accept       = 'application/json'
    'User-Agent' = 'Chocolatey-AU'
  }

  function Get-GitlabApiItems($uri) {
    $items = @()
    $page = 1

    do {
      $response = Invoke-WebRequest -UseBasicParsing -Headers $apiHeaders -Uri "$uri&page=$page" -ErrorAction Stop
      $items += @($response.Content | ConvertFrom-Json)
      $nextPage = $response.Headers['X-Next-Page']
      $page = if ($nextPage) { [int]$nextPage } else { 0 }
    } while ($page -gt 0)

    return $items
  }

  $packagesUri = "$apiRoot/packages?package_name=$([uri]::EscapeDataString($packageName))&package_type=generic&status=default&per_page=100"
  [array]$packages = Get-GitlabApiItems $packagesUri
  $versionedPackages = $packages | ForEach-Object {
    try {
      [pscustomobject]@{
        Package = $_
        Version = Get-Version $_.version
      }
    }
    catch {
      Write-Verbose "Ignoring GitLab package with invalid version '$($_.version)'."
    }
  }
  $latestPackage = $versionedPackages |
    Sort-Object Version -Descending |
    Select-Object -First 1 -ExpandProperty Package

  if (!$latestPackage) {
    throw "No valid default generic '$packageName' package was found for GitLab project $projectId."
  }

  $packageFilesUri = "$apiRoot/packages/$($latestPackage.id)/package_files?per_page=100"
  [array]$packageFiles = Get-GitlabApiItems $packageFilesUri
  $escapedPackageName = [uri]::EscapeDataString($latestPackage.name)
  $escapedVersion = [uri]::EscapeDataString($latestPackage.version)

  [array]$files = $packageFiles | ForEach-Object {
    [pscustomobject]@{
      Name     = $_.file_name
      Url      = "$apiRoot/packages/generic/$escapedPackageName/$escapedVersion/$([uri]::EscapeDataString($_.file_name))"
      Sha256   = $_.file_sha256
      Size     = $_.size
      Created  = $_.created_at
    }
  }

  return @{
    Name       = $latestPackage.name
    Version    = $latestPackage.version
    PackageId  = $latestPackage.id
    PackageUrl = "$gitlabHost$($latestPackage._links.web_path)"
    Files      = $files
    Options    = @{
      Headers = @{
        Accept       = 'application/octet-stream'
        'User-Agent' = 'Chocolatey-AU'
      }
    }
  }
}
