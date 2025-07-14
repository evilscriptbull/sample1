# PowerShell script to manage the Node.js Hello World application
# Usage: .\scripts\app.ps1 [command]

param(
    [Parameter(Position=0)]
    [string]$Command = "help"
)

# Colors for output
$Colors = @{
    Red = "Red"
    Green = "Green"
    Yellow = "Yellow"
    Blue = "Blue"
    Cyan = "Cyan"
}

function Write-ColoredMessage {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Show-Help {
    Write-ColoredMessage "Node.js Hello World App Management Script" $Colors.Blue
    Write-Host ""
    Write-Host "Usage: .\scripts\app.ps1 [command]"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host "  start         Start the app with Docker Compose"
    Write-Host "  start-dev     Start the app in development mode"
    Write-Host "  stop          Stop the app"
    Write-Host "  restart       Restart the app"
    Write-Host "  logs          Show app logs"
    Write-Host "  status        Show app status"
    Write-Host "  build         Build the Docker image"
    Write-Host "  test          Run a quick test of the API"
    Write-Host "  clean         Clean up Docker containers and images"
    Write-Host "  wsl-install   Install Node.js dependencies using WSL"
    Write-Host "  wsl-start     Start the app using WSL (Node.js directly)"
    Write-Host "  help          Show this help message"
}

function Start-App {
    Write-ColoredMessage "Starting Hello World app..." $Colors.Green
    docker-compose up -d app
    Write-ColoredMessage "App started! Visit http://localhost:3000" $Colors.Green
}

function Start-DevApp {
    Write-ColoredMessage "Starting Hello World app in development mode..." $Colors.Yellow
    docker-compose up -d app-dev
    Write-ColoredMessage "Dev app started! Visit http://localhost:3001" $Colors.Green
}

function Stop-App {
    Write-ColoredMessage "Stopping Hello World app..." $Colors.Yellow
    docker-compose down
    Write-ColoredMessage "App stopped!" $Colors.Green
}

function Restart-App {
    Write-ColoredMessage "Restarting Hello World app..." $Colors.Yellow
    docker-compose restart
    Write-ColoredMessage "App restarted!" $Colors.Green
}

function Show-Logs {
    Write-ColoredMessage "Showing app logs..." $Colors.Blue
    docker-compose logs -f app
}

function Show-Status {
    Write-ColoredMessage "App Status:" $Colors.Blue
    docker-compose ps
}

function Invoke-Build {
    Write-ColoredMessage "Building Docker image..." $Colors.Yellow
    docker-compose build
    Write-ColoredMessage "Build complete!" $Colors.Green
}

function Test-App {
    Write-ColoredMessage "Testing API endpoints..." $Colors.Blue
    Write-Host ""
    
    Write-ColoredMessage "Testing main endpoint:" $Colors.Yellow
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:3000" -Method Get
        $response | ConvertTo-Json -Depth 3
    }
    catch {
        Write-ColoredMessage "Main endpoint test failed: $_" $Colors.Red
    }
    
    Write-Host ""
    Write-ColoredMessage "Testing health endpoint:" $Colors.Yellow
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:3000/health" -Method Get
        $response | ConvertTo-Json -Depth 3
    }
    catch {
        Write-ColoredMessage "Health endpoint test failed: $_" $Colors.Red
    }
    
    Write-Host ""
    Write-ColoredMessage "API tests complete!" $Colors.Green
}

function Invoke-Cleanup {
    Write-ColoredMessage "Cleaning up Docker resources..." $Colors.Yellow
    docker-compose down --rmi all --volumes --remove-orphans
    Write-ColoredMessage "Cleanup complete!" $Colors.Green
}

function Install-WSLDeps {
    Write-ColoredMessage "Installing Node.js dependencies using WSL..." $Colors.Yellow
    wsl -d Ubuntu bash -c "cd /home/cruze/Code/sample1 && npm install"
    Write-ColoredMessage "Dependencies installed!" $Colors.Green
}

function Start-WSLApp {
    Write-ColoredMessage "Starting app using WSL (Node.js directly)..." $Colors.Green
    Write-ColoredMessage "This will run in the current terminal. Press Ctrl+C to stop." $Colors.Yellow
    wsl -d Ubuntu bash -c "cd /home/cruze/Code/sample1 && npm start"
}

# Main script logic
switch ($Command.ToLower()) {
    "start" { Start-App }
    "start-dev" { Start-DevApp }
    "stop" { Stop-App }
    "restart" { Restart-App }
    "logs" { Show-Logs }
    "status" { Show-Status }
    "build" { Invoke-Build }
    "test" { Test-App }
    "clean" { Invoke-Cleanup }
    "wsl-install" { Install-WSLDeps }
    "wsl-start" { Start-WSLApp }
    "help" { Show-Help }
    default {
        Write-ColoredMessage "Unknown command: $Command" $Colors.Red
        Write-Host ""
        Show-Help
        exit 1
    }
}
