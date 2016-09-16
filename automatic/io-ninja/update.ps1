import-module au

$releases = "http://tibbo.com/ninja/downloads.html"

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^[$]checksum32\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
            "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing;

    $re = "ioninja-.*(x86|amd64)\.msi";
    $url = $download_page.Links | ? href -Match $re | select -First 2 -ExpandProperty href;

    $version = $url[0] -split '-' | select -Last 1 -Skip 1;
    $url32 = 'http://tibbo.com' + $url[0];
    $url64 = 'http://tibbo.com' + $url[1];

    $Latest = @{
        URL32 = $url32
        URL64 = $url64
        Version = $version
    }

    return $Latest;
}

update