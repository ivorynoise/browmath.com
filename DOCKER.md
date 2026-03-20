# Browmath Docker Setup

Simple Docker setup to serve your HTML files using Caddy.

## Quick Start

```bash
# Build and run
docker-compose up --build

# Your site will be available at http://localhost/sunset.html
```

## Manual Build & Run

```bash
# Build the image
docker build -t browmath:latest .

# Run the container
docker run -p 80:80 -p 443:443 browmath:latest
```

## Stop the Container

```bash
docker-compose down
```

## File Structure

```
browmath.com/
├── Dockerfile
├── docker-compose.yml
└── sunset.html
```
