function Update-OnETagChanged() {
  param(
    [uri]$execUrl,
    [string]$saveFile = ".\info",
    [scriptblock]$OnETagChanged,
    [scriptblock]$OnUpdated
  )

  return Update-OnHeaderChanged `
    -execUrl $execUrl `
    -saveFile $saveFile `
    -headerName 'ETag' `
    -OnHeaderChanged $OnETagChanged `
    -OnUpdated $OnUpdated
}
