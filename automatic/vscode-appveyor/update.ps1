Import-Module "AU"

$releases = "https://marketplace.visualstudio.com/items?itemName=ivangabriele.vscode-appveyor"

function global:au_BeforeUpdate($Package) {
  $vscode = $Package.nuspecXml.package.metadata.dependencies.dependency | ? id -Match '^vscode$'

  if (([version]$Latest.VsCodeVersion) -lt '1.30.0') {
    $vscode.version = '1.30.0'
  }
  else {
    $vscode.version = $Latest.VsCodeVersion
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(appveyor@)[^']*" = "`${1}$($Latest.RemoteVersion)"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing $releases

  if ($download_page.Content -match 'source":"([^"]+)') {
    $manifestFile = $Matches[1]
  }
  else {
    throw "Unable to grab manifest file"
  }

  $json = Invoke-RestMethod -UseBasicParsing $manifestFile

  $vsCodeVersion = $json.engines.vscode.TrimStart('^')
  if ($vsCodeVersion -eq '1.5.0') { $vsCodeVersion = '1.5' }

  @{
    Version       = $json.version
    RemoteVersion = $json.version
    VsCodeVersion = $vsCodeVersion
  }
}

update -ChecksumFor none
