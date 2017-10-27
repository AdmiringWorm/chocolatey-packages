$name = 'quassel'
$installerType = 'exe'
$silentArgs = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'
$unpath = "${Env:ProgramFiles(x86)}\Quassel\uninstall.exe"

#$processor = Get-WmiObject Win32_Processor
#$is64bit = $processor.AddressWidth -eq 64
#  if ($is64bit) {
#    $unpath = "${Env:ProgramFiles(x86)}\Quassel\unintstall.exe"
#  } else {
#    $unpath = "$Env:ProgramFiles\Quassel\unintstall.exe"
#}

Uninstall-ChocolateyPackage $name $installerType $silentArgs $unpath
