# PowerShell 脚本

## 准备工作

由于通过 [Install-Package Carbon](https://www.nuget.org/packages/Carbon) 总是超时，可能是网络环境问题，但是各种方式配置代理后仍然无法解决这个问题，因此尝试通过 nuget 直接安装相关依赖。

另一个奇怪的问题又发生了，直接下载 nuget 也总是超时……最后通过手机的移动网络下载成功了，令人窒息的操作。目前可以从 [Assets](./Assets) 目录下载 nuget.exe 放到合适位置后配置环境变量 Path 方便直接调用 nuget 命令。最后一个问题是 nuget 默认连官方源都没有，还需要通过 `nuget sources Add -Name official -Source https://nuget.cdn.azure.cn/v3/index.json` 添加一个官方的镜像源，至此，终于能正常安装依赖。

最后换了另一个方案，无需配置环境变量，通过 nuget.exe 绝对路径直接调用，至此，PowerShell 脚本实现了项目内闭环管理。运行 Scripts 内的脚本前请先执行 [Install-Modules.ps1](./Install-Modules.ps1) 脚本安装依赖。

## 忽略检查 Modules

参考 [How to disable PSScriptAnalyzer's PSAvoidUsingCmdletAliases in PowerShell Extension in Visual Studio Code](https://superuser.com/a/1393187/1738631) 配置检查哪个目录。还不支持 ignore 配置，很怪。
