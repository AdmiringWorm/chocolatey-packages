Import-Module AU

$repoInfo = @{
  repoUser = 'securitywithoutborders'
  repoName = 'hardentools'
}

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUrl)>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
  }
}

function global:au_AfterUpdate {
  Update-Metadata -key 'releaseNotes' -value "
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/hardentools/Changelog.md)

## Software Changelog

$($Latest.ReleaseNotes)
"

  Update-Changelog -useIssueTitle
}

function addStream($release, $stream, $name) {
  if (!($stream | ? Version -eq $release.Version)) {
    $stream.Add($name, @{
        Version      = $release.Version
        URL32        = $release.Assets | ? { $_ -match '\.exe$' }
        ReleaseNotes = $release.Body
      })
  }
}

function global:au_GetLatest {
  $release = Get-LatestGithubReleases @repoInfo

  $streams = @{}

  addStream $release.latestStable $streams 'stable'
  addStream $release.latest $streams 'latest' # Temporarily disabled, until first version is approved

  return @{ Streams = $streams }
}

update -ChecksumFor none
