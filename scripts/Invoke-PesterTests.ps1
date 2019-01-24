param(
  [string]$artifactsDirectory = "$env:TEMP\artifacts",
  [string]$validateAgainst = "origin/master",
  [switch]$runAllTests
)

function GetTestPathsFromDiff() {
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNull()]
    [string]$diffAgainst
  )
  $paths = git diff "${diffAgainst}..." --name-only | % {
    if ($_.StartsWith('..')) {
      $path = Split-Path -Parent $_
    }
    else {
      $root = REsolve-Path "$PSScriptRoot\.." -Relative
      $path = Split-Path -Parent "$root\$_"
    }

    while ($path -and !(Test-Path "$path\*.Tests.ps1")) {
      $path = Split-Path -Parent $path
    }

    if ($path) { $path }
  } | select -Unique

  return $paths
}

function Invoke-PesterTests() {
  param(
    [string]$artifactsDirectory,
    [string]$validateAgainst,
    [switch]$runAllTests
  )

  if ($runAllTests) {
    $paths = gci .. -Filter "*.Tests.ps1" -Recurse | % { Split-path -Parent $_.FullName } | select -Unique
  }
  else {
    $paths = GetTestPathsFromDiff -diffAgainst $validateAgainst
  }

  $testResultDirectory = "$artifactsDirectory\test-results"
  if (!(Test-Path $testResultDirectory)) { mkdir -Force $testResultDirectory }
  $shouldFail = $false
  $failedCount = 0
  $paths | % {
    $packageName = Split-Path -Leaf $_
    $testFile = "${testResultDirectory}\$packageName.xml"
    $res = Invoke-Pester -Script (Resolve-path "$_\*.Tests.ps1") -OutputFormat "NUnitXml" -OutputFile $testFile -PassThru
    $failedCount += $res.FailedCount

    if (Test-Path Env:\APPVEYOR_JOB_ID) {
      $wc = New-Object 'System.Net.WebClient'
      $wc.UploadFile("https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)", (Resolve-Path $testFile))
    }
  }

  if ($failedCount -gt 0) {
    if (Test-Path Env:\APPVEYOR_JOB_ID) {
      throw "$($failedCount) tests failed"
    }
    else {
      Write-Warning "$($failedCount) tests failed"
    }
  }
}

Invoke-PesterTests -artifactsDirectory $artifactsDirectory -validateAgainst $validateAgainst -runAllTests:$runAllTests
