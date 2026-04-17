# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a static sunsetting website for browmath.com, served via Caddy in a Docker container. The entire site is a single HTML file (`browmath.html`) served as `index.html`.

## Commands

**Local development (Docker):**
```bash
docker compose up --build   # Build and serve at http://localhost:80
docker compose up           # Serve without rebuilding (uses volume mount of browmath.html)
```

**Build and push to registry:**
```bash
./build.sh 1.0.0            # Build and push with a specific version tag
./build.sh                  # Interactive: prompts for version tag
```

The registry is `central-harbor.ext.synthlane.com/internal` and the image name is `browmath-com`.

## Architecture

- `browmath.html` — the entire website; mounted via volume in dev, copied as `index.html` in production image
- `Dockerfile` — uses `caddy:alpine`, copies `browmath.html` as `index.html` into `/srv`
- `Caddyfile` — serves `/srv` as a static file server on port 80 with JSON stdout logging
- `docker-compose.yml` — mounts `browmath.html` as `/srv/index.html` for live editing without rebuild

## CI/CD

GitHub Actions workflow (`.github/workflows/build-and-push.yml`) is manually triggered (`workflow_dispatch`) with a required `version` input. It authenticates to Harbor using `INFISICAL_HARBOR_USERNAME` and `INFISICAL_HARBOR_PASSWORD` secrets, then runs `./build.sh <version>`.
