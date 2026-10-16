Describe 'OnionShare 64-bit migration' {
  BeforeAll {
    $installScript = Join-Path $PSScriptRoot 'tools\chocolateyInstall.ps1'
    function Get-OSArchitectureWidth { param($Compare) }
    function Get-UninstallRegistryKey { param($SoftwareName) }
    function Uninstall-ChocolateyPackage { param($PackageName, $FileType, $File, $SilentArgs, $ValidExitCodes) }
    function Install-ChocolateyInstallPackage { param($PackageName, $FileType, $File, $File64, $SoftwareName, $SilentArgs, $ValidExitCodes) }
  }

  BeforeEach {
    $savedForceX86 = $env:ChocolateyForceX86
    $env:ChocolateyForceX86 = $null
    $script:products = @()
    $script:briefcaseProducts = @()
    $script:actions = @()
    $fakeInstaller = [pscustomobject]@{}
    $fakeInstaller | Add-Member ScriptMethod RelatedProducts {
      param($upgradeCode)
      if ($upgradeCode -eq '{E9DD4CB2-A74B-54B4-8389-1D554FE52C93}') {
        return $script:briefcaseProducts
      }
      if ($upgradeCode -ne '{12B9695C-965B-4BE0-BC33-21274E809576}') {
        throw 'Only the win32 upgrade code may be queried.'
      }
      $script:products
    }
    Mock New-Object { $fakeInstaller } -ParameterFilter { $ComObject -eq 'WindowsInstaller.Installer' }
    Mock Get-OSArchitectureWidth { $false } -ParameterFilter { $Compare -eq 32 }
    Mock Get-UninstallRegistryKey { @() }
    Mock Test-Path { $true }
    Mock Get-ChildItem { @() }
    Mock Uninstall-ChocolateyPackage { $script:actions += 'uninstall' }
    Mock Install-ChocolateyInstallPackage { $script:actions += 'install' }
    Mock Write-Warning {}
  }

  AfterEach {
    $env:ChocolateyForceX86 = $savedForceX86
  }

  It 'installs win64 on a fresh machine without uninstalling anything' {
    . $installScript
    $script:actions -join ',' | Should -Be 'install'
    Assert-MockCalled Install-ChocolateyInstallPackage -Times 1 -Exactly -Scope It -ParameterFilter {
      $File -eq '' -and $File64 -like '*\OnionShare-win64-*.msi' -and $ValidExitCodes -contains 3010
    }
  }

  It 'removes the win32 MSI before installing win64' {
    $script:products = @('{11111111-1111-1111-1111-111111111111}')
    . $installScript
    $script:actions -join ',' | Should -Be 'uninstall,install'
    Assert-MockCalled Uninstall-ChocolateyPackage -Times 1 -Exactly -Scope It -ParameterFilter {
      $FileType -eq 'msi' -and $File -eq '' -and
      $SilentArgs -like '{11111111-1111-1111-1111-111111111111} /qn /norestart*' -and
      $ValidExitCodes -contains 3010
    }
  }

  It 'leaves an existing win64 installation to the MSI upgrade mechanism' {
    Mock Get-UninstallRegistryKey {
      [pscustomobject]@{ DisplayName = 'OnionShare'; VersionMajor = 2; VersionMinor = 6 }
    }
    . $installScript
    $script:actions -join ',' | Should -Be 'install'
  }

  It 'also migrates the earlier Briefcase MSI used by version 2.3' {
    $script:briefcaseProducts = @('{22222222-2222-2222-2222-222222222222}')
    . $installScript
    $script:actions -join ',' | Should -Be 'uninstall,install'
    Assert-MockCalled Uninstall-ChocolateyPackage -Times 1 -Exactly -Scope It -ParameterFilter {
      $SilentArgs -like '{22222222-2222-2222-2222-222222222222} /qn /norestart*'
    }
  }
  It 'stops before installing when migration fails' {
    $script:products = @('{11111111-1111-1111-1111-111111111111}')
    Mock Uninstall-ChocolateyPackage { throw 'MSI uninstall failed' }
    $failure = $null
    try { . $installScript } catch { $failure = $_ }
    $failure.Exception.Message | Should -Match 'MSI\ uninstall\ failed'
    Assert-MockCalled Install-ChocolateyInstallPackage -Times 0 -Exactly -Scope It
  }

  It 'rejects a 32-bit OS before changing the installation' {
    Mock Get-OSArchitectureWidth { $true } -ParameterFilter { $Compare -eq 32 }
    $failure = $null
    try { . $installScript } catch { $failure = $_ }
    $failure.Exception.Message | Should -Match '--version=2\.6\.0'
    Assert-MockCalled Uninstall-ChocolateyPackage -Times 0 -Exactly -Scope It
    Assert-MockCalled Install-ChocolateyInstallPackage -Times 0 -Exactly -Scope It
  }

  It 'rejects forced x86 before changing the installation' {
    $env:ChocolateyForceX86 = 'true'
    $failure = $null
    try { . $installScript } catch { $failure = $_ }
    $failure.Exception.Message | Should -Match '--version=2\.6\.0'
    Assert-MockCalled Uninstall-ChocolateyPackage -Times 0 -Exactly -Scope It
    Assert-MockCalled Install-ChocolateyInstallPackage -Times 0 -Exactly -Scope It
  }

  It 'does not remove the old version if the embedded MSI is missing' {
    Mock Test-Path { $false }
    $failure = $null
    try { . $installScript } catch { $failure = $_ }
    $failure.Exception.Message | Should -Match 'embedded\ 64-bit\ installer\ is\ missing'
    Assert-MockCalled Uninstall-ChocolateyPackage -Times 0 -Exactly -Scope It
    Assert-MockCalled Install-ChocolateyInstallPackage -Times 0 -Exactly -Scope It
  }

  It 'continues to warn about pre-MSI versions without removing them' {
    Mock Get-UninstallRegistryKey {
      [pscustomobject]@{ DisplayName = 'OnionShare'; DisplayVersion = '2.2'; VersionMajor = 2; VersionMinor = 2 }
    }
    . $installScript
    Assert-MockCalled Write-Warning -Times 1 -Exactly -Scope It -ParameterFilter { $Message -like '*uninstall OnionShare 2.2 manually*' }
    Assert-MockCalled Uninstall-ChocolateyPackage -Times 0 -Exactly -Scope It
  }
}

Describe 'OnionShare release selection' {
  BeforeAll {
    # Load only discovery; running update.ps1 would download, pack and run hooks.
    $ast = [System.Management.Automation.Language.Parser]::ParseFile("$PSScriptRoot\update.ps1", [ref]$null, [ref]$null)
    $discovery = $ast.Find({ param($node)
      $node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq 'global:au_GetLatest'
    }, $true)
    . ([scriptblock]::Create($discovery.Extent.Text.Replace('global:au_GetLatest', 'au_GetLatest')))
    . "$PSScriptRoot\..\..\scripts\Get-NormalizedVersion.ps1"
    function Get-AllGithubReleases { param($RepoUser, $RepoName) }
    function Get-Version { param($Version) $Version }
  }

  It 'selects win64 only and preserves stable and unstable streams' {
    Mock Get-AllGithubReleases {
      @(
        @{ Assets = @('https://github.com/onionshare/onionshare/releases/download/v2.7.dev1/OnionShare-win64-2.7.dev1.msi') }
        @{ Assets = @(
          'https://github.com/onionshare/onionshare/releases/download/v2.6.5/OnionShare-win32-2.6.5.msi'
          'https://github.com/onionshare/onionshare/releases/download/v2.6.5/OnionShare-win64-2.6.5.msi.asc'
          'https://github.com/onionshare/onionshare/releases/download/v2.6.5/OnionShare-win64-2.6.5.msi'
        ) }
        @{ Assets = @('https://github.com/onionshare/onionshare/releases/download/v2.6/OnionShare-win64-2.6.msi') }
      )
    }
    $result = au_GetLatest
    $result.streams.stable.Version | Should -Be '2.6.5'
    $result.streams.stable.URL64.AbsoluteUri | Should -Be 'https://github.com/onionshare/onionshare/releases/download/v2.6.5/OnionShare-win64-2.6.5.msi'
    $result.streams.stable.ContainsKey('URL32') | Should -Be $false
    $result.streams.unstable.Version | Should -Be '2.7.0-dev1'
    $result.streams.unstable.RemoteVersion | Should -Be '2.7.dev1'
  }

  It 'fails when there is no stable win64 MSI' {
    Mock Get-AllGithubReleases {
      @{ Assets = @('https://github.com/onionshare/onionshare/releases/download/v2.6/OnionShare-win32-2.6.msi') }
    }
    $failure = $null
    try { au_GetLatest } catch { $failure = $_ }
    $failure.Exception.Message | Should -Match 'No\ stable\ OnionShare\ win64\ MSI'
  }

  It 'rejects ambiguous win64 assets' {
    Mock Get-AllGithubReleases {
      @{ Assets = @(
        'https://github.com/onionshare/onionshare/releases/download/v2.6.5/OnionShare-win64-2.6.5.msi'
        'https://github.com/onionshare/onionshare/releases/download/v2.6.5/OnionShare-win64-other.msi'
      ) }
    }
    $failure = $null
    try { au_GetLatest } catch { $failure = $_ }
    $failure.Exception.Message | Should -Match 'exactly\ one'
  }
}
