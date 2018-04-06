$allDeps = @(
  'chocolatey-core.extension'
  'autohotkey.portable'
  'kb2999226'
  'kb3033929'
  'kb3035131'
  'vcredist2012'
  'vcredist2015'
  'vcredist140'
  'dotnet4.0'
  'dotnet4.5'
  'dotnet4.5.1'
  'dotnet4.5.2'
  'dotnet4.6'
  'dotnet4.6.1'
  'dotnet4.6.2'
  'dotnet4.7'
)# | % {
 # "Updating version for dependency $_..."
 # . $PSScriptRoot\Update-Dependency.ps1 $_
#}

$foundDeps = . choco search $allDeps -r | ConvertFrom-Csv -Delimiter '|' -Header 'id','version'

$allDeps | % {
  "Updating version for dependency $_..."
  $dependency = $foundDeps | ? id -eq $_ | select -first 1
  . $PSScriptRoot\Update-Dependency.ps1 $_ -Version $dependency.version
}

# Convert and update other references
@{
  'chocolatey-uninstall.extension' = 'chocolatey-core.extension'
  'vcredist2017'                   = 'vcredist140'
}.GetEnumerator() | % {
  "Changing dependency from $($_.Key) to $($_.Value) and using latest version..."
  $dependency = $foundDeps | ? id -eq $_.Value | select -first 1
  if ($dependency) {
    . $PSScriptRoot\Update-Dependency.ps1 -OldDependencyName $_.Key -NewDependencyName $_.Value -Version $dependency.version
  } else {
    . $PSScriptRoot\Update-Dependency.ps1 -OldDependencyName $_.Key -NewDependencyName $_.Value
  }
}
