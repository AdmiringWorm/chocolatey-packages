import-module "$PSScriptRoot\..\..\..\scripts\au_extensions.psm1"

Set-DescriptionFromReadme -SkipFirst 1

. "$PSScriptRoot\..\..\..\scripts\Update-IconUrl.ps1" -Name "vscode-gitignore" -PackagesDirectory "..\manual\vscode-extensions"
