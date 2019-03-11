[CmdletBinding()]
param($IncludeStream, [switch]$Force)
Import-Module AU

$repoUser = 'box'
$repoName = 'boxcli'

function global:au_BeforeUpdate($Package) {
  $licenseFile = "$PSScriptRoot\legal\LICENSE.txt"
  if (Test-Path $licenseFile) { rm -Force $licenseFile }

  $licenseUrl = $Package.nuspecXml.package.metadata.licenseUrl -replace '\/(master|v[\d\.]+)\/', "/$($Latest.ReleaseTag)/"

  iwr -UseBasicParsing -Uri $($licenseUrl -replace 'blob', 'raw') -OutFile $licenseFile
  if (!(Get-ValidOpenSourceLicense -path "$licenseFile")) {
    throw "Unknown license download. Please verify it still contains distribution rights."
  }

  $Latest.LicenseUrl = $licenseUrl

  rm "$PSScriptRoot\tools\*.exe", "$PSScriptRoot\tools\*.msi"
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
  $releaseNotes = "[Package Changelog](https://github.com/AdmiringWorm/chocolatey-packages/blob/master/automatic/boxcli/Changelog.md)`n`n## Software Release Notes`n"
  $releaseNotes += $Latest.ReleaseNotes

  Update-Metadata -data @{
    'releaseNotes' = $releaseNotes
    'licenseUrl'   = $Latest.LicenseUrl
  }
}

function global:au_SearchReplace {
  @{
    ".\legal\VERIFICATION.txt"        = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseUri)>"
      "(?i)(\s*32\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL32)>"
      "(?i)(\s*64\-Bit Software.*)\<.*\>" = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum32\:).*"          = "`${1} $($Latest.Checksum32)"
      "(?i)(^\s*checksum64\:).*"          = "`${1} $($Latest.Checksum64)"
      "(?i)(LICENSE\.txt.*)\<[^\>]*\>"    = "`${1}<$($Latest.LicenseUrl)>"
    }
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"         = "`${1}'$($Latest.SoftwareName)'"
      "(?i)(^\s*file\s*=\s*`"[$]toolsPath\\).*"   = "`${1}$($Latest.FileName32)`""
      "(?i)(^\s*file64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
      "(?i)(^\s*fileType\s*=\s*)'.*'"             = "`${1}'$($Latest.FileType)'"
      "(?i)(^\s*silentArgs\s*=\s*)`".*`"#"        = "`${1}`"$($Latest.SilentArgs)`"#"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'"  = "`${1}'$($Latest.SoftwareName)'"
      "(?i)(^\s*fileType\s*=\s*)'.*'"      = "`${1}'$($Latest.FileType)'"
      "(?i)(^\s*silentArgs\s*=\s*)`".*`"#" = "`${1}`"$($Latest.SilentArgs -replace 'Install','Uninstall')`"#"
    }
  }
}

function global:au_GetLatest {
  [array]$releases = Get-AllGithubReleases -repoUser $repoUser -repoName $repoName

  $streams = @{}
  $releases | % {
    if (!($streams.ContainsKey(($_.Version.ToString(2))))) {
      [array]$execs = $_.Assets | ? { $_ -match '\.msi' }
      if ($execs.Count -ne 1 ) {
        [array]$execs = $_.Assets | ? { $_ -match '\.exe' }
        if ($execs.Count -ne 2) { return }
        else {
          $url32 = $execs | ? { $_ -match 'x86\.exe$' } | select -first 1
          $url64 = $execs | ? { $_ -match 'x64\.exe$' } | select -first 1
          $silentArgs = '/S'
          $softwareName = '@box/cli'
        }
      }
      else {
        $url32 = ''
        $url64 = $execs | select -first 1
        $silentArgs = '/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`"'
        $softwareName = 'BoxCLI'
      }

      $data = @{
        Version      = $_.Version.ToString()
        ReleaseTag   = $_.Name
        URL64        = $url64
        ReleaseNotes = $_.Body
        ReleaseUri   = $_.ReleaseUrl
        SilentArgs   = $silentArgs
        SoftwareName = $softwareName
      }
      if ($url32) {
        $data['URL32'] = $url32
      }

      $streams.Add($_.Version.ToString(2), $data)
    }
  }

  $key = $streams.Keys | sort -Descending | select -First 1
  $streams.Add('latest', $streams[$key])
  $streams.Remove($key)

  return @{ Streams = $streams }
}

update -ChecksumFor none -IncludeStream $IncludeStream -Force:$Force
