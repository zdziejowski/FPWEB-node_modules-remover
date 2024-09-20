<#
    FPWEB node_modules Remover
    Version: 1.0.0

    Author: Wojciech Zdziejowski
#>
param (
    [string]$startDirectory = "C:\default\path\here"  # Default path, can be overridden at runtime
)

# Display the script header
Write-Host "
 ____  ___   _       ____  ___       _      ___   ___   ____        _      ___   ___   _     _     ____  __       ___   ____  _      ___   _      ____  ___
| |_  | |_) \ \    /| |_  | |_)     | |\ | / / \ | | \ | |_   ___  | |\/| / / \ | | \ | | | | |   | |_  ( (      | |_) | |_  | |\/| / / \ \ \  / | |_  | |_)
|_|   |_|    \_\/\/ |_|__ |_|_)     |_| \| \_\_/ |_|_/ |_|__ |___| |_|  | \_\_/ |_|_/ \_\_/ |_|__ |_|__ _)_)     |_| \ |_|__ |_|  | \_\_/  \_\/  |_|__ |_| \
     Wojciech Zdziejowski
" -ForegroundColor DarkRed

# Check if the directory exists
if (-Not (Test-Path -Path $startDirectory)) {
    Write-Host "The specified path does not exist: $startDirectory" -ForegroundColor Red
    exit
}

# Find all top-level node_modules directories
$nodeModulesDirs = Get-ChildItem -Path $startDirectory -Recurse -Directory -Filter "node_modules" |
                   Where-Object { $_.Parent.FullName -notlike "*\node_modules\*" }

if ($nodeModulesDirs.Count -eq 0) {
    Write-Host "No node_modules directories found in $startDirectory" -ForegroundColor Green
    exit
}

# Display found directories
$uniqueParentDirs = $nodeModulesDirs | ForEach-Object { $_.Parent.FullName } | Sort-Object -Unique
Write-Host "PROCESSING..." -ForegroundColor Blue
foreach ($parentDir in $uniqueParentDirs) {
    Write-Host "Found in: $parentDir" -ForegroundColor Green
}

# Ask for confirmation to delete
$confirmation = Read-Host "Do you want to delete all found node_modules directories? ([Y]es/[N]o)"

if ($confirmation.ToLower() -ne "y" -and $confirmation.ToLower() -ne "yes") {
    Write-Host "Process canceled by user." -ForegroundColor Yellow
    exit
}

# Loop through all node_modules directories
foreach ($dir in $nodeModulesDirs) {
    # Get parent directory
    $parentDir = $dir.Parent.FullName

    # Display information about finding and pending removal
    Write-Host "REMOVE... $parentDir" -ForegroundColor Red

    # Delete node_modules directory
    try {
        Remove-Item -Recurse -Force -LiteralPath $dir.FullName
        Write-Host "REMOVED in $parentDir" -ForegroundColor Green
    } catch {
        Write-Host "Error removing $($dir.FullName): $_" -ForegroundColor Red
    }
}

Write-Host "                               " -ForegroundColor Green
Write-Host "                               " -ForegroundColor Green
Write-Host "===============================" -ForegroundColor Green
Write-Host "!!!    Process completed    !!!" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor Green
Write-Host "I wish you a tasty coffee. Bye!" -ForegroundColor White
Write-Host "                               " -ForegroundColor Green

exit
