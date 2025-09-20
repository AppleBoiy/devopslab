# Setup Nginx on Ubuntu Webserver (AWS EC2)

This guide explains how to set up a basic Nginx web server on a fresh Ubuntu machine (tested on AWS EC2).

---

## 1. Update the System

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 2. Install Nginx

```bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

Check status:

```bash
systemctl status nginx
```

---

## 3. Configure Firewall (Ubuntu UFW)

If `ufw` is active:

```bash
sudo ufw allow 'Nginx Full'
sudo ufw status
```

---

## 4. Configure AWS Security Group

Even if UFW allows it, AWS blocks traffic unless you update the **Security Group**.

1. Go to **EC2 → Instances → Select your instance**.
2. Scroll to **Security → Security Groups**.
3. Edit **Inbound Rules** → Add rules:

   * **HTTP (80)** → Source: `0.0.0.0/0`
   * **HTTPS (443)** → Source: `0.0.0.0/0`
   * (Optional) **SSH (22)** → Source: `your IP only`

Save changes.

---

## 5. Test Default Page

Find your EC2 public IP:

```bash
curl ifconfig.me
```

Open in browser:

```
http://<your-ec2-public-ip>:80
```

You should see **“Welcome to Nginx”**.