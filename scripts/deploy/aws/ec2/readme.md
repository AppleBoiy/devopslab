## 1. Update Domain DNS Records

Log in to your domain registrar (e.g., Namecheap, GoDaddy, Google Domains, Route53).
Create or update **DNS A Records**:

| Type | Name / Host | Value (IPv4 Address) | TTL     |
| ---- | ----------- | -------------------- | ------- |
| A    | @           | 54.123.45.67         | Default |
| A    | www         | 54.123.45.67         | Default |

* `@` → root domain (example.com)
* `www` → subdomain ([www.example.com](http://www.example.com))
* Value → your server’s **public IP**

Wait **5–30 minutes** (sometimes up to 24h) for DNS propagation.

---

## 3. Configure Nginx Server Block

On your server, create a directory for your domain:

```bash
sudo mkdir -p /var/www/example.com/html
sudo chown -R $USER:$USER /var/www/example.com/html
sudo chmod -R 755 /var/www/example.com
```

Create a test page:

```bash
echo "<h1>Hello from example.com</h1>" | sudo tee /var/www/example.com/html/index.html
```

Create Nginx config:

```bash
sudo nano /etc/nginx/sites-available/example.com
```

Paste:

```nginx
server {
    listen 80;
    server_name example.com www.example.com;

    root /var/www/example.com/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Enable and restart:

```bash
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

## 4. Test Your Domain

Open in browser:

```
http://example.com
http://www.example.com
```

You should see your Nginx test page.

---

## 5. (Optional) Add HTTPS with Let’s Encrypt

Install Certbot:

```bash
sudo apt install certbot python3-certbot-nginx -y
```

Obtain certificate:

```bash
sudo certbot --nginx -d example.com -d www.example.com
```

Certbot will auto-update your Nginx config.
Renew automatically:

```bash
sudo systemctl enable certbot.timer
```

---

## 6. Verify

Check Nginx config:

```bash
sudo nginx -t
```

Check your site:

* `http://example.com`
* `https://example.com` (if SSL enabled)

---
