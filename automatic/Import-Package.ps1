param(
  [Parameter(Mandatory = $true)]
  [string]$Name
)

function Import-Package()
{
  param([string]$Name, [string]$GithubRepository)
  If (!(Test-Path "$Name.zip")) {
    $baseUrl = "https://chocolatey.org/packages/$Name"
    $response = Invoke-WebRequest -UseBasicParsing -Uri $baseUrl;
    $downloadUrl = $response.Links | ? title -match "Download.*raw nupkg" | select -first 1 -ExpandProperty href;

    Invoke-WebRequest -UseBasicParsing -Uri $downloadUrl -OutFile "$PSScriptRoot/$Name.zip";
  }

  Expand-Archive "$PSScriptRoot/$Name.zip" "$PSScriptRoot/$Name"
  Remove-Item -Recurse -Force "$PSScriptRoot/$Name/*Content_Types*.xml","$PSScriptRoot/$Name/_rels","$PSScriptRoot/$Name/package"
  $nuspec =  Get-Content -Path "$PSScriptRoot/$Name/$Name.nuspec"
  If (!(Test-Path "$PSScriptRoot/../icons/$Name.png")) {
    $re = "\<iconUrl\>(.+)\<\/iconUrl\>"
    $match = [regex]::Match($nuspec, $re);
    If($match.Success)  {
      try {
        $url = $match.Groups[1].Value;
        $extension = $url -split '\.' | select -last 1;
        $response = Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile "$PSScriptRoot/../icons/$Name.$extension"
        $iconFound = $true;
      } catch {
        Write-Verbose "Unable to download icon";
      }
    }

    if (!$iconFound) {
      Write-Verbose "Unable to parse/download icon..."
      $url = Read-Host -Prompt "Please provide icon url"
      $extension = $url -split '\.' | select -last 1;
      $response = Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile "$PSScriptRoot/../icons/$Name.$extension"
      $iconPath = Resolve-Path "$PSScriptRoot/../icons/$Name.$extension"
    }
  } else {
    $extension = "png";
  }

  $commitHash = git log -1 --format="%H" "$PSScriptRoot/../icons/$Name.$extension";

  if (!$commitHash) {
    git add "$PSScriptRoot/../icons/$Name.$extension";
    git commit -m "Added $Name Icon" "../icons/$Name.$extension";
    $commitHash = git log -1 --format="%H" "../icons/$Name.$extension";
  }

  $iconUrl = "https://cdn.rawgit.com/$GithubRepository/$commitHash/icons/$Name.$extension"
  $nuspec = $nuspec -replace '<iconUrl>.+', "<iconUrl>https://cdn.rawgit.com/$GithubRepository/$commitHash/icons/$Name.$extension</iconUrl>"

  if ($nuspec -match '<packageSourceUrl>.+') {
    $nuspec = $nuspec -replace '<packageSourceUrl>.+', "<packageSourceUrl>https://github.com/$GithubRepository/tree/master/automatic/$Name</packageSourceUrl>"
  } else {
    Write-Warning "<packageSourceUrl> Was NOT found, Please add manually the following to $Name.nuspec:`n`t<packageSourceUrl>https://github.com/$GithubRepository/tree/master/automatic/$Name</packageSourceUrl>";
  }
  $user = git config user.name
  $nuspec = $nuspec -replace "(\<owners\>.+)\<\/owners\>","`$1 $user</owners>"

  $nuspec | Out-File -Encoding utf8 "$PSScriptRoot/$Name/$Name.nuspec";

  $installFile = Get-Content -Path "$PSScriptRoot/$Name/tools/chocolateyInstall.ps1";
  $installerType = [regex]::Match($installFile, "([$]installerType|fileType)\s*=\s*['`"]([^'`"]+)").Groups[2];
  if ($installerType -eq "zip") {
    $installTemplate = "$PSScriptRoot/_template/tools/chocolateyInstallZip.ps1"
  } else {
    $installTemplate = "$PSScriptRoot/_template/tools/chocolateyInstallExe.ps1"
  }
  $url32 = [regex]::Match($installFile, "(url(32)?\s*=\s*)['`"]([^'`"]+)").Groups[3];
  $url64 = [regex]::Match($installFile, "(url64\s*=\s*)['`"]([^'`"]+)").Groups[2];
  $checksum32 = [regex]::Match($installFile, "(checksum(32)?\s*=\s*)['`"]([^'`"]+)").Groups[3];
  $checksum64 = [regex]::Match($installFile, "(checksum64\s*=\s*)['`"]([^'`"]+)").Groups[2];
  $checksumType32 = [regex]::Match($installFile, "(checksumType(32)?\s*=\s*)['`"]([^'`"]+)").Groups[3];
  $checksumType64 = [regex]::Match($installFile, "(checksumType64\s*=\s*)['`"]([^'`"]+)").Groups[2];
  $silentArgs = [regex]::Match($installFile, "(silentArgs\s*=\s*)['`"]([^'`"]+)").Groups[2];
  $validExitCodes =[regex]::Match($installFile, "(validExitCodes\s*=\s*)@\(([^\)]+)").Groups[2]

  $newInstallFile = Get-Content "$installTemplate"

  $newInstallFile = $newInstallFile -replace "(^[$]packageName\s*=\s*)'.*'","`$1'$Name'"
  $newInstallFile = $newInstallFile -replace "(fileType\s*=\s*)'.*'","`$1'$installerType'"
  $newInstallFile = $newInstallFile -replace "(^[$]url32\s*=\s*)'.*'", "`$1'$url32'"
  $newInstallFile = $newInstallFile -replace "(^[$]url64\s*=\s*)'.*'", "`$1'$url64'"
  $newInstallFile = $newInstallFile -replace "(^[$]checksum32\s*=\s*)'.*'", "`$1'$checksum32'"
  $newInstallFile = $newInstallFile -replace "(^[$]checksum64\s*=\s*)'.*'", "`$1'$checksum64'"
  $newInstallFile = $newInstallFile -replace "(^[$]checksumType32\s*=\s*)'.*'", "`$1'$checksumType32'"
  $newInstallFile = $newInstallFile -replace "(^[$]checksumType64\s*=\s*)'.*'", "`$1'$checksumType64'"
  $newInstallFile = $newInstallFile -replace "(silentArgs\s*=\s*)'.*'", "`$1'$silentArgs'"
  $newInstallFile = $newInstallFile -replace "(validExitCodes\s*=\s*)@\(.*\)", "`$1@($validExitCodes)"

  $newInstallFile | Out-File -Encoding utf8 "$PSScriptRoot/$Name/tools/chocolateyInstall.ps1"
}

if (Test-Path "$Name") {
  Remove-Item -Recurse -Force "$Name"
}

Import-Package -Name $Name -GithubRepository "AdmiringWorm/chocolatey-packages"
