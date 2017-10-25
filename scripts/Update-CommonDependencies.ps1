
# Update existing common dependencies
@(
  'chocolatey-core.extension'
  'autohotkey.portable'
  'kb2999226'
  'dotnet4.0'
  'vcredist2012'
  'vcredist140'
  'dotnet4.6'
) | % {
  "Updating version for dependency $_..."
  . $PSScriptRoot\Update-Dependency.ps1 $_
}

# Convert and update other references
@{
  'chocolatey-uninstall.extension' = 'chocolatey-core.extension'
  'vcredist2015' = 'vcredist140'
  'vcredist2017' = 'vcredist140'
}.GetEnumerator() | % {
  "Changing dependency from $($_.Key) to $($_.Value) and using latest version..."
  . $PSScriptRoot\Update-Dependency.ps1 -OldDependencyName $_.Key -NewDependencyName $_.Value
}
