# Install Certbot (Let's Encrypt)
echo "🔒 Installing Certbot for HTTPS..."

sudo apt install -y certbot python3-certbot-nginx

# Request SSL Certificate
DOMAIN="yourdomain.com"
EMAIL="you@example.com"

echo "📨 Requesting Let's Encrypt SSL certificate..."
sudo certbot --nginx -d $DOMAIN --non-interactive --agree-tos -m $EMAIL

# Enable Auto-Renewal
echo "⏳ Setting up auto-renewal cron job..."
echo "0 0 * * * /usr/bin/certbot renew --quiet" | sudo tee /etc/cron.d/certbot-renew
