Import-Module AU
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$domain       = 'https://coq.inria.fr'
$releases     = "$domain/download"
$softwareName = 'coq*'

function global:au_AfterUpdate {
  Set-DescriptionFromReadme -SkipFirst 1
  Update-ChangelogVersion -version $Latest.Version
  $releaseNotes = "
[Software Changelog]($($Latest.ReleaseNotes))
[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/$($Latest.PackageName.ToLowerInvariant())/Changelog.md)
  "
  Update-Metadata -key "releaseNotes" -value $releaseNotes
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"   = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'"            = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*url64(bit)?\s*=\s*)'.*'"    = "`${1}'$($Latest.URL64)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"       = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'"   = "`${1}'$($Latest.ChecksumType32)'"
      "(?i)^(\s*checksum64\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum64)'"
      "(?i)^(\s*checksumType64\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType64)'"
      "(?i)^(\s*fileType\s*=\s*)'.*'"       = "`${1}'$($Latest.FileType)'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"   = "`${1}'$softwareName'"
    }
  }
}
function global:au_GetLatest {
  try {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  } catch {
    Write-Host $_.Message
    return "ignore";
  }

  $re        = 'i686\.exe$'
  $url32     = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $domain + $_}

  $re        = 'x86_64\.exe$'
  $url64     = $download_page.links | ? href -match $re | select -first 1 -expand href | % { $domain + $_}

  $verRe     = '[-]'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  $version64 = $url64 -split "$verRe" | select -last 1 -skip 1
  if ($version32 -ne $version64) {
    throw "32bit version do not match the 64bit version"
  }

  @{
    URL32        = $url32
    URL64        = $url64
    Version      = $version32
    ReleaseNotes = $download_page.links | ? href -match "CHANGES$" | select -first 1 -expand href | % { $domain + $_ }
    PackageName  = 'Coq'
  }
}

update
