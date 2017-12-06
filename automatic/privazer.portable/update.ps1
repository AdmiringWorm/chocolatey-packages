. "$PSScriptRoot\..\privazer\update.ps1"

function global:au_AfterUpdate {
  Remove-Item "$PSScriptRoot\tools\*.exe"
  Update-Changelog -useIssueTitle
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*url\s*=\s*)'.*'" = "`${1}'$($Latest.URL_P)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

update -ChecksumFor 32
