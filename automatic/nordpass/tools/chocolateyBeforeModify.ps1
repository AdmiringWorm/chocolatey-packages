$serviceName = ''
$services = Get-Process $serviceName

if ($services) {
  $services | Stop-Process
}
