# Author: Kim Nordmo <kim.nordmo@gmail.com>
# Last Change: 2017-04-12
<#
.SYNOPSIS
  Publishes the package update status to gitter.

.PARAMETER WebHook
  This is the custom webhook created through gitter integrations.

.PARAMETER MessageFormat
  The format of the message that is meant to be published on gitter.
  {0} = The total number of automated packages.
  {1} = The number of updated packages,
  {2} = The number of published packages,
  {3} = The number of failed packages.
  {4} = The url to the github gist
#>
param(
  $info,
  [string]$WebHook,
  [string]$MessageFormat = "[Update Status: {0} packages, {1} updated, {2} Published, {3} Failed]({4})"
)

#if (!$WebHook) { return }

$updatedPackages = @($Info.result.updated).Count
$publishedPackages = @($Info.result.pushed).Count
$failedPackages = $Info.error_count.total
$gistUrl = $Info.plugin_results.Gist -split '\n' | select -Last 1
$packageCount = $Info.result.all.Length

$gitterMessage = ($MessageFormat -f $packageCount,$updatedPackages,$publishedPackages,$failedPackages,$gistUrl)

$arguments = @{
  Body = if ($failedPackages -gt 0) { "message=$gitterMessage&level=error" } else { "message=$gitterMessage" }
  UseBasicParsing = $true
  Uri = $WebHook
  ContentType = 'application/x-www-form-urlencoded'
}

"Submitting message to gitter."
Invoke-RestMethod @arguments
"Message submitted to gitter."
