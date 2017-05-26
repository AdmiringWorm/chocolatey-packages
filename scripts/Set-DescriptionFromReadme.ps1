<# AUTHOR: majkinetor; SOURCE: https://github.com/chocolatey/chocolatey-coreteampackages/blob/master/scripts/Set-DescriptionFromReadme.ps1 #>
<#
.SYNOPSIS
  Updates nuspec file description from README.md

.DESCRIPTION
  This script should be called in au_AfterUpdate to put the text in the README.md
  into description tag of the Nuspec file. The current description will be replaced.
  Function will throw an error if README.md is not found.

.PARAMETER SkipFirst
  Number of start lines to skip from the README.md, by default 0.

.PARAMETER SkipLast
  Number of end lines to skip from the README.md, by default 0.

.EXAMPLE
  function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }
#>
function Set-DescriptionFromReadme([int]$SkipFirst=0, [int]$SkipLast=0) {
    if (!(Test-Path README.md)) { throw 'Set-DescriptionFromReadme: README.md not found' }

    Write-Host 'Setting README.md to Nuspec description tag'
    $description = gc README.md -Encoding UTF8
    $endIdx = $description.Length - $SkipLast
    $description = $description | select -Index ($SkipFirst..$endIdx) | Out-String

    Update-Metadata -key "description" -value $description
}
