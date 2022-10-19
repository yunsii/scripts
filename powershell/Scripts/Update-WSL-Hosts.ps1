. "$PSScriptRoot\Utils\Invoke-RunAsAdministrator.ps1"

#Check Script is running with Elevated Privileges
Invoke-RunAsAdministrator

Import-Module "$PSScriptRoot\..\Modules\Carbon.2.11.0\Carbon"

# 保证 WSL 名称正确，可通过 wsl --list 查看
$DistroName = "Ubuntu-18.04"

$Hosts = @( 
  "dev.app1.com",
  "dev.app2.com"
)

$WslHostIP = ((PowerShell "wsl -d $DistroName hostname -I") | Out-String).Trim()

Foreach ($hostname in $hosts) {
  Write-Host $WslHostIP $hostname
  Set-CHostsEntry -IPAddress $WslHostIP -HostName $hostname
}

# Remove-CHostsEntry -HostName 'myserver'

Write-Host "Press any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
