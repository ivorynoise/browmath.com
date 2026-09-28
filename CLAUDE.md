# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a static sunsetting website for browmath.com, served by Cloudflare Workers static assets. The entire site is a single HTML file (`public/index.html`).

## Commands

```bash
npx wrangler dev      # Serve locally at http://localhost:8787
npx wrangler deploy   # Deploy to Cloudflare
```

## Architecture

- `public/` — everything in here is uploaded and served as-is (`index.html`, `robots.txt`, `sitemap.xml`)
- `wrangler.jsonc` — Worker name, assets directory and the `browmath.com` custom domain

## CI/CD

Cloudflare Workers Builds (Git integration, set up in the Cloudflare dashboard) runs `npx wrangler deploy` on push to `main`.
