Import-Module "$PSScriptRoot\..\Modules\Carbon.2.11.0\Carbon"

$HostsPath = Get-CPathToHostsFile

Write-Host "Hosts path: $HostsPath"
Write-Host "======================"
Get-Content $HostsPath | Write-Host
