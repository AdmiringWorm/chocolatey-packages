function Get-GitlabRepositoryFile {
  param(
    [Parameter(Mandatory = $true)]
    [int]$projectId,
    [Parameter(Mandatory = $true)]
    [string]$filePath,
    [string]$reference = 'main',
    [string]$outFile,
    [string]$gitlabHost = 'https://gitlab.com'
  )

  $gitlabHost = $gitlabHost.TrimEnd('/')
  $encodedPath = [uri]::EscapeDataString($filePath)
  $encodedReference = [uri]::EscapeDataString($reference)
  $uri = "$gitlabHost/api/v4/projects/$projectId/repository/files/$encodedPath/raw?ref=$encodedReference"
  $headers = @{
    Accept       = 'text/plain'
    'User-Agent' = 'Chocolatey-AU'
  }

  if ($outFile) {
    Invoke-WebRequest -UseBasicParsing -Headers $headers -Uri $uri -OutFile $outFile -ErrorAction Stop
    return Get-Item $outFile
  }

  return (Invoke-WebRequest -UseBasicParsing -Headers $headers -Uri $uri -ErrorAction Stop).Content
}
