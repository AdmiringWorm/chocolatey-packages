$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'r.project'
  fileType      = 'exe'
  softwareName  = 'R for Windows*'
  file          = "$toolsDir\R-4.2.0-win.exe"
  silentArgs    = "/SILENT /SUPPRESSMSGBOXES /SP- /LOG=`"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes= @(0)
}

$pp = Get-PackageParameters
if ($pp.UseInf) {
  if (Test-Path "$($pp.UseInf)") {
    Write-Host "Using existing configuration file at '$($pp.UseInf)'"
    $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /LOADINF=`"$($pp.UseInf)`""
  } else {
    Write-Host "Creating new configuration file at '$($pp.UseInf)'"
    $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) /SAVEINF=`"$($pp.UseInf)`""
  }
}

Install-ChocolateyInstallPackage @packageArgs

if ($pp.AddToPath) {
  # Get the location of R.Project install directory
  $installDir = Get-AppInstallLocation $packageArgs["softwareName"]
  if ($installDir -and (Test-Path "$installDir\bin")) {
    Install-ChocolateyPath "$installDir\bin"
  } else {
    Write-Warning "Unable to detect installation directory, or directory do not have a bin directory."
    Write-Warning "Skipping adding bin directory to PATH..."
  }
}
