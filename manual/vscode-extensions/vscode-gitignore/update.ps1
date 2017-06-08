import-module "$PSScriptRoot\..\..\..\scripts\au_extensions.psm1"

Set-DescriptionFromReadme

. "$PSScriptRoot\..\..\..\scripts\Update-IconUrl.ps1" -Name "vscode-gitignore" -PackagesDirectory "..\manual\vscode-extensions"
