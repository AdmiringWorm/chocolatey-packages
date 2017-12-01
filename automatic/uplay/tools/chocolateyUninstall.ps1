. (Join-Path (Split-Path -parent $MyInvocation.MyCommand.Definition) 'helpers\helpers.ps1')

$packageTitle   = "Uplay"
$trySilent      = 1;




try {

    AutoUninstall `
        -programName    $packageTitle `
        -trySilent      $trySilent

} catch {
    throw $_.Exception
}
