
function Get-RedirectedUrl() {
  param(
    [Parameter(Mandatory = $true)]
    [uri]$url,
    [uri]$referer
  )

  $req = [System.Net.WebRequest]::CreateDefault($url)
  if ($referer) {
    $req.Referer = $referer
  }
  $resp = $req.GetResponse()

  if ($resp -and $resp.ResponseUri.OriginalString -ne $url) {
    Write-Host "Found redirected url '$($resp.ResponseUri)"
    $result = $resp.ResponseUri.OriginalString
  } else {
    Write-Warning "No redirected url was found, returning given url."
    $result = $url
  }

  $resp.Dispose()
  return $result
}
