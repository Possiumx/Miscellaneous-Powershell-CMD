clear

Get-WmiObject Win32_Processor

Get-Process -Id 19708
$affinity = 1 + 2 + 4 + 8 + 16 + 32
$TempPro = Get-Process -Id 19708
$TempPro.ProcessorAffinity = $affinity



foreach ($process in Get-Process *) {$process.ProcessorAffinity = $affinity}
