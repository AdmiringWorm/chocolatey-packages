# We'll blindly uninstall the extension

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  VsixId      = '4c82e17d-927e-42d2-8460-b473ac7df316'
}

Uninstall-VisualStudioVsixExtension @parameters
