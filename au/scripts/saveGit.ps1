function saveGit {
    param(
        [hashtable] $options,
        [PSCustomObject] $Info
    )

    $pushed = $Info.result.pushed;
    If ((!$Info.pushed) -and (!$true)) {
        "Git: no packages is pushed to Chocolatey community feed, skipping";
        return;
    }

    ""
    "Executing git pull"
    git checkout master
    git pull

    "Commiting updated packages to git repository"
    $pushed | % { git add $_.PackageName }
    git commit -m "UPDATE BOT: $($Info.pushed) packages updated
    [skip ci]"
}