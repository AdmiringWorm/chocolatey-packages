$serviceName = "nordvpn-service"
$service = Get-Service -Name $serviceName

if ($service) {
  Stop-Service -Name $serviceName
}
