Import-Module au
Import-Module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

$releases = 'https://www.xvid.com/download/'

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-ChangelogVersion -version $Latest.Version
}

function global:au_SearchReplace {
  @{
    '.\legal\VERIFICATION.txt'      = @{
      '(?i)(mirror on\s*)\<.*\>' = "`${1}<$releases>"
      '(?i)(1\..+)\<.*\>'        = "`${1}<$($Latest.URL32)>"
      '(?i)(checksum type:).*'   = "`${1} $($Latest.ChecksumType32)"
      '(?i)(checksum:).*'        = "`${1} $($Latest.Checksum32)"
    }
    '.\tools\chocolateyInstall.ps1' = @{
      "(?i)(`"`[$]toolsDir\\).*`"" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36'

  $re = 'Xvid.*\.exe';
  $url = $download_page.links | Where-Object href -Match $re | Select-Object -First 1 -ExpandProperty href;

  $version = $url -split '-' | Select-Object -Last 1 -Skip 1

  @{
    Version = $version
    URL32   = $url
  }
}

try {
  update -ChecksumFor none
}
catch {
  if ($_ -match "^Can't validate URL") {
    Write-Host 'Executable not found again'
    'ignore'
  }
  else {
    throw $_
  }
}
