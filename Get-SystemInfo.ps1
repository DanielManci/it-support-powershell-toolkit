# Get-SystemInfo.ps1
# Very simple test: create a file on the Desktop with one line of text

$desktopPath  = [Environment]::GetFolderPath('Desktop')
$computerName = $env:COMPUTERNAME
$userName     = $env:USERNAME
$dateStamp    = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$os           = Get-CimInstance Win32_OperatingSystem
$memory       = Get-CimInstance Win32_ComputerSystem

Add-Content "$desktopPath\system_test.txt" "System info for $userName on $computerName at $dateStamp"
Add-Content "$desktopPath\system_test.txt" ""
Add-Content "$desktopPath\system_test.txt" "Operating System: $($os.Caption) $($os.Version)"
Add-Content "$desktopPath\system_test.txt" ("Total Memory: {0:N2} GB" -f ($memory.TotalPhysicalMemory / 1GB))
