import-module au

$releases = 'http://releases.0x539.de/gobby/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re    = 'gobby\-[0-9\.]+\.exe$'
    $url   = $releases + ($download_page.links | ? href -match $re | select -Last 1 -expand href)

    $version  = $url -split '[-]|.exe' | select -Last 1 -Skip 1

    return @{ URL32 = $url; Version = $version }
}

update -ChecksumFor 32
