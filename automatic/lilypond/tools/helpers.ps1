function Uninstall-LilyPond {
  param (
    [pscustomobject]$uninstallKey
  )

  $packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'exe'
    file           = "$($uninstallKey.UninstallString)"
    silentArgs     = '/S'
    validExitCodes = @(0)
  }

  Uninstall-ChocolateyPackage @packageArgs
}
