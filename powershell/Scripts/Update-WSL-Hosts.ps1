#Read more: https://www.sharepointdiary.com/2015/01/run-powershell-script-as-administrator-automatically.html#ixzz7i4zQ9sKj
Function Invoke-RunAsAdministrator {
  #Get current user context
  $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  
  #Check user is running the script is member of Administrator Group
  if ($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Write-host "Script is running with Administrator privileges!"
  }
  else {
    #Create a new Elevated process to Start PowerShell
    $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter
    $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"

    #Set the Process to elevated
    $ElevatedProcess.Verb = "runas"

    #Start the new elevated process
    [System.Diagnostics.Process]::Start($ElevatedProcess)

    #Exit from the current, unelevated, process
    Exit
  }
}

#Check Script is running with Elevated Privileges
Invoke-RunAsAdministrator

Import-Module $PSScriptRoot\..\Modules\Carbon.2.11.0\Carbon

# 保证 WSL 名称正确，可通过 wsl --list 查看
$DistroName = "Ubuntu-18.04"

$Hosts = @( 
  "dev.app1.com",
  "dev.app2.com"
)

$WslHostIP = ((PowerShell wsl -d $DistroName hostname -I) | Out-String).Trim()

Foreach ($hostname in $hosts) {
  Write-Host $WslHostIP $hostname
  Set-CHostsEntry -IPAddress $WslHostIP -HostName $hostname
}

# Remove-CHostsEntry -HostName 'myserver'

pause
