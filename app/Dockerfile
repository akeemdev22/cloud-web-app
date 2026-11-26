# Small Nginx web server that runs as a normal user, not root
FROM nginxinc/nginx-unprivileged:1.27-alpine

# Copy the website into the folder Nginx serves
COPY site/ /usr/share/nginx/html/

# This image listens on port 8080
EXPOSE 8080

# Docker checks every 30 seconds that the site still answers
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8080/ || exit 1