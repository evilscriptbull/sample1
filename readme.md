# Hello World Node.js App with Docker

A complete Hello World Node.js application with Docker containerization, specifically designed for Windows + WSL2 development environments. This project demonstrates best practices for cross-platform development with comprehensive management tools.

## 🚀 Features

- 🌐 **Express.js web server** with REST API endpoints
- 🐳 **Docker containerization** with security best practices
- 🔧 **Docker Compose** for development and production modes
- 📊 **Health monitoring** with dedicated health check endpoint
- 🛡️ **Security hardened** containers with non-root users
- 🎯 **Hot reload** development environment
- 📝 **Management scripts** for Windows PowerShell and Linux/WSL
- ✅ **Cross-platform** Windows/WSL compatibility tested and verified
- 🧪 **API testing** tools built-in

## 📋 Prerequisites & Setup

### ✅ **Step 1: Required Software**

**Essential Requirements:**
- **Windows 11** (or Windows 10 with WSL2 support)
- **WSL2** with Ubuntu distribution
- **Docker Desktop** with WSL2 integration enabled
- **VS Code** (recommended) with Remote-WSL extension

**Installation Order:**
1. Install WSL2 and Ubuntu from Microsoft Store
2. Install Docker Desktop and enable WSL2 integration
3. Configure git and SSH in WSL2 (for pushing to GitHub)

### ✅ **Step 2: Environment Verification**

Before starting, verify your setup:

```powershell
# Check Docker is running
docker --version

# Check WSL2 is working
wsl --list --verbose

# Check Ubuntu access
wsl -d Ubuntu bash -c "echo 'WSL2 Ubuntu is working!'"
```

### ✅ **Step 3: Project Setup**

Clone and navigate to the project:

```powershell
# Clone the repository
git clone https://github.com/evilscriptbull/sample1.git

# Navigate to project (Windows path)
cd "\\wsl.localhost\Ubuntu\home\[your-username]\Code\sample1"

# OR navigate in WSL
wsl -d Ubuntu bash -c "cd ~/Code/sample1"
```

## 🚀 Quick Start Guide

### **Method 1: One-Click Start (Recommended for Beginners)**

If you just want to see the app running quickly:

```powershell
# 1. Open PowerShell in the project directory
cd "\\wsl.localhost\Ubuntu\home\cruze\Code\sample1"

# 2. Allow PowerShell scripts (if prompted)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# 3. Start the application
.\scripts\app.ps1 start

# 4. Test it's working
.\scripts\app.ps1 test

# 5. Stop when done
.\scripts\app.ps1 stop
```

**🎉 That's it!** Your app is running at http://localhost:3000

---

### **Method 2: Docker Compose (For Docker Users)**

Direct Docker Compose commands:

```powershell
# Production mode
docker-compose up -d app

# Development mode with hot reload  
docker-compose up -d app-dev

# View logs
docker-compose logs -f app

# Stop services
docker-compose down
```

---

### **Method 3: WSL/Linux Native (For Node.js Developers)**

Run Node.js directly in WSL:

```bash
# From WSL terminal
cd ~/Code/sample1

# Install dependencies (first time only)
npm install

# Start development server with hot reload
npm run dev

# OR start production server
npm start
```

---

### **Method 4: Using Management Scripts**

Our custom scripts handle everything for you:

#### **Windows PowerShell Commands:**
```powershell
# Navigate to project
cd "\\wsl.localhost\Ubuntu\home\cruze\Code\sample1"

# View all available commands
.\scripts\app.ps1 help

# Start application (Docker)
.\scripts\app.ps1 start

# Start in development mode (Docker)
.\scripts\app.ps1 start-dev

# Test API endpoints
.\scripts\app.ps1 test

# Check application status
.\scripts\app.ps1 status

# View application logs
.\scripts\app.ps1 logs

# Install Node.js dependencies in WSL
.\scripts\app.ps1 wsl-install

# Run with Node.js directly (WSL)
.\scripts\app.ps1 wsl-start

# Clean up Docker resources
.\scripts\app.ps1 clean

# Stop application
.\scripts\app.ps1 stop
```

#### **Linux/WSL Bash Commands:**
```bash
# Navigate to project
cd ~/Code/sample1

# View all available commands  
bash scripts/app.sh help

# Start application
bash scripts/app.sh start

# Test API endpoints
bash scripts/app.sh test

# Install dependencies
bash scripts/app.sh install

# Stop application
bash scripts/app.sh stop
```

## 🌐 API Endpoints & Testing

Once your application is running, you can access these endpoints:

### **Primary Endpoints:**

| Endpoint | Method | Description | Response |
|----------|---------|-------------|----------|
| `/` | GET | Hello World message | JSON with message, timestamp, environment |
| `/health` | GET | Health check status | JSON with status, uptime, timestamp |

### **Example API Responses:**

**Main Endpoint (`GET /`):**
```json
{
  "message": "Hello World from Node.js!",
  "timestamp": "2025-07-14T06:48:01.513Z",
  "environment": "production"
}
```

**Health Check (`GET /health`):**
```json
{
  "status": "OK",
  "uptime": 25.921665759,
  "timestamp": "2025-07-14T06:48:13.865Z"
}
```

### **Access URLs:**
- **Production mode**: http://localhost:3000
- **Development mode**: http://localhost:3001 (when using `app-dev` service)

### **Testing the API:**

**Option 1 - Using Management Scripts:**
```powershell
# Automated API testing
.\scripts\app.ps1 test
```

**Option 2 - Manual Testing:**
```powershell
# Test main endpoint
curl http://localhost:3000

# Test health endpoint  
curl http://localhost:3000/health
```

**Option 3 - Browser Testing:**
Simply open these URLs in your browser:
- http://localhost:3000
- http://localhost:3000/health

## 🛠️ Management Scripts Reference

We provide comprehensive management scripts for both Windows and Linux environments:

### **PowerShell Script Commands** (`.\scripts\app.ps1`)

| Command | Description | Usage Example |
|---------|-------------|---------------|
| `help` | Show all available commands | `.\scripts\app.ps1 help` |
| `start` | Start app with Docker Compose | `.\scripts\app.ps1 start` |
| `start-dev` | Start in development mode | `.\scripts\app.ps1 start-dev` |
| `stop` | Stop the application | `.\scripts\app.ps1 stop` |
| `restart` | Restart the application | `.\scripts\app.ps1 restart` |
| `status` | Show service status | `.\scripts\app.ps1 status` |
| `logs` | Show application logs | `.\scripts\app.ps1 logs` |
| `build` | Build Docker images | `.\scripts\app.ps1 build` |
| `test` | Test API endpoints | `.\scripts\app.ps1 test` |
| `clean` | Clean up Docker resources | `.\scripts\app.ps1 clean` |
| `wsl-install` | Install Node.js dependencies in WSL | `.\scripts\app.ps1 wsl-install` |
| `wsl-start` | Run app directly with Node.js | `.\scripts\app.ps1 wsl-start` |

### **Bash Script Commands** (`bash scripts/app.sh`)

| Command | Description | Usage Example |
|---------|-------------|---------------|
| `help` | Show all available commands | `bash scripts/app.sh help` |
| `start` | Start app with Docker Compose | `bash scripts/app.sh start` |
| `start-dev` | Start in development mode | `bash scripts/app.sh start-dev` |
| `stop` | Stop the application | `bash scripts/app.sh stop` |
| `restart` | Restart the application | `bash scripts/app.sh restart` |
| `status` | Show service status | `bash scripts/app.sh status` |
| `logs` | Show application logs | `bash scripts/app.sh logs` |
| `build` | Build Docker images | `bash scripts/app.sh build` |
| `test` | Test API endpoints | `bash scripts/app.sh test` |
| `clean` | Clean up Docker resources | `bash scripts/app.sh clean` |
| `install` | Install Node.js dependencies | `bash scripts/app.sh install` |

## 📁 Project Structure

```
sample1/
├── 📄 app.js                 # Main Express.js application server
├── 📄 package.json          # Node.js project configuration & dependencies
├── 📄 package-lock.json     # Dependency version lock file
├── 🐳 Dockerfile            # Docker image build instructions
├── 🐳 docker-compose.yml    # Docker Compose service definitions
├── 📄 .dockerignore         # Files excluded from Docker builds
├── 📄 .gitignore           # Files excluded from git repository
├── 📄 readme.md            # This comprehensive documentation
├── 📁 scripts/             # Management automation scripts
│   ├── 📄 app.sh           # Bash management script (Linux/WSL)
│   └── 📄 app.ps1          # PowerShell script (Windows)
└── 📁 node_modules/        # Node.js dependencies (auto-generated)
```

### **Key Files Explained:**

- **`app.js`**: The main Express.js server with REST API endpoints
- **`Dockerfile`**: Contains instructions for building the Docker container
- **`docker-compose.yml`**: Defines services for both development and production
- **`scripts/`**: Contains helper scripts to manage the application
- **Management Scripts**: Automate common tasks like starting, stopping, testing

## 🔧 Development & Configuration

### **Environment Variables**
| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `3000` | Server port number |
| `NODE_ENV` | `development` | Environment mode (development/production) |

### **Docker Services**
| Service | Port | Description |
|---------|------|-------------|
| `app` | `3000` | Production mode container |
| `app-dev` | `3001` | Development mode with hot reload |

### **Development Workflow**

1. **Make code changes** to `app.js` or other files
2. **For Docker development:**
   ```powershell
   .\scripts\app.ps1 build    # Rebuild containers
   .\scripts\app.ps1 restart  # Restart services
   ```
3. **For local Node.js development:**
   ```powershell
   .\scripts\app.ps1 wsl-start  # Hot reload enabled automatically
   ```
4. **Test your changes:**
   ```powershell
   .\scripts\app.ps1 test     # Run API tests
   ```

### **Adding New Features**

1. **New API endpoints**: Add routes to `app.js`
2. **New dependencies**: Add to `package.json` and run `npm install`
3. **Environment config**: Modify Docker Compose environment variables
4. **Documentation**: Update this README with new features

## 📝 Development Notes

### **Windows + WSL2 Optimization**
This project is specifically optimized for Windows development:
- **Source code** stored in WSL2 filesystem for better performance
- **Docker Desktop** provides seamless container management
- **Management scripts** handle cross-platform compatibility automatically
- **File permissions** managed transparently between Windows and WSL

### **Performance Tips**
- ✅ **Use Docker Compose** for consistent, isolated environments
- ✅ **Use development mode** (`start-dev`) for automatic hot reloading
- ✅ **Keep dependencies in WSL2** for faster npm operations
- ✅ **Use management scripts** to avoid environment issues

### **Security Features**
- 🛡️ **Non-root container user** prevents privilege escalation
- 🛡️ **Alpine Linux base** minimizes attack surface
- 🛡️ **Multi-stage builds** exclude development dependencies from production
- 🛡️ **Health checks** monitor application status

## 🚀 Next Steps & Extensions

### **Immediate Improvements**
1. **Add database connectivity** (MongoDB, PostgreSQL, Redis)
2. **Implement user authentication** (JWT, OAuth)
3. **Add API rate limiting** and security middleware
4. **Create additional endpoints** (CRUD operations)
5. **Add input validation** and error handling

### **Advanced Features**
1. **Set up testing framework** (Jest, Mocha, Supertest)
2. **Implement logging system** (Winston, structured logging)
3. **Add monitoring & metrics** (Prometheus, health metrics)
4. **Create CI/CD pipeline** (GitHub Actions, automated testing)
5. **Deploy to cloud platforms** (AWS, Azure, GCP)

### **Production Readiness**
1. **Environment-specific configurations** (staging, production)
2. **SSL/TLS certificate management**
3. **Load balancing and scaling strategies**
4. **Backup and disaster recovery plans**
5. **Security auditing and compliance**

## 📜 License

MIT License - Feel free to use this project as a starting point for your Node.js applications!

---

## 🎯 Summary

This project provides a **complete, production-ready foundation** for Node.js development with Docker on Windows + WSL2. The management scripts eliminate common development friction, and the comprehensive documentation ensures smooth onboarding for new developers.

**Perfect for:**
- Learning Node.js and Docker integration
- Rapid prototyping of REST APIs
- Starting point for larger applications
- Teaching cross-platform development best practices

**Ready to deploy, easy to extend, thoroughly documented!** 🚀

## 🐛 Troubleshooting Guide

### **Common Issues & Solutions**

#### **PowerShell Execution Policy Error**
```
❌ Error: "cannot be loaded because running scripts is disabled"
```
**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

#### **"npm is not recognized" Error**
```
❌ Error: "npm is not recognized as the name of a cmdlet"
```
**Solutions:**
```powershell
# Option 1: Use our PowerShell script
.\scripts\app.ps1 wsl-install

# Option 2: Run npm through WSL
wsl -d Ubuntu bash -c "cd ~/Code/sample1 && npm install"

# Option 3: Use Docker instead (no npm needed)
.\scripts\app.ps1 start
```

#### **Git Permission Errors**
```
❌ Error: "insufficient permission for adding an object to repository"
```
**Solution - Use WSL git:**
```bash
# Run git commands from WSL
wsl -d Ubuntu bash -c "cd ~/Code/sample1 && git add . && git commit -m 'message'"
```

#### **GitHub Push Authentication Failed**
```
❌ Error: "Permission denied (403)"
```
**Solution - Switch to SSH:**
```bash
# Change to SSH authentication
wsl -d Ubuntu bash -c "cd ~/Code/sample1 && git remote set-url origin git@github.com:evilscriptbull/sample1.git"

# Test SSH connection
wsl -d Ubuntu bash -c "ssh -T git@github.com"
```

#### **Docker Permission Issues**
```
❌ Error: Docker daemon not running or permission denied
```
**Solutions:**
1. **Start Docker Desktop** from Windows Start Menu
2. **Enable WSL2 integration** in Docker Desktop settings
3. **Restart Docker Desktop** and try again

#### **Port Already in Use**
```
❌ Error: "Port 3000 is already in use"
```
**Solutions:**
```powershell
# Option 1: Stop existing containers
.\scripts\app.ps1 stop

# Option 2: Clean up all Docker resources
.\scripts\app.ps1 clean

# Option 3: Check what's using port 3000
netstat -ano | findstr :3000
```

#### **WSL File Permissions**
```
❌ Error: Permission denied in WSL filesystem
```
**Solution:**
```bash
# Fix file ownership (run from WSL)
wsl -d Ubuntu bash -c "cd ~/Code && sudo chown -R \$USER:\$USER sample1"
```

#### **Line Ending Issues (Git)**
```
❌ Error: Files show as modified due to line endings
```
**Solution:**
```bash
# Configure git to handle line endings properly
wsl -d Ubuntu bash -c "cd ~/Code/sample1 && git config core.autocrlf false && git config core.filemode false"
```

### **Verification Commands**

Before troubleshooting, verify your environment:

```powershell
# Check Docker
docker --version
docker ps

# Check WSL2
wsl --list --verbose

# Check project structure
dir

# Check if management script is accessible
.\scripts\app.ps1 help
```

### **Getting Additional Help**

1. **View application logs:**
   ```powershell
   .\scripts\app.ps1 logs
   ```

2. **Check service status:**
   ```powershell
   .\scripts\app.ps1 status
   ```

3. **Test API connectivity:**
   ```powershell
   .\scripts\app.ps1 test
   ```

4. **Reset everything:**
   ```powershell
   .\scripts\app.ps1 clean
   .\scripts\app.ps1 start
   ```


