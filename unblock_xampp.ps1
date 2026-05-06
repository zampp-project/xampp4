# unblock_xampp.ps1
# Removes Windows Mark-of-the-Web / Zone.Identifier blocks from this XAMPP folder.
# Useful when Windows 11 Smart App Control or SmartScreen blocks files after moving/extracting.

$ErrorActionPreference = "SilentlyContinue"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "XAMPP Unblock Helper"
Write-Host "-------------------"
Write-Host "Target folder:"
Write-Host "  $Root"
Write-Host ""

$IsWindows = $env:OS -eq "Windows_NT"

if (-not $IsWindows) {
    Write-Host "This script is intended for Windows only."
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Unblocking files. This may take a moment..."
Write-Host ""

$Files = Get-ChildItem -LiteralPath $Root -Recurse -Force -File

$Total = 0
$Unblocked = 0
$Failed = 0

foreach ($File in $Files) {
    $Total++

    try {
        Unblock-File -LiteralPath $File.FullName -ErrorAction Stop
        $Unblocked++
    }
    catch {
        $Failed++
    }
}

Write-Host "Done."
Write-Host ""
Write-Host "Files scanned:   $Total"
Write-Host "Files unblocked: $Unblocked"
Write-Host "Failed:          $Failed"
Write-Host ""

Write-Host "You can now try running xampp-control.exe again."
Write-Host ""
Read-Host "Press Enter to exit"