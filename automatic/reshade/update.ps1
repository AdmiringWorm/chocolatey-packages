Import-Module Chocolatey-AU

$releases = 'https://reshade.me/'

function global:au_BeforeUpdate {
  rm -force -ea 0 "$PSScriptRoot\tools\*.exe"
  $Latest.FileName32 = "reshade.exe"
  $output = "$PSScriptRoot\tools\$($Latest.FileName32)"
  Invoke-WebRequest -UseBasicParsing -Uri $Latest.URL32 -OutFile $output -Headers @{ Referer = $releases }
  $Latest.ChecksumType32 = 'sha256'
  $Latest.Checksum32 = Get-FileHash -Algorithm $Latest.ChecksumType32 -Path $output | % Hash

  $licenseData = Get-GithubRepositoryLicense -repoUser crosire -repoName reshade
  $licensePath = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licensePath) { rm $licensePath }

  Invoke-WebRequest -Uri $licenseData.download_url -UseBasicParsing -OutFile "$licensePath"
  $Latest.LicenseUrl = $licenseData.html_url
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle

  Update-Metadata -key "licenseUrl" -value $Latest.LicenseUrl
  Invoke-VirusTotalScan $Package
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*1\..+)\<.*\>"              = "`${1}<$($Latest.URL32)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^[$]exe\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = '\.exe$'
  $url32 = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { $releases + $_ }

  $verRe = '[_]|\.exe$'
  $version32 = $url32 -split "$verRe" | select -last 1 -skip 1
  @{
    URL32   = [uri]$url32
    Version = [version]$version32
  }
}

update -ChecksumFor none -NoCheckUrl
