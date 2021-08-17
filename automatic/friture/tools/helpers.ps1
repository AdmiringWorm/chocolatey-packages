function Uninstall-Program {
  param(
    [string]$uninstallString
  )

  if (!$uninstallString) {
    return;
  }

  $packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    softwareName   = 'Friture*'
    fileType       = 'exe'
    file           = $uninstallString
    silentArgs     = '/S'
    validExitCodes = @(0)
  }

  Uninstall-ChocolateyPackage @packageArgs
}
