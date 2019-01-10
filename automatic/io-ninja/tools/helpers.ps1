if (!(Test-Path Function:\Import-Certificate)) {
  function Import-Certificate([string]$FilePath, [string]$CertStoreLocation) {
    $certSplits = $CertStoreLocation -replace '^cert\:\\' -split '\\'
    if (!($certSplits.Length -eq 2)) { throw "Unexpected certificate storage location" }

    $certutil = Get-Command "certutil" | Select-Object -ExpandProperty Path

    if (!$certutil) { throw "Path to certutil was not found" }

    $arguments = @(
      '-addstore'
      $certSplits[1]
      "$(Resolve-Path $FilePath)"
    )

    Start-ChocolateyProcessAsAdmin -ExeToRun $certutil -Statements $arguments
  }
}
