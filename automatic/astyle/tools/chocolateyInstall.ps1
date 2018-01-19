$packageId = 'astyle'
$url = 'http://downloads.sourceforge.net/project/astyle/astyle/astyle%202.05.1/AStyle_2.05.1_windows.zip'

Install-ChocolateyZipPackage "$packageId" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

