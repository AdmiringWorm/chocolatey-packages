function saveGit {
    param(
        [hashtable] $options,
        [PSCustomObject] $Info
    )

    $pushed = $Info.result.pushed;
    If ((!$Info.pushed)) {
        "Git: no packages is pushed to Chocolatey community feed, skipping";
        return;
    }

    ""
    "Executing git pull"
    git checkout master -q
    git pull -q

    "Commiting updated packages to git repository"
    $pushed | % { git add $_.PackageName -q }
    git commit -q -m "UPDATE BOT: $($Info.pushed) packages updated
    [skip ci]"
}