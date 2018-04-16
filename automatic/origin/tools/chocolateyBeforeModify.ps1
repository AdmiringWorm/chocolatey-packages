$ErrorActionPreference = 'Stop'

Get-Process -Name 'OriginWebHelperService' -ErrorAction SilentlyContinue | Stop-Process -Force