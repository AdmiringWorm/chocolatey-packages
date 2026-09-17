# We'll blindly uninstall the extension

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  VsixId      = 'DisposableFixer.Microsoft.e69d15ad-e40a-412c-a444-cfb06057928c'
}

Uninstall-VisualStudioVsixExtension @parameters
