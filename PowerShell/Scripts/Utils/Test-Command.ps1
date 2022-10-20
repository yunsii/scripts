function Test-Command {
  param (
    $CmdName
  )

  return [bool](Get-Command -Name $CmdName -ErrorAction SilentlyContinue)
}
