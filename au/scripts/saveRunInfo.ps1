function saveRunInfo {
    param([PSCustomObject]$Info)
    $Info | Export-Clixml update_info.xml
}