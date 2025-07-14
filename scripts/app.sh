#!/bin/bash

# Utility script to manage the Node.js Hello World application
# Usage: ./scripts/app.sh [command]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper function to print colored output
print_message() {
    echo -e "${2}${1}${NC}"
}

# Function to display help
show_help() {
    print_message "🚀 Node.js Hello World App Management Script" "$BLUE"
    echo ""
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  start         Start the app with Docker Compose"
    echo "  start-dev     Start the app in development mode"
    echo "  stop          Stop the app"
    echo "  restart       Restart the app"
    echo "  logs          Show app logs"
    echo "  status        Show app status"
    echo "  build         Build the Docker image"
    echo "  test          Run a quick test of the API"
    echo "  clean         Clean up Docker containers and images"
    echo "  install       Install Node.js dependencies"
    echo "  help          Show this help message"
}

# Function to start the app
start_app() {
    print_message "🚀 Starting Hello World app..." "$GREEN"
    docker-compose up -d app
    print_message "✅ App started! Visit http://localhost:3000" "$GREEN"
}

# Function to start in development mode
start_dev() {
    print_message "🔧 Starting Hello World app in development mode..." "$YELLOW"
    docker-compose up -d app-dev
    print_message "✅ Dev app started! Visit http://localhost:3001" "$GREEN"
}

# Function to stop the app
stop_app() {
    print_message "🛑 Stopping Hello World app..." "$YELLOW"
    docker-compose down
    print_message "✅ App stopped!" "$GREEN"
}

# Function to restart the app
restart_app() {
    print_message "🔄 Restarting Hello World app..." "$YELLOW"
    docker-compose restart
    print_message "✅ App restarted!" "$GREEN"
}

# Function to show logs
show_logs() {
    print_message "📋 Showing app logs..." "$BLUE"
    docker-compose logs -f app
}

# Function to show status
show_status() {
    print_message "📊 App Status:" "$BLUE"
    docker-compose ps
}

# Function to build the image
build_app() {
    print_message "🏗️ Building Docker image..." "$YELLOW"
    docker-compose build
    print_message "✅ Build complete!" "$GREEN"
}

# Function to test the API
test_app() {
    print_message "🧪 Testing API endpoints..." "$BLUE"
    echo ""
    
    print_message "Testing main endpoint:" "$YELLOW"
    curl -s http://localhost:3000 | jq . || curl -s http://localhost:3000
    echo ""
    
    print_message "Testing health endpoint:" "$YELLOW"
    curl -s http://localhost:3000/health | jq . || curl -s http://localhost:3000/health
    echo ""
    
    print_message "✅ API tests complete!" "$GREEN"
}

# Function to clean up
clean_up() {
    print_message "🧹 Cleaning up Docker resources..." "$YELLOW"
    docker-compose down --rmi all --volumes --remove-orphans
    print_message "✅ Cleanup complete!" "$GREEN"
}

# Function to install dependencies
install_deps() {
    print_message "📦 Installing Node.js dependencies..." "$YELLOW"
    npm install
    print_message "✅ Dependencies installed!" "$GREEN"
}

# Main script logic
case "${1:-}" in
    start)
        start_app
        ;;
    start-dev)
        start_dev
        ;;
    stop)
        stop_app
        ;;
    restart)
        restart_app
        ;;
    logs)
        show_logs
        ;;
    status)
        show_status
        ;;
    build)
        build_app
        ;;
    test)
        test_app
        ;;
    clean)
        clean_up
        ;;
    install)
        install_deps
        ;;
    help|--help|-h)
        show_help
        ;;
    "")
        show_help
        ;;
    *)
        print_message "❌ Unknown command: $1" "$RED"
        echo ""
        show_help
        exit 1
        ;;
esac
