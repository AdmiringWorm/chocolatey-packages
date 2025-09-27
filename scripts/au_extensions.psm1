# Export all the extensions that are meant to be used
# within a au update script here.

# We just specify the functions we want to export
# but the file containing the functions is expected
# to be named using the same name.
$funcs = @(
  'Set-DescriptionFromReadme'
  'Update-Changelog'
  'Update-ChangelogVersion'
  'Update-Metadata'
  'Get-LatestGithubReleases'
  'Get-AllGithubReleases'
  "Update-OnETagChanged"
  "Update-OnHeaderChanged"
  "Get-ValidOpenSourceLicense"
  "Get-GithubRepositoryLicense"
  "Invoke-VirusTotalScan"
  "Get-NormalizedVersion"
)

$funcs | % {
  . "$PSScriptRoot\$_.ps1"
  Export-ModuleMember -Function $_
}
