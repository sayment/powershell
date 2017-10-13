Set-ExecutionPolicy RemoteSigned

function cpuInfo{
$CPUInfo = Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*
Write-Host $CPUInfo
}

function osInfo{
$OSInfo = Get-WmiObject Win32_OperatingSystem
Write-Host $OSInfo
}

function biosInfo{
$BIOSInfo = Get-WmiObject -Class Win32_BIOS -ComputerName .
Write-Host $BIOSInfo
}

function localTime{
$LocalTime = Get-WmiObject -Class Win32_LocalTime -ComputerName . | Select-Object -Property [a-z]*
Write-Host $LocalTime
}

function runningServices{
$RunningServices = Get-Service | Where-Object {$_.Status -eq "Running"}
Write-Host $RunningServices
}

function routetable{
$routeTable = route print
Write-Host $routeTable
}

function activeTcpConnections{
$activeTCPconnections = netstat -n
Write-Host $activeTCPconnections
}

function pcSystem{
$PCsystem = Get-CimInstance CIM_ComputerSystem
Write-Host $PCsystem
}

function currentUserName{
$CurrentUserName = $PCsystem.UserName
Write-Host $CurrentUserName
}

function commandhistory{
$commandHistory = Get-History
Write-Host $commandHistory
}

function arptable{
$arpTable = arp -a
Write-Host $arpTable
}

function dnsCache{
$DNScache = Get-DnsClientCache
Write-Host $DNScache
}

function connectionInfo{
$ConnectionInfo =  Test-NetConnection -InformationLevel Detailed
Write-Host $ConnectionInfo
}

Write-Host "
1- CPU Bilgisi
2- İşletim Sistemi Bilgisi
3- BIOS Bilgisi
4- Local Time
5- Çalışan Servisler
6- Route Tablosu
7- Aktif TCP Bağlantıları
8- Cihaz Bilgisi
9- Aktif Kullanıcı
10- Komut Geçmişi
11- Arp Tablosu
12- DNS Cache
13- Bağlantı Bilgisi
"

$number = Read-Host -Prompt 'Görmek istediğiniz maddeyi seçin: '

    if($number -eq 1){cpuInfo}
    elseif($number -eq 2){osInfo}
    elseif($number -eq 3){biosInfo}
    elseif($number -eq 4){localTime}
    elseif($number -eq 5){runningServices}
    elseif($number -eq 6){routetable}
    elseif($number -eq 7){activeTcpConnectionss}
    elseif($number -eq 8){pcSystem}
    elseif($number -eq 9){currentUserName}
    elseif($number -eq 10){commandhistory}
    elseif($number -eq 11){arptable}
    elseif($number -eq 12){dnsCache}
    elseif($number -eq 13){connectionInfo}

