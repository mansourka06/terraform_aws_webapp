#!/bin/bash
set -e  # Exit immediately on error
set -o pipefail

# Variables
APP_DIR="/var/www/html"
REPO_URL="https://github.com/mansourka06/my-devops-webapp.git"
WEBAPP_NAME="my-devops-webapp"

echo "🚀 Starting web app deployment with Nginx..."

# Update packages
echo "🔄 Updating system packages..."
sudo apt update -y

# Install nginx if not already installed
if ! command -v nginx &>/dev/null; then
  echo "📦 Installing Nginx..."
  sudo apt install -y nginx
else
  echo "✅ Nginx already installed."
fi

# Ensure Nginx is enabled and running
echo "🟢 Starting and enabling Nginx..."
sudo systemctl enable nginx
sudo systemctl start nginx

# Deploy web app
echo "📁 Deploying web app to ${APP_DIR}..."

# Clean old app files safely
sudo mkdir -p "$APP_DIR"
sudo rm -rf "${APP_DIR:?}/"*

# Clone latest version of repo
sudo git clone "$REPO_URL" "$APP_DIR/$WEBAPP_NAME"

# Move content from repo folder to web root
sudo mv "$APP_DIR/$WEBAPP_NAME"/* "$APP_DIR/"
sudo rm -rf "$APP_DIR/$WEBAPP_NAME"

# Set correct permissions
sudo chown -R www-data:www-data "$APP_DIR"
sudo chmod -R 755 "$APP_DIR"

# Restart Nginx to apply any config
echo "♻️ Restarting Nginx..."
sudo systemctl restart nginx

# Check Nginx and web app status
echo "🔍 Checking Nginx status..."
if systemctl is-active --quiet nginx; then
  echo "✅ Nginx is running."
else
  echo "❌ Nginx failed to start. Check logs: sudo journalctl -u nginx"
  exit 1
fi

# Verify the app is accessible locally
echo "🌐 Verifying web app is reachable..."
if curl -Is http://localhost | head -n 1 | grep -q "200"; then
  echo "🎉 Deployment successful! Web app is running at http://<server-ip>/"
else
  echo "⚠️ Web app might not be reachable. Check /var/log/nginx/error.log."
fi
