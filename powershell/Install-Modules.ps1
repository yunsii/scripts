. "$PSScriptRoot\Scripts\Utils\Test-Command.ps1"

Write-Host "Working Directory: $(Get-Location | Foreach-Object { $_.Path })"

$NuGetPath = "$PSScriptRoot\Assets\nuget.exe"
$ModulesPath = "$PSScriptRoot\Modules"

if (!(Test-Path -Path $ModulesPath)) {
  New-Item -ItemType Directory -Force -Path "$PSScriptRoot\Modules"
  # 没有 $ModulesPath 说明没有初始化 nuget
  . $NuGetPath sources Add -Name official -Source https://nuget.cdn.azure.cn/v3/index.json
}

Set-Location $ModulesPath
. $NuGetPath install Carbon -Version 2.11.0
