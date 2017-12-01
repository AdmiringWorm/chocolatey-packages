# ====================================================
# GetMenuStartPath
# ====================================================
# Grabs Menu Start location from registry.
#
# @return   {string}    Menu Start path
# ====================================================

Function GetMenuStartPath(){
  return (Get-ItemProperty -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders")."Start Menu"
}





# ====================================================
# GetUninstallString
# ====================================================
# Searches Registry for the uninstall string
#
# @param    {string}    $programName    Regex pattern for full program name, as its referred to in registry
# @param    {bool}      $trySilent      Try checking for silent uninstall string?
# @param    {bool}      $skipMsi        Should MSi be ignored (if EXE takes care of them automatically)
# @return   {string}                    Full uninstall path (no flags)
# ====================================================

Function GetUninstallString{
  param(
    [string]  $programName, 
    [bool]    $trySilent = 0,
    [bool]    $skipMsi   = 0
  )

  $uninstallType = "UninstallString"

  # establish all possible locations for uninstaller to be stored
  $local_key      = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall'
  $machine_key32  = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
  $machine_key64  = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
  $reg_locations  = @()

  if(Test-Path "$local_key"){
    $reg_locations += "$local_key\*"
  }

  if(Test-Path "$machine_key32"){
    $reg_locations += "$machine_key32\*"
  }

  if( ((Get-WmiObject Win32_Processor).AddressWidth -eq 64) -and (Test-Path "$machine_key64") ) {
    $reg_locations += "$machine_key64\*"
  }
  
  if($trySilent){
    $uninstallType = "QuietUninstallString"
  }

  $uninstallers = ( `
                    Get-ItemProperty -Path $reg_locations | `
                    ?{ $_.DisplayName -match "$programName" } `
                  ) | `

                  ?{ $_.$uninstallType -ne $null} | `

                  select -exp $uninstallType -unique

  if($skipMsi -eq 1){
    $uninstallers = $uninstallers | ?{ $_  -notmatch "^msiexec*"}
  }

  # find and return the actual uninstaller path
  return $uninstallers
}





# ====================================================
# AutoUninstall
# ====================================================
# Tries to autouninstall a package
#
# @param    {string}    $programName        (required)  Full program name, as its referred to in registry
# @param    {bool}      $trySilent          (optional)  Try checking for silent uninstall string?
# @param    {bool}      $skipMsi        Should MSi be ignored (if EXE takes care of them automatically)
# @param    {string}    $silentArgs         (optional)  Additional silent uninstall arguments to 
#                                                       be added to the ones detected in registry
# @param    {object}    $ValidExitCodes     (optional)  Passing exit codes
# @return   {void}                    
# ====================================================

Function AutoUninstall {
  param(
    [string]  $programName, 
    [bool]    $trySilent      = 0,
    [bool]    $skipMsi        = 0,
    [string]  $silentArgs     = '',
              $validExitCodes = @(0)
  )

  try {
      $uninstallers = GetUninstallString `
                        -programName  $programName `
                        -trySilent    $trySilent `
                        -skipMsi      $skipMsi


      # determine the name we're searching for in registry
      $uninstallerRegistryQuery = "UninstallString"
      if($trySilent -eq 1){
          $uninstallerRegistryQuery = "QuietUninstallString"
      }


      #loop through all returned strings and trigger corresponding uninstaller
      if($uninstallers){
        ForEach ($uninstaller in $uninstallers) {
          $chocoUninst = 1  

          # define vars for default MSI
          if($uninstaller -like "MsiExec.exe /x*"){

              $uninstaller    = ($uninstaller -replace '^.*?\{(.*?)\}', '{$1}')
              $installerType  = "msi"
              $silentArgs += " /qn"

          # define vars for msi with /i flag
          }elseif($uninstaller -like "MsiExec.exe /i*"){

            $chocoUninst  = 0;  
            $uninstaller  = ($uninstaller -replace '^MsiExec.exe ', '')
            $silentArgs += " /qn"

          # define vars for EXE
          }else{

              # if there are any flags passed, extract them, otherwise PS/Chocolatey will freak out
              if($uninstaller -match '^.*?\.exe\"\s*?\/.*$'){
                  $silentArgs += ($uninstaller -replace '^.*?\.exe\"\s+(.*?)$', ' $1')
                  $uninstaller = ($uninstaller -replace '^(.*?\.exe\")\s+.*?$', '$1')
              }

              $installerType  = "exe"
          }


          
          # uninstall package
          if($chocoUninst -eq 1){

            Uninstall-ChocolateyPackage `
              -PackageName    "$programName" `
              -FileType       $installerType `
              -SilentArgs     "$($silentArgs)" `
              -File           "$($uninstaller)" `
              -ValidExitCodes $validExitCodes

          }else{

            Start-ChocolateyProcessAsAdmin "$($uninstaller)" 'msiexec' -validExitCodes $validExitCodes

          }


        }
      }




  } catch {
    throw $_.Exception
  }



}






# ====================================================
# GetBinRoot
# ====================================================
# Negotiates BinRoot path
#
# @return   {string}    Full binroot path
# ====================================================

Function GetBinRoot(){

  $path = 'C:\tools'

  if($env:ChocolateyBinRoot -ne $null){
    $path = $env:ChocolateyBinRoot
  }

  return $path
}







# ====================================================
# KillAsap
# ====================================================
# Kills process as soon as it launches
#
# @param   {string}    Process Name
# @return  {void}
# ====================================================
Function KillAsap([string]$appName){
    if($appName -ne $null){
        $process = (Get-Process $($appName))
        if(!$process){
            start-sleep -m 250
            KillAsap $appName
        }else{
            $process | Stop-Process -force
        }

    }
}











# ====================================================
# Import-Certificate
# ====================================================
# Function to import security certificates.
# NOTE: To get a list of available store names, run the following command:
# dir cert: | Select -Expand StoreNames
#
# Example Usages:
# Import-Certificate -CertFile "VeriSign_Expires-2028.08.01.cer" -StoreNames AuthRoot, Root -LocalMachine
# Import-Certificate -CertFile "VeriSign_Expires-2018.05.18.p12" -StoreNames AuthRoot -LocalMachine -CurrentUser -CertPassword Password -Verbose
# dir -Path C:\Certs -Filter *.cer | Import-Certificate -CertFile $_ -StoreNames AuthRoot, Root -LocalMachine -Verbose
#
# @src      http://poshcode.org/3518
# @depends  Powershell 2+
#
# @param    {string}    $CertFile       Full path to .crt file
# @param    {list}      $StoreNames     Comma separated list of strings corresponding to Crtificate shops:
#                                       SmartCardRoot | UserDS | AuthRoot | CA | Trust | Disallowed | My | 
#                                       Root | TrustedPeople | TrustedPublisher
# @param    {bool}      $LocalMachine   Using the local machine certificate store to import the certificate
# @param    {bool}      $CurrentUser    Using the current user certificate store to import the certificate
# @param    {string}    $CertPassword   The password which may be used to protect the certificate file
# @param    {bool}      $Verbose        Spit out stuff         
# @return   {string}                    Full uninstall path (no flags)
# ====================================================

# Function to import security certificates.
# http://poshcode.org/3518
# NOTE: To get a list of available store names, run the following command:
# dir cert: | Select -Expand StoreNames
#

Function Import-Certificate{
  param
  (
    [IO.FileInfo] $CertFile = $(throw "Paramerter -CertFile [System.IO.FileInfo] is required."),
    [string[]] $StoreNames = $(throw "Paramerter -StoreNames [System.String] is required."),
    [switch] $LocalMachine,
    [switch] $CurrentUser,
    [string] $CertPassword,
    [switch] $Verbose
  )
  
  begin
  {
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Security")
  }
  
  process 
  {
        if ($Verbose)
    {
            $VerbosePreference = 'Continue'
        }
    
    if (-not $LocalMachine -and -not $CurrentUser)
    {
      Write-Warning "One or both of the following parameters are required: '-LocalMachine' '-CurrentUser'. Skipping certificate '$CertFile'."
    }

    try
    {
      if ($_)
            {
                $certfile = $_
            }
            $cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2 $certfile,$CertPassword
    }
    catch
    {
      Write-Error ("Error importing '$certfile': $_ .") -ErrorAction:Continue
    }
      
    if ($cert -and $LocalMachine)
    {
      $StoreScope = "LocalMachine"
      $StoreNames | ForEach-Object {
        $StoreName = $_
        if (Test-Path "cert:\$StoreScope\$StoreName")
        {
          try
          {
            $store = New-Object System.Security.Cryptography.X509Certificates.X509Store $StoreName, $StoreScope
            $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
            $store.Add($cert)
            $store.Close()
            Write-Verbose "Successfully added '$certfile' to 'cert:\$StoreScope\$StoreName'."
          }
          catch
          {
            Write-Error ("Error adding '$certfile' to 'cert:\$StoreScope\$StoreName': $_ .") -ErrorAction:Continue
          }
        }
        else
        {
          Write-Warning "Certificate store '$StoreName' does not exist. Skipping..."
        }
      }
    }
    
    if ($cert -and $CurrentUser)
    {
      $StoreScope = "CurrentUser"
      $StoreNames | ForEach-Object {
        $StoreName = $_
        if (Test-Path "cert:\$StoreScope\$StoreName")
        {
          try
          {
            $store = New-Object System.Security.Cryptography.X509Certificates.X509Store $StoreName, $StoreScope
            $store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
            $store.Add($cert)
            $store.Close()
            Write-Verbose "Successfully added '$certfile' to 'cert:\$StoreScope\$StoreName'."
          }
          catch
          {
            Write-Error ("Error adding '$certfile' to 'cert:\$StoreScope\$StoreName': $_ .") -ErrorAction:Continue
          }
        }
        else
        {
          Write-Warning "Certificate store '$StoreName' does not exist. Skipping..."
        }
      }
    }
  }
  
  end
  { }
}