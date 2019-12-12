$installDir = Get-AppInstallLocation 'R for Windows*'

if ($installDir) {
  $toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
  Import-Module "$toolsDir\Uninstall-ChocolateyPath.psm1"
  # We want to remove the R.Project bin directory from PATH before upgrading,
  # In case the install directory have changed.
  Uninstall-ChocolateyPath "$installDir\bin"
}
