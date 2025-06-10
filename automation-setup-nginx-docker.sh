# !/bin/bash

set -e # Stop on error

# Update system & install basic tools
echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git ufw unzip gnupg2 ca-certificates lsb-release apt-transport-https

# Install Docker & Docker Compose
echo "🐳 Installing Docker..."
curl -fsSL https://get.docker.com | bash
sudo usermod -aG docker $USER

echo "🧩 Installing Docker Compose..."
curl -SL https://github.com/docker/compose/releases/download/v2.37.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


# Setup basic firewall
echo "🛡️ Configuring UFW firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

# Install Nginx
echo "🌐 Installing Nginx..."
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx