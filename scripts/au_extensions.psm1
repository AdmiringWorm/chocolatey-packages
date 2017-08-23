# Export all the extensions that are meant to be used
# within a au update script here.

# We just specify the functions we want to export
# but the file containing the functions is expected
# to be named using the same name.
$funcs = @(
  'Get-PaddedVersion'
  'Get-RedirectedUrl'
  'Set-DescriptionFromReadme'
  'Update-ChangelogVersion'
  'Update-Metadata'
  'Get-RedirectedUrl'
)

$funcs | % {
  . "$PSScriptRoot\$_.ps1"
  Export-ModuleMember -Function $_
}
