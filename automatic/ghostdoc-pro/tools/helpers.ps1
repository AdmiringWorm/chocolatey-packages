function UninstallGhostDoc() {
  param($msiGuid)

  $packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    file          = ''
    fileType      = 'msi'
    silentArgs    = "$msiGuid /qn /norestart"
    validExitCodes= @(0)
  }

  Uninstall-ChocolateyPackage @packageArgs
}
