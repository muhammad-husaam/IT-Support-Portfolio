# ================================
# System Health Check Script
# Author: M Husaam
# Date: March-27 2026
# ================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "        SYSTEM HEALTH REPORT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# CPU Usage
$cpu = Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average
Write-Host "`nCPU Usage: $($cpu.Average)%" -ForegroundColor Yellow

# RAM Usage
$ram = Get-WmiObject Win32_OperatingSystem
$totalRAM = [math]::Round($ram.TotalVisibleMemorySize / 1MB, 2)
$freeRAM = [math]::Round($ram.FreePhysicalMemory / 1MB, 2)
$usedRAM = [math]::Round($totalRAM - $freeRAM, 2)
Write-Host "RAM Total: $totalRAM GB" -ForegroundColor Yellow
Write-Host "RAM Used:  $usedRAM GB" -ForegroundColor Yellow
Write-Host "RAM Free:  $freeRAM GB" -ForegroundColor Yellow

# Disk Usage
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'"
$totalDisk = [math]::Round($disk.Size / 1GB, 2)
$freeDisk = [math]::Round($disk.FreeSpace / 1GB, 2)
$usedDisk = [math]::Round($totalDisk - $freeDisk, 2)
Write-Host "`nDisk C: Total: $totalDisk GB" -ForegroundColor Yellow
Write-Host "Disk C: Used:  $usedDisk GB" -ForegroundColor Yellow
Write-Host "Disk C: Free:  $freeDisk GB" -ForegroundColor Yellow

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "         END OF REPORT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan