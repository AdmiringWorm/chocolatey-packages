Import-Module "AU"

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
      "(ignore@)[^']*" = "`${1}$($Latest.RemoteVersion)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing "https://marketplace.visualstudio.com/items?itemName=codezombiech.gitignore"

  if ($download_page.Content -match 'source":"([^"]+)') {
    $manifestFile = $Matches[1]
  }
  else {
    throw "Unable to grab manifest file"
  }

  $json = Invoke-RestMethod -UseBasicParsing $manifestFile

  $vsCodeVersion = $json.engines.vscode.TrimStart('^')

  @{
    Version       = $json.version
    RemoteVersion = $json.version
    VsCodeVersion = $vsCodeVersion
  }
}

$global:au_Force = $true
update -ChecksumFor none
