# Set UTF-8 encoding for proper character display
$OutputEncoding = [System.Text.UTF8Encoding]::new()
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

# Color configuration
$ErrorColor = [ConsoleColor]::Red
$SuccessColor = [ConsoleColor]::Green
$InfoColor = [ConsoleColor]::Cyan

$PythonExe = "python"

# Automatically determine the script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrEmpty($ScriptDir)) { $ScriptDir = Get-Location }

function Write-Info($msg) { Write-Host $msg -ForegroundColor $InfoColor }
function Write-Success($msg) { Write-Host $msg -ForegroundColor $SuccessColor }
function Write-Error($msg) { Write-Host $msg -ForegroundColor $ErrorColor }

Write-Info "1. Checking virtual environment..."
$ActivationScript = "$ScriptDir\venv\Scripts\Activate.ps1"

if (-not (Test-Path $ActivationScript)) {
    Write-Info "Virtual environment (venv) not found. Creating a new one..."
    & $PythonExe -m venv venv
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to create virtual environment. Please check if Python is installed and added to PATH."
        Read-Host "Press Enter to exit"
        exit 1
    }
    Write-Success "Virtual environment created successfully."
}

if (Test-Path $ActivationScript) {
    & $ActivationScript
    Write-Success "Virtual environment activated."
} else {
    Write-Error "Activation script not found after environment creation."
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Info "2. Installing dependencies..."
& $PythonExe -m pip install --upgrade pip

$ReqPath = Join-Path $ScriptDir "requirements.txt"
if (Test-Path $ReqPath) {
    & $PythonExe -m pip install -r $ReqPath
    Write-Success "Dependencies from requirements.txt installed."
} else {
    Write-Info "requirements.txt not found. Skipping dependency installation."
}

Write-Info "2.5 Running database migration file..."
$MigrationScript = Join-Path $ScriptDir "modules\migration.py"
if (Test-Path $MigrationScript) {
    & $PythonExe $MigrationScript
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Error occurred during database migration."
        Read-Host "Press Enter to exit"
        exit 1
    }
    Write-Success "Database migration completed successfully."
} else {
    Write-Error "Migration file not found at path: $MigrationScript"
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Info "3. Starting the application..."
$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUNBUFFERED = "1"

# Configure process startup
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $PythonExe
$psi.Arguments = "-u app.py"
$psi.WorkingDirectory = $ScriptDir
$psi.UseShellExecute = $false
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError = $true
$psi.CreateNoWindow = $true

$proc = New-Object System.Diagnostics.Process
$proc.StartInfo = $psi

Write-Info "Launching Python subprocess..."
[void]$proc.Start()

$DetectedPort = $null
$PortFound = $false
$CriticalError = $false

# Synchronous line-by-line output reading without blocking PowerShell events
while (-not $proc.HasExited -and -not $PortFound -and -not $CriticalError) {
    # Check for data in standard output
    if (-not $proc.StandardOutput.EndOfStream) {
        $line = $proc.StandardOutput.ReadLine()
        Write-Host "   [App STDOUT]: $line" -ForegroundColor Gray

        # Regular expression to find the port
        if ($line -match "Запуск на порту (\d+)|Running on http://[^\s\:]+:(\d+)|Running on local URL:\s+http://[^\s\:]+:(\d+)") {
            foreach ($i in 1..3) {
                if (-not [string]::IsNullOrEmpty($Matches[$i])) {
                    $DetectedPort = $Matches[$i]
                    $PortFound = $true
                    break
                }
            }
        }

        if ($line -match "Traceback|CRITICAL|SyntaxError") {
            $CriticalError = $true
        }
    }

    # Check for data in error stream (many frameworks write startup logs there)
    if (-not $proc.StandardError.EndOfStream) {
        if ($proc.StandardError.Peek() -ne -1) {
            $line = $proc.StandardError.ReadLine()
            Write-Host "   [App STDERR]: $line" -ForegroundColor DarkYellow

            if ($line -match "Running on http://[^\s\:]+:(\d+)|Running on local URL:\s+http://[^\s\:]+:(\d+)") {
                foreach ($i in 1..2) {
                    if (-not [string]::IsNullOrEmpty($Matches[$i])) {
                        $DetectedPort = $Matches[$i]
                        $PortFound = $true
                        break
                    }
                }
            }

            if ($line -match "Traceback|CRITICAL|SyntaxError|Address already in use") {
                $CriticalError = $true
            }
        }
    }

    Start-Sleep -Milliseconds 100
}

# Check loop exit results
if ($CriticalError) {
    Write-Error "Critical error detected in output. Stopping script."
    if (-not $proc.HasExited) { $proc.Kill() }
    Read-Host "Press Enter to exit"
    exit 1
}

if ($proc.HasExited -and -not $PortFound) {
    Write-Error "Process terminated before a port was detected (Exit code $($proc.ExitCode))."
    Read-Host "Press Enter to exit"
    exit 1
}

# If port detected successfully
if ($PortFound -and $DetectedPort) {
    $AppUrl = "http://127.0.0.1:$DetectedPort/"

    # Information block with correct link
    Write-Host "`n=========================================" -ForegroundColor $SuccessColor
    Write-Host " APPLICATION STARTED SUCCESSFULLY" -ForegroundColor $SuccessColor
    Write-Host " Access Link:         " -NoNewline -ForegroundColor $InfoColor
    Write-Host $AppUrl -ForegroundColor Yellow
    Write-Host " Application Port:    " -NoNewline -ForegroundColor $InfoColor
    Write-Host $DetectedPort -ForegroundColor Yellow
    Write-Host "=========================================`n" -ForegroundColor $SuccessColor

    Write-Info "Checking localhost availability..."
    Start-Sleep -Seconds 2

    if (Test-NetConnection -ComputerName 127.0.0.1 -Port $DetectedPort -WarningAction SilentlyContinue | Where-Object { $_.TcpTestSucceeded }) {
        Write-Success "Port is responding. Opening browser..."
        Start-Process $AppUrl
    } else {
        Write-Error "Warning: Script could not establish a TCP connection to port $DetectedPort, but the process is still running."
    }
}

# Leave the process running in the background, don't close the console immediately
Write-Info "Press Ctrl+C in this console to terminate the script, or simply close this window."
while (-not $proc.HasExited) {
    Start-Sleep -Seconds 1
}
