# ================================
# Temp File Cleanup Script
# Author: Your Name
# Date: 2026
# ================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "        TEMP FILE CLEANUP" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Define temp folders to clean
$tempFolders = @(
    "$env:TEMP",
    "C:\Windows\Temp"
)

$totalDeleted = 0

foreach ($folder in $tempFolders) {
    Write-Host "`nCleaning: $folder" -ForegroundColor Yellow
    $files = Get-ChildItem -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        try {
            Remove-Item $file.FullName -Force -Recurse -ErrorAction Stop
            $totalDeleted++
        } catch {
            # Skip files in use
        }
    }
}

Write-Host "`nTotal items deleted: $totalDeleted" -ForegroundColor Green
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "         CLEANUP COMPLETE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan