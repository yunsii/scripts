$NuGetPath = "$PSScriptRoot\..\..\Assets\nuget.exe"

. $NuGetPath help | Select-Object -First 1