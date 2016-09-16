import-module au

$releases = "https://www.xvid.com/download/"

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing;

    $re = "Xvid.*\.exe";
    $url = $download_page.links | ? href -Match $re | select -First 1 -ExpandProperty href;

    $version = $url -split '-' | select -Last 1 -Skip 1;

    $Latest = @{
      Version = $version
      URL = $url
    }

    return $Latest;
}

update -ChecksumFor 32