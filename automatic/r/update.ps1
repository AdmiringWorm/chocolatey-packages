Import-Module Chocolatey-AU

$releases = 'https://cloud.r-project.org/bin/windows/base/'

function global:au_SearchReplace {
  @{
    ".\r.nuspec" = @{
      "(\<dependency .+?`"r.project`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $fileName = $download_page.links | ? href -match $re | select -First 1 -expand href

  $version = $fileName -split '[\-]' | select -Last 1 -Skip 1

  return @{
    URL32      = $releases + $fileName
    Version    = $version
    FileName32 = $fileName
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none
}
