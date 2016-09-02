@"
`$env:GIST_DIR = "$PSSCriptRoot\..\..\gists";
`$env:GIST_URL = "https://gist.github.com/AdmiringWorm/747b3ede98c9404e5cb6a399595e7ad1.git"
`$env:GIST_PUSH = 'false';
`$env:GIT_PUSH = 'false';
`$env:APPVEYOR = 'true';
`$env:APPVEYOR_REPO_NAME = "AdmiringWorm/chocolatey-packages";
`$env:APPVEYOR_FORCED_BUILD = 'false';
`$env:APPVEYOR_PULL_REQUEST_NUMBER = 0;
`$env:APPVEYOR_REPO_BRANCH = "master";
"@ | Out-File -Encoding utf8 -NoClobber -FilePath $PSScriptRoot\..\au\update_vars.ps1