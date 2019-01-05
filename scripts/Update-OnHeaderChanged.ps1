function Update-OnHeaderChanged() {
  param(
    [uri]$execUrl,
    [string]$saveFile = ".\info",
    [string]$headerName = 'ETag',
    [scriptblock]$OnHeaderChanged,
    [scriptblock]$OnUpdated
  )

  $request = [System.Net.WebRequest]::CreateDefault($execUrl)

  try {
    $response = $request.GetResponse()
    $etag = $response.Headers.Get($headerName)
  }
  finally {
    $response.Dispose()
    $response = $null
  }

  $saveResult = $false
  if (!(Test-Path $saveFile) -or ($global:au_Force -eq $true)) {
    $result = . $OnHeaderChanged
    $saveResult = $true
  }
  else {
    $existingInfo = (Get-Content $saveFile -Encoding UTF8 -TotalCount 1) -split '\|'

    if ($existingInfo[0] -ne $etag) {
      $result = . $OnHeaderChanged
      $saveResult = $true
    }
    else {
      $result = . $OnUpdated
      $result["Version"] = $existingInfo[1]
      $result[$headerName] = $existingInfo[0]
      $saveResult = $false
    }
  }

  if ($saveResult) {
    $result[$headerName] = $etag
    "$($result[$headerName])|$($result["Version"])" | Out-File $saveFile -Encoding utf8 -NoNewline
  }

  return $result
}
