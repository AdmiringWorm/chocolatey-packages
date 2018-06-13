# We'll blindly uninstall the extension

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  VsixId      = 'MvcBoilerplateVsix.Microsoft.dafd466d-39dc-487e-846b-7cf0e569821c'
}

Uninstall-VisualStudioVsixExtension @parameters
