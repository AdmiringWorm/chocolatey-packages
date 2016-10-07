param(
  [string]$Name = $null,
  [string]$GithubRepository = "AdmiringWorm/chocolatey-packages"
)

function Update-Icon()
{
  param([string]$Name, [string]$GithubRepository)

  $nuspec = gc "$PSScriptRoot/$Name/$Name.nuspec" -Encoding utf8;
  $iconPath = "$PSScriptRoot/../icons/$Name.png";
  if ((git status $iconPath -s)) {
    git add $iconPath
    git commit -m "Added/Updated $Name Icon" "$iconPath"
  }

  $commitHash = git log -1 --format="%H" "$iconPath";

  $nuspec = $nuspec -replace '<iconUrl>.+', "<iconUrl>https://cdn.rawgit.com/$GithubRepository/$commitHash/icons/$Name.png</iconUrl>"
  $nuspec | Out-File -Encoding utf8 "$PSScriptRoot/$Name/$Name.nuspec";
}

If ($Name) {
  Update-Icon -Name $Name -GithubRepository $GithubRepository;
  return;
}

$directories = Get-ChildItem -Path "$PSScriptRoot" -Directory;

foreach ($directory in $directories) {
  if ((Test-Path "$($directory.FullName)/$($directory.Name).nuspec")) {
    Update-Icon -Name $directory.Name -GithubRepository $GithubRepository
  }
}
