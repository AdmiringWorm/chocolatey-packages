function Normalize-Version {
  [CmdletBinding()]
  [OutputType([String])]
  param(
    [Parameter(Mandatory)]
    [string] $Version
  )

  if ($Version -match "^(?<major>\d+)\.(?<minor>\d+)(?:\.(?<patch>\d+))?(?:\.(?<revision>\d))?(?<tag>-[a-z][\d\.a-z-]*)?$") {
    $major = $Matches['major']
    $minor = $matches['minor']
    $patch = if ($Matches.ContainsKey('patch')) { $Matches['patch'] } else { '0' }

    $newVersion = "$major.$minor.$patch"

    if ($Matches.ContainsKey('revision') -and (([int]$Matches['revision']) -gt 0)) {
      Write-Host "Non-Zero revision found. Appending revision"
      $newVersion = "$newVersion.$($Matches['revision'])"
    }

    if ($Matches.ContainsKey('tag')) {
      $tag = $Matches['tag']
      Write-Host "Tag $tag found, appending."
      $newVersion = "${newVersion}${tag}"
    }

    $newVersion

  } else {
    $Version
  }
}
