param(
  [Parameter(Mandatory = $true)]
  [string]$OldDependencyName,
  [string]$NewDependencyName = $OldDependencyName,
  [string]$Version = $null
)

if (!($Version)) {
  $nuspecFile = Get-ChildItem -Path "$PSScriptRoot/../" -Include "$NewDependencyName.nuspec" -Recurse

  if (!($nuspecFile)) {
    # Lets check with choco
    $Version = ((choco search $NewDependencyName -r) | ? { $_ -match "^$NewDependencyName\|" }) -split '\|' | select -last 1
  } else {
    gc $nuspecFile.FullName | ? { $_ -match "\<version\>(.+)\<\/version\>" } | Out-Null
    $Version = $Matches[1]
    if ($Version -eq "{{PackageVersion}}") {
      $Version = ((choco info $NewDependencyName -r) | ? { $_ -match "^$NewDependencyName\|" }) -split '\|' | select -last 1
    }
  }

  if (!($Version)) {
    Write-Error "Unable to get version for $NewDependencyName"
    return
  }
}

$re = "\<dependency\s*id=`"$OldDependencyName`"(\s*version=`".+`")?"
$versionRe = "\<dependency\s*id=`"$NewDependencyName`"\s*version=`"$Version`""

$filesWithDependency = Get-ChildItem -Path "$PSScriptRoot/../" -Include "*.nuspec" -Recurse | ? { gc $_.FullName | ? { $_ -match $re -and $_ -notmatch $versionRe } } | select -expand FullName

$encoding = New-Object System.Text.UTF8Encoding($false)

foreach ($file in $filesWithDependency) {
  $content = [System.IO.File]::ReadAllLines($file, $encoding)
  $content = $content -replace "$re","`<dependency id=`"$NewDependencyName`" version=`"$Version`"" -replace '\t','  '
  [System.IO.File]::WriteAllText($file, "$($content -join "`n")`n", $encoding)
  Write-Verbose "Updated $NewDependencyName version in $($file -split '\\' | select -last 1)"
}

$encoding = $null
