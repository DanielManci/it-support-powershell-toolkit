# Collect-EventLogs.ps1

$desktopPath = [Environment]::GetFolderPath('Desktop')
$dateStamp   = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$outputFile  = "$desktopPath\event_logs_$dateStamp.txt"
$entriesToFetch = 5

Write-Host "Output file path is: $outputFile"

# Get last 5 events from Application log
$appLogs = Get-EventLog -LogName Application -Newest $entriesToFetch
$sysLogs = Get-EventLog -LogName System      -Newest $entriesToFetch

Set-Content $outputFile "Event log export from $env:COMPUTERNAME at $dateStamp"
Add-Content $outputFile ""
Add-Content $outputFile "==== Application log (last $entriesToFetch events) ===="
Add-Content $outputFile ""

# Append Application events (date, source, type, message)
$appLogs |
    Select-Object TimeGenerated, Source, EntryType, Message |
    Format-Table -AutoSize |
    Out-String |
    Add-Content $outputFile

Add-Content $outputFile ""
Add-Content $outputFile "==== System log (last $entriesToFetch events) ===="
Add-Content $outputFile ""

# Append System events
$sysLogs |
    Select-Object TimeGenerated, Source, EntryType, Message |
    Format-Table -AutoSize |
    Out-String |
    Add-Content $outputFile

Write-Host "Done. Event logs saved to: $outputFile"