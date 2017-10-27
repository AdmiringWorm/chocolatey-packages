$name = 'quassel'
$installerType = 'exe'
$url = 'http://quassel-irc.org/pub/quassel-x86-setup-0.12.4.exe'
$url64 = 'http://quassel-irc.org/pub/quassel-x86-setup-0.12.4.exe'
$silentArgs = '/s /S /q /Q /quiet /silent /SILENT /VERYSILENT'

$packageArgs = @{
checksum ='F2ADE0C9541CC5DB2A64DF7456FE158A'
checksum64 ='F2ADE0C9541CC5DB2A64DF7456FE158A'
}

Install-ChocolateyPackage @packageArgs $name $installerType $silentArgs $url $url64
