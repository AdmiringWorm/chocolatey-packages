$packageName = 'Nagstamon'
$installerType = 'EXE'
$url = 'https://nagstamon.ifw-dresden.de/files-nagstamon/stable/Nagstamon_1.0.1_setup.exe'
$url64 = 'https://nagstamon.ifw-dresden.de/files-nagstamon/stable/Nagstamon_1.0.1_setup.exe'
$silentArgs = '/silent'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes