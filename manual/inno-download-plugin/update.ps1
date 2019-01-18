import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

Set-DescriptionFromReadme -SkipFirst 1

. "$PSScriptRoot\..\..\scripts\Update-IconUrl.ps1" -Name "inno-download-plugin" -PackagesDirectory "..\manual"

iwr "https://bitbucket.org/mitrich_k/inno-download-plugin/downloads/idpsetup-1.5.1.exe" -OutFile "$PSSCriptRoot/tools/idpsetup-1.5.1.exe"

# Uncomment the following line before doing a manual update
#Update-Changelog -useIssueTitle
