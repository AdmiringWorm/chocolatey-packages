@"
## Update Variables - AU
#
# This file is not checked in. It exists only locally.
# These same settings should be verified with appveyor.yml

# Job parameters
`$env:au_timeout      = '100'
`$env:au_threads      = '10'
`$env:au_push         = 'true'
`$env:au_force        = 'false'

# Github credentials - used to save result to gist and to commit pushed packages to the git repository
`$env:github_token    = 'YOUR_GITHUB_ACCESS_TOKEN_HERE'
`$env:github_user_repo= 'AdmiringWorm/chocolatey-packages'  #https://github.com/chocolatey/chocolatey-packages-template is 'chocolatey/chocolatey-packages-template'

# Chocolatey API key - to push updated packages
`$env:api_key         = 'YOUR_CHOCO_API_KEY_HERE'

# ID of the gist used to save run results - create a gist under the github_user (secret or not) and grab the id - https://gist.github.com/name/id
`$env:gist_id         = '64ff175b4dcb279dcece41aa21adcbe2'
"@ | Out-File $PSScriptRoot\..\au\update_vars.ps1 -NoClobber


Install-PackageProvider -Name NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module au -Scope AllUsers
Get-Module au -ListAvailable | select Name, Version
