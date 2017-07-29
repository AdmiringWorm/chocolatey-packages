function Install-VisualStudioExtension() {
  param(
    [parameter(Mandatory = $true)][string]$packageName,
    [parameter(Mandatory = $true)][string]$url,
    [parameter(Mandatory = $false)][string]$checksum = '',
    [parameter(Mandatory = $false)][string]$checksumType = '',
    [parameter(Mandatory = $false)][string]$versionRange = $null,
    [parameter(Mandatory = $false)][hashtable]$options = @{Headers=@{}},
    [parameter(ValueFromRemainingArguments = $true)][Object[]] $ignoredArguments
  )

  Write-FunctionCallLogMessage -Invocation $MyInvocation -Parameters $PSBoundParameters

  $fileType = 'vsix'

  $chocTempDir = $env:TEMP
  $tempDir = Join-Path $chocTempDir "$packageName"
  if ($env:chocolateyPackageVersion -ne $null) { $tempDir = Join-Path $tempDir "$($env:chocolateyPackageVersion)" }
  $tempDir = $tempDir -replace '\\chocolatey\\chocolatey\\', '\chocolatey\'
  if (![System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null }
  $downloadFilePath = Join-Path $tempDir "$($packageName)Install.$fileType"

  if ($url -eq '' -or $url -eq $null) {
    throw "A url needs to be specified."
  }

  $filePath = Get-ChocolateyWebFile $packageName $downloadFilePath $url -checksum $checksum -checksumType $checksumType -options $options -getOriginalFileName
  Install-VisualStudioInstallExtension $packageName $filePath $versionRange
}
