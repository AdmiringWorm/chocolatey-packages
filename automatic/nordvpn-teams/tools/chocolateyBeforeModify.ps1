$serviceName = "NordVPN.Teams.VpnService"
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
  Stop-Service -Name $serviceName
}
