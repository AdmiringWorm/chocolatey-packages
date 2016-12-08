# AU Packages Template: https://github.com/majkinetor/au-packages-template

param([string] $Name, [string] $ForcedPackages, [string] $Root = "$PSScriptRoot\automatic")

if (Test-Path $PSScriptRoot/update_vars.ps1) { . $PSScriptRoot/update_vars.ps1 }

$Options = [ordered]@{
    Timeout    = 100                                        #Connection timeout in seconds
    UpdateTimeout = 1200
    Threads    = 10                                         #Number of background jobs to use
    Push       = $Env:au_Push -eq 'true'                    #Push to chocolatey
    PluginPath = ''                                         #Path to user plugins

    Report = @{
        Type = 'markdown'                                   #Report type: markdown or text
        Path = "$PSScriptRoot\Update-AUPackages.md"         #Path where to save the report
        Params= @{                                          #Report parameters:
            Github_UserRepo = $Env:github_user_repo          #  Markdown: shows user info in upper right corner
            NoAppVeyor  = $false                            #  Markdown: do not show AppVeyor build shield
            UserMessage = "[History](#update-history) | **USING AU 2016.11.5**" #  Markdown, Text: Custom user message to show
            NoIcons     = $false
            IconSize    = 32
            Title       = ''
        }
    }

    History = @{
      Lines = 30
      Github_UserRepo = $Env:github_user_repo
      Path = "$PSScriptRoot\Update-History.md"
    }

    Gist = @{
        Id          = $Env:gist_id                          #Your gist id or leave empty for anonymous
        ApiKey      = $Env:github_access_token                   #Your github api key
        Path        = "$PSScriptRoot\Update-AUPackages.md","$PSScriptRoot\Update-History.md"  #List of files to add to gist
    }

    Git = @{
        User     = ''                                       #Git username, leave empty if github api key is used
        Password = $Env:github_access_token                      #Password if username is not empty, otherwise api key
    }

    RunInfo = @{
        Exclude = 'password', 'apikey'                      #Option keys which contain those words will be removed
        Path    = "$PSScriptRoot\update_info.xml"           #Path where to save the run info
    }

    ForcedPackages = $ForcedPackages -split ' '
    BeforeEach = {
      param($PackageName, $Options)
      $p = $Options.ForcedPackages | ? { $_ -match "^${PackageName}(?:\:(.+))*$" }
      if (!$p) { return }

      $global:au_Force = $true
      $global:au_Version = ($p -split ':')[1]
    }

    Mail = if ($Env:mail_user) {
            @{
                To          = $Env:mail_user
                Server      = $Env:mail_server
                UserName    = $Env:mail_user
                Password    = $Env:mail_pass
                Port        = $Env:mail_port
                EnableSsl   = $Env:enable_ssl -eq 'true'
                Attachments = "$PSScriptRoot\update_info.xml"
                UserMessage = ''
                SendAlways  = $false                        #Send notifications every time
             }
           } else {}
}

$global:au_Root = $Root
$global:info = updateall -Name $Name -Options $Options

#Uncomment to fail the build on AppVeyor on any package error
if ($global:info.error_count.total) { throw 'Errors during update' }
