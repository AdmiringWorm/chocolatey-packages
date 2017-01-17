$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$filePath = "$toolsPath\ASP.NET%20MVC%20Boilerplate_x32.vsix"

$vsixUrl =  "file://" + $filePath.Replace("\", "/")

$parameters = @{
    PackageName = "asp.net-mvc-boilerplate"
    VsixUrl = $vsixUrl
}

Install-ChocolateyVsixPackage @parameters
