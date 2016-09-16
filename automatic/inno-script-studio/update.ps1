import-module au

$releases = "https://www.kymoto.org/products/inno-script-studio/downloads"

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
    $download_page = Invoke-WebRequest -Uri $releases;
    $url = "https://www.kymoto.org/downloads/ISStudio_Latest.exe"

    $re = "^\s*[\d_]+"
    $version = $download_page.links | ? href -Match "release-history" | ? innerText -Match $re | select -First 1 -ExpandProperty innerText

    $Latest = @{ URL = $url; Version = $version }
    return $Latest;
}

update -ChecksumFor 32