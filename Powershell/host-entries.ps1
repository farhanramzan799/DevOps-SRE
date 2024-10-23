

  #####host Entries######
  $hostNames = @("domain1", "domain2 ", "domain3")
  $hostNames2 = @("domain4", "domain5 ", "domain6", "domain7")
  $ErrorActionPreference = "Stop"
  # A helper function for configuring Windows hosts file.
  function Set-HostEntry() {
    $Hosts = "$($Env:windir)\system32\Drivers\etc\hosts"
    [string[]]$HostLines = [System.IO.File]::ReadAllLines($Hosts)
    $NewEntries = New-Object System.Collections.Generic.List[string]
    if ($HostLines[$HostLines.Length - 1].Trim().Length -gt 0) {
      $NewEntries.Add("")
    }
    $HostNames | ForEach-Object {
      $HostEntry = "127.0.0.1 $_"
      $Matches = $HostLines | Where-Object { $_.Equals($HostEntry) }
      if (!$Matches -or $Matches.Length -eq 0) {
        $NewEntries.Add($HostEntry)
      }
    }
    $HostNames2 | ForEach-Object {
      $HostEntry = "127.0.0.1 $_"
      $Matches = $HostLines | Where-Object { $_.Equals($HostEntry) }
      if (!$Matches -or $Matches.Length -eq 0) {
        $NewEntries.Add($HostEntry)
      }

    }
    if (($NewEntries.Count -gt 0) -And !($NewEntries.Count -eq 1 -And $NewEntries[0].Length -eq 0)) {
      [System.IO.File]::AppendAllLines($Hosts, $NewEntries, [System.Text.Encoding]::UTF8)
    }
  }

  Write-host	"Adding the host entries"
  Set-HostEntry

  # $vm = "Ubuntu-01"
  # Write-Host "Please wait starting the $vm node..."
  # if (Get-VM -Name $vm | Where-Object State -eq Saved)
  # { Remove-VMSavedState -VMName $vm }

  # if (Get-VM -Name $vm | Where-Object State -ne 'Running') {
  #   Start-VM -Name $vm
  #   Write-Host $vm is Starting...
  # }
  # else {
  #   Write-Host $vm is already Running
  # 
