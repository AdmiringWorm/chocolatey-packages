import-module au

$releases = 'https://cran.r-project.org/bin/windows/base/'
$softwareName = 'R for Windows*'

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  Get-RemoteFiles -FileNameBase $Latest.FileName32.TrimEnd('.exe') -DontAppendArch -Purge
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt" = @{
      "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(1\..+)\<.*\>"          = "`${1}<$($Latest.URL32)>"
      "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
      "(?i)(checksum:).*"       = "`${1} $($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(`"`[$]toolsDir\\).*`""      = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*softwareName\s*=\s*)'.*'"   = "`${1}'$softwareName'"
      "(?i)(^\s*packageName\s*=\s*)'.*'" = "`${1}'$($Latest.PackageName)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases

  $re       = '\.exe$'
  $fileName = $download_page.links | ? href -match $re | select -First 1 -expand href

  $version  = $fileName -split '[\-]' | select -Last 1 -Skip 1

  return @{
    URL32 = $releases + $fileName
    Version = $version
    FileName32 = $fileName
  }
}

update -ChecksumFor none
