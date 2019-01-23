Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

$softwareName = 'Folder Size*'

function global:au_AfterUpdate { Update-Changelog -useIssueTitle }

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
      "(?i)^(\s*url\s*=\s*)'.*'" = "`${1}'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function GetResultInformation([string]$url32) {
  $dest = "$env:TEMP\FolderSize.exe"
  Get-WebFile $url32 $dest | Out-Null
  try {
    $version = Get-Item $dest | % { $_.VersionInfo.ProductVersion }

    return @{
      URL32 = $url32
      Version = $version.Trim()
      Checksum32 = Get-FileHash $dest -Algorithm SHA512 | % Hash
      ChecksumType32 = 'sha512'
    }
  } finally {
    Remove-Item -Force $dest
  }
}

function global:au_GetLatest {
  $url32 = "https://www.mindgems.com/software/FolderSize.exe"

  $result = Update-OnETagChanged -execUrl $url32 -OnETagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 }}
  return $result
}

update -ChecksumFor none
