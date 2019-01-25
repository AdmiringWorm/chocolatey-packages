Import-Module AU
. "$PSScriptRoot\..\ghostdoc-pro\update.ps1"

$releases = 'http://submain.com/download/ghostdoc/enterprise/registered/'
$referer = 'http://submain.com/download/ghostdoc/enterprise/'
$softwareName = 'GhostDoc Enterprise'

function global:au_GetLatest {
  @{
    URL32   = $releases
    Version = GetVersion
  }
}

update -ChecksumFor none -NoCheckUrl
