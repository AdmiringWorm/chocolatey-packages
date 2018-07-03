# We'll blindly uninstall the extension

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  VsixId      = ''
}

Uninstall-VisualStudioVsixExtension @parameters
