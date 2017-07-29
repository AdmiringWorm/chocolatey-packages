function getVsixData() {
  param([string]$versionRange, [switch]$legacy)

  function convertFrom-Xml() {
    param([xml]$xml)

    $nodes = $xml.SelectNodes('/instances/instance')
    foreach ($node in $nodes) {
      $psobject = New-Object psobject
      foreach ($child in $node.ChildNodes) {
        $psobject | Add-Member NoteProperty $child.Name $child.InnerText
      }

      if ($psobject.installationPath -and (Test-Path "$($psobject.installationPath)\Common7\IDE\VSIXInstaller.exe")) {
        $psobject | Add-Member NoteProperty 'vsixInstaller' "$($psobject.installationPath)\Common7\IDE\VSIXInstaller.exe"
      }

      $psobject
    }
  }

  $arguments = @(
    '-format'
    'xml'
    '-all'
    if ($versionRange) { '-version',$versionRange }
    if ($legacy) { '-legacy' }
  )

  $vswhere = Get-Command vswhere | select -expand Source

  Write-Debug "Calling vswhere with the arguments $arguments"
  $data = convertFrom-Xml (. "$vswhere" $arguments) | ? { $_.vsixInstaller }

  return $data
}
