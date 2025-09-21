# Requirements

This project aims to help you understand the basics of setting up a web server to serve a basic static site using Nginx. Additionally, you will learn how to use `rsync` to deploy changes to the server.

---

## Steps

1. **Set Up a Remote Server**
   - Register and set up a remote Linux server on any provider (e.g., DigitalOcean, AWS, etc.).
   - Ensure you can connect to the server using SSH.

2. **Install and Configure Nginx**
   - Install Nginx on the server.
   - Configure Nginx to serve a static site.

3. **Create a Static Website**
   - Develop a simple webpage with basic HTML, CSS, and image files.

4. **Deploy Using `rsync`**
   - Use `rsync` to update the remote server with the local static site.

5. **Domain Configuration (Optional)**
   - If you have a domain name, point it to your server to serve the static site.
   - Alternatively, serve the static site from the server's IP address.

6. **Automation Script**
   - Write a `deploy.sh` script to automate the deployment process using `rsync`.

---

## Goal

By completing this project, you will:
- Gain a basic understanding of setting up a web server with Nginx.
- Learn how to use `rsync` for deploying changes to a server.