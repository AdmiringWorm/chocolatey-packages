Import-Module "AU"

$releases = "https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-commitizen"

function global:au_BeforeUpdate($Package) {
  $vscode = $Package.nuspecXml.package.metadata.dependencies.dependency | ? id -Match '^vscode$'

  if (([version]$Latest.VsCodeVersion) -lt '1.30.0') {
    $vscode.version = '1.30.0' # We force minimum of version 1.30.0 due to it implemented the ability to install with specific extension version
  }
  else {
    $vscode.version = $Latest.VsCodeVersion
  }
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(commitizen@)[^']*" = "`${1}$($Latest.RemoteVersion)"
    }
  }
}

function global:au_AfterUpdate {
  Update-Changelog -useIssueTitle
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  if ($download_page.Content -match 'assetUri":"([^"]+)') {
    $assetUri = $Matches[1]
  }
  else {
    throw "Unable to grab asset uri file"
  }

  $json = Invoke-RestMethod -UseBasicParsing -Uri "$assetUri/Microsoft.VisualStudio.Code.Manifest"

  $vsCodeVersion = $json.engines.vscode.TrimStart('^')
  if ($vsCodeVersion -eq '1.5.0') { $vsCodeVersion = '1.5' }

  @{
    Version       = $json.version
    RemoteVersion = $json.version
    VsCodeVersion = $vsCodeVersion
  }
}

update -ChecksumFor none
