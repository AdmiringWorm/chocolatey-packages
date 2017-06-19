function getSkuName() {
  param([string]$displayName)

  @('Enterprise';'Ultimate';'Premium';'Pro:Professional';'Community') | ? {
    $valToTest = "^Visual Studio $($_ -split '\:' | select -Last 1) "
    $displayName -match $valToTest
  } | % { $_ -split '\:' | select -First 1 } | select -First 1
}
