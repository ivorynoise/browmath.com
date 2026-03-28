# Use the official Caddy image
FROM caddy:alpine

# Set the working directory inside the container to /srv
WORKDIR /srv

# Copy Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Copy site files into the container's /srv directory
COPY browmath.html index.html
COPY favicon.svg favicon.svg
COPY robots.txt robots.txt
COPY sitemap.xml sitemap.xml
