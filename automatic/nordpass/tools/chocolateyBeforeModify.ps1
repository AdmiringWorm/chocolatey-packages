$serviceName = 'NordPass*'
$services = Get-Process $serviceName

if ($services) {
  $services | Stop-Process
}
