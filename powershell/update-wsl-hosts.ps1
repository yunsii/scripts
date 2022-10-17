Install-Module -Name 'Carbon' -AllowClobber
Import-Module 'Carbon'

$DistroName = "Ubuntu20.04LTS"

$Hosts = @( 
  "dev.app1.com",
  "dev.app2.com", 
)

$WslHostIP = ((PowerShell wsl -d $DistroName hostname -I) | Out-String).Trim()

Foreach ($hostname in $hosts) {
  Write-Host $WslHostIP $host
  Set-CHostsEntry -IPAddress $WslHostIP -HostName $hostname
}

# Remove-CHostsEntry -HostName 'myserver'
