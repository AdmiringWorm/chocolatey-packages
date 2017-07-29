$scriptDir = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

function Uninstall-VisualStudioExtension() {
  param(
    [parameter(Mandatory = $true)][string]$packageName,
    [parameter(Mandatory = $true)][string]$vsixId,
    [string]$versionRange = $null
  )

  . "$scriptDir\getVsixData.ps1"
  . "$scriptDir\getSkuName.ps1"

  if ($versionRange -and $versionRange -match "^[\[\)]?([2-9][^\d]|1[0-4])") {
    $vsData = GetVsixData -versionRange $versionRange -legacy
  } else {
    $vsData = GetVsixData -versionRange $versionRange
  }

  $legacyInstalled = $false

  $vsData | % {
    if ($_.displayName) {
      Write-Host "Uninstalling $packageName for $($_.displayName)..."
    } elseif(!$legacyInstalled) {
      Write-Host "Uninstalling $packageName for Visual Studio $($_.installationVersion) and below..."
      $legacyInstalled = $true
    } else { continue; }

    $args = @(
      "/uninstall:$vsixId"
      if ($env:chocolateyInstallOverride -ne $true) { '/quiet' }
      if ($_.displayName) { "/skuVersion:$($_.installationVersion)","/skuName:$(getSkuName $_.displayName)" }
    )

    Start-ChocolateyProcess -statements $args -exeToRun $_.vsixInstaller -elevate `
      -ValidExitCodes @(0, 1002, 2003) # We ignore 2003 error codes (NoApplicableSKUsException)
  }
}
