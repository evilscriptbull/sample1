# Hello World Node.js App with Docker

A simple Hello World Node.js application containerized with Docker.

## Features

- 🚀 Express.js web server
- 🐳 Docker containerization
- 🔧 Docker Compose for easy development
- 📊 Health check endpoint
- 🛡️ Security best practices with non-root user

## Quick Start

### Prerequisites

- Docker
- Docker Compose
- Node.js (for local development)

### Running with Docker Compose

```bash
# Production mode
docker-compose up app

# Development mode (with hot reload)
docker-compose up app-dev
```

### Running with Docker

```bash
# Build the image
docker build -t hello-world-node .

# Run the container
docker run -p 3000:3000 hello-world-node
```

### Local Development

```bash
# Install dependencies
npm install

# Run in development mode
npm run dev

# Run in production mode
npm start
```

## API Endpoints

- `GET /` - Returns a Hello World message
- `GET /health` - Health check endpoint

## Access the Application

Once running, you can access:
- Main app: http://localhost:3000
- Health check: http://localhost:3000/health

## Project Structure

```
.
├── app.js              # Main application file
├── package.json        # Node.js dependencies and scripts
├── Dockerfile          # Docker image configuration
├── docker-compose.yml  # Docker Compose configuration
├── .dockerignore       # Files to exclude from Docker build
└── README.md          # This file
```
