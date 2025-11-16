1. Get-SystemInfo.ps1

Collects basic system information and saves it to a text file on the Desktop.

Key features

Gets current user name, computer name, and timestamp

Reads OS details using Get-CimInstance Win32_OperatingSystem

Reads total physical memory using Get-CimInstance Win32_ComputerSystem

Writes the output to system_test.txt on the current user’s Desktop

Example output
System info for Daniel on DC1 at 2025-11-14 20:52:17

Operating System: Microsoft Windows Server 2022 Standard Evaluation 10.0.20348
Total Memory: 6.00 GB













2. Collect-EventLogs.ps1

Exports recent Application and System event logs to a single text file on the Desktop.

Key features

Uses [Environment]::GetFolderPath('Desktop') to build an output path

Uses a variable (for example $entriesToFetch = 5) to control how many events are exported

Reads:

Application log with Get-EventLog -LogName Application

System log with Get-EventLog -LogName System

Formats events into tables and writes them to event_logs_<timestamp>.txt on the Desktop

Example output
Event log export from DC1 at 2025-11-16_16-39-38

===== Application log (last 5 events) =====
[TimeGenerated, Source, EntryType, Message]

===== System log (last 5 events) =====
[TimeGenerated, Source, EntryType, Message]
