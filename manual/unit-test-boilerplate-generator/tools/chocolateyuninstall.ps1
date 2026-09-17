# We'll blindly uninstall the extension

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  VsixId      = 'UnitTestBoilerplate.RandomEngy.ca0bb824-eb5a-41a8-ab39-3b81f03ba3fe'
}

Uninstall-VisualStudioVsixExtension @parameters
