# Hello World Node.js App with Docker

A simple Hello World Node.js application containerized with Docker, designed to work seamlessly in Windows with WSL2.

## 🚀 Features

- 🌐 Express.js web server
- 🐳 Docker containerization with multi-stage builds
- 🔧 Docker Compose for easy development and production
- 📊 Health check endpoint
- 🛡️ Security best practices with non-root user
- 🎯 Hot reload for development
- 📝 Management scripts for both Windows PowerShell and Linux/WSL
- 🔧 Cross-platform compatibility (Windows/WSL)

## 📋 Prerequisites

### Required
- **Docker Desktop** with WSL2 integration enabled
- **WSL2** with Ubuntu distribution (for Node.js development)

### Optional (for local development)
- **Node.js** (v18+) installed in WSL2
- **npm** (comes with Node.js)

## 🚀 Quick Start

### Method 1: Using Docker Compose (Recommended)

```powershell
# Production mode (Windows PowerShell)
docker-compose up -d app

# Development mode with hot reload
docker-compose up -d app-dev

# View logs
docker-compose logs -f app

# Stop the application
docker-compose down
```

### Method 2: Using Management Scripts

#### PowerShell (Windows)
```powershell
# Make sure you're in the project directory
cd "\\wsl.localhost\Ubuntu\home\cruze\Code\sample1"

# Start the app
.\scripts\app.ps1 start

# Start in development mode
.\scripts\app.ps1 start-dev

# Test the API
.\scripts\app.ps1 test

# View status
.\scripts\app.ps1 status

# Stop the app
.\scripts\app.ps1 stop

# Install dependencies in WSL
.\scripts\app.ps1 wsl-install

# Run app directly with Node.js (WSL)
.\scripts\app.ps1 wsl-start
```

#### Bash (Linux/WSL)
```bash
# Navigate to project directory
cd /home/cruze/Code/sample1

# Start the app
bash scripts/app.sh start

# Start in development mode
bash scripts/app.sh start-dev

# Test the API
bash scripts/app.sh test

# Install Node.js dependencies
bash scripts/app.sh install

# View all commands
bash scripts/app.sh help
```

### Method 3: Using Docker Directly

```powershell
# Build the image
docker build -t hello-world-node .

# Run the container
docker run -d -p 3000:3000 --name hello-world-app hello-world-node

# View logs
docker logs -f hello-world-app

# Stop and remove
docker stop hello-world-app; docker rm hello-world-app
```

### Method 4: Local Development (WSL)

```bash
# Install dependencies (in WSL)
wsl -d Ubuntu bash -c "cd /home/cruze/Code/sample1 && npm install"

# Run in development mode
wsl -d Ubuntu bash -c "cd /home/cruze/Code/sample1 && npm run dev"

# Run in production mode
wsl -d Ubuntu bash -c "cd /home/cruze/Code/sample1 && npm start"
```

## 🌐 API Endpoints

Once the application is running, you can access:

### Main Endpoints
- **`GET /`** - Hello World message
  ```json
  {
    "message": "Hello World from Node.js!",
    "timestamp": "2025-07-14T06:48:01.513Z",
    "environment": "production"
  }
  ```

- **`GET /health`** - Health check endpoint
  ```json
  {
    "status": "OK",
    "uptime": 25.921665759,
    "timestamp": "2025-07-14T06:48:13.865Z"
  }
  ```

### Access URLs
- **Production mode**: http://localhost:3000
- **Development mode**: http://localhost:3001 (if using app-dev service)

## 🧪 Testing

### Quick API Test
```powershell
# Test main endpoint
curl http://localhost:3000

# Test health endpoint
curl http://localhost:3000/health
```

### Using Management Scripts
```powershell
# PowerShell
.\scripts\app.ps1 test

# Bash/WSL
bash scripts/app.sh test
```

## 📁 Project Structure

```
sample1/
├── 📄 app.js                 # Main Express.js application
├── 📄 package.json          # Node.js project configuration
├── 📄 package-lock.json     # Dependency lock file
├── 🐳 Dockerfile            # Docker image configuration
├── 🐳 docker-compose.yml    # Docker Compose services
├── 📄 .dockerignore         # Docker build exclusions
├── 📄 .gitignore           # Git exclusions
├── 📄 readme.md            # This documentation
├── 📁 scripts/             # Management scripts
│   ├── 📄 app.sh           # Bash management script
│   └── 📄 app.ps1          # PowerShell management script
└── 📁 node_modules/        # Dependencies (generated)
```

## 🔧 Development

### Environment Variables
- `PORT`: Server port (default: 3000)
- `NODE_ENV`: Environment mode (development/production)

### Docker Compose Services
- **`app`**: Production mode on port 3000
- **`app-dev`**: Development mode on port 3001 with hot reload

### Making Changes
1. Edit the code files
2. For Docker: Rebuild with `docker-compose build`
3. For local development: Changes are auto-reloaded with nodemon

## 🛠️ Management Commands

### PowerShell Script Commands
```powershell
.\scripts\app.ps1 [command]
```

| Command | Description |
|---------|-------------|
| `start` | Start app with Docker Compose |
| `start-dev` | Start in development mode |
| `stop` | Stop the application |
| `restart` | Restart the application |
| `logs` | Show application logs |
| `status` | Show service status |
| `build` | Build Docker images |
| `test` | Test API endpoints |
| `clean` | Clean up Docker resources |
| `wsl-install` | Install dependencies in WSL |
| `wsl-start` | Run app directly with Node.js |

## 🐛 Troubleshooting

### Common Issues

#### "npm is not recognized"
**Problem**: Running npm commands in Windows PowerShell
**Solution**: Use WSL commands or the management scripts
```powershell
# Instead of: npm start
# Use:
wsl -d Ubuntu bash -c "cd /home/cruze/Code/sample1 && npm start"
# Or:
.\scripts\app.ps1 wsl-start
```

#### Docker permission issues
**Problem**: Docker commands failing
**Solution**: Ensure Docker Desktop is running with WSL2 integration enabled

#### Port already in use
**Problem**: Port 3000 already occupied
**Solution**: Stop existing services or change port in docker-compose.yml

#### WSL file permissions
**Problem**: Permission denied in WSL
**Solution**: Files are managed through Windows file system, use the provided scripts

### Getting Help
- View all available commands: `.\scripts\app.ps1 help`
- Check service status: `.\scripts\app.ps1 status`
- View logs: `.\scripts\app.ps1 logs`

## 📝 Development Notes

### Windows + WSL2 Setup
This project is optimized for development on Windows with WSL2:
- Source code is stored in WSL2 filesystem for better performance
- Docker Desktop provides seamless container management
- Management scripts handle cross-platform compatibility
- PowerShell and Bash scripts provide native experiences

### Performance Tips
- Use Docker Compose for consistent environments
- Use development mode for hot reloading
- Keep dependencies in WSL2 for faster npm operations

## 🚀 Next Steps

1. **Add more endpoints** to the Express.js application
2. **Implement database connectivity** (MongoDB, PostgreSQL)
3. **Add testing framework** (Jest, Mocha)
4. **Set up CI/CD pipeline** with GitHub Actions
5. **Add environment-specific configurations**
6. **Implement logging and monitoring**

## 📜 License

MIT License - feel free to use this project as a starting point for your Node.js applications!
