Import-Module Chocolatey-AU

$releases = 'https://www.claws-mail.org/win32/'
$softwareName = 'Claws Mail*'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  iwr -UseBasicParsing -Uri $($Package.nuspecXml.package.metadata.licenseUrl -replace 'blob','raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$releases>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType32)"
      "(?i)(^\s*checksum(32)?\:).*"       = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"         = "`${1}'$softwareName'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_AfterUpdate($Package) {
  Update-Changelog -useIssueTitle
  Invoke-VirusTotalScan $Package
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $streams = @{}

  $re = '64bit\.exe$'
  $urls = $download_page.links | ? href -match $re | select -expand href | % { 'https://www.claws-mail.org' + $_ }

  $urls | % {
    $verRe = 'mail\-|\-\d+\-(32|64)bit'
    $version = $_  -split "$verRe" | select -Last 1 -Skip 2
    if ($streams.ContainsKey($version)) {
      return
    }

    $re = "$([regex]::Escape($version)).*-32bit\.exe"
    $url32 = $download_page.links | ? href -match $re | select -first 1 -expand href | % { 'https://www.claws-mail.org' + $_ }
    $version32 = $url32 -split "$verRe" | select -last 1 -skip 2

    if ($version -ne $version32) {
      throw "32bit version do not match the 64bit version"
    }

    $version = Get-Version $version

    $streams.Add($version.ToString(2), @{
      URL32 = $url32
      URL64 = $_
      Version = $version
    })
  }

  $key = $streams.Keys | sort -Descending | select -First 1
  $streams.Add('latest', $streams[$key])
  $streams.Remove($key)

  return @{ Streams = $streams }
}

update -ChecksumFor none
