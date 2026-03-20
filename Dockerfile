# Use the official Caddy image
FROM caddy:alpine

# Set the working directory inside the container to /srv
WORKDIR /srv

# Copy Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Copy your local HTML files into the container's /srv directory
COPY browmath.html index.html
# You can copy an entire directory of files like this:
# COPY ./your-site-folder .
