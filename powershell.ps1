Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*

Get-WmiObject -Class Win32_BIOS -ComputerName .

Get-WmiObject -Class Win32_LocalTime -ComputerName . | Select-Object -Property [a-z]*

Get-WmiObject -Class Win32_Service -ComputerName . | Select-Object -Property Status,Name,DisplayName

Get-Service | Where-Object {$_.Status -eq "Running"}

