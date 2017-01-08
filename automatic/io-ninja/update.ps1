import-module au

$releases = "http://tibbo.com/api/downloads.json"

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
    $json_page = Invoke-RestMethod -Uri $releases -UseBasicParsing;

    $id_item = $json_page.downloads | ? id -eq "ninja_windows_latest" | select -first 1 -expand groups

    $re = "ioninja-.*(x86|amd64)\.msi";
    $url = $id_item.files | ? file -match $re | select -first 2 -expand file

    $version = $url[0] -split '-' | select -Last 1 -Skip 1;
    $url32 = $url[0];
    $url64 = $url[1];

    $Latest = @{
        URL32 = $url32
        URL64 = $url64
        Version = $version
    }

    return $Latest;
}

update
