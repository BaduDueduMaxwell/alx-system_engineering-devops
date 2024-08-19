Here's a sample README for the web server project based on the details provided:

---

# Web Server Project

## Overview

This project focuses on setting up and configuring a web server using Nginx on an Ubuntu machine. The tasks involve automating server configuration, file transfer, domain setup, and creating custom server responses. The objective is to gain practical experience in server management and automation using Bash scripts.

## Project Tasks

### 0. Transfer a File to Your Server

**Objective:** Write a Bash script to transfer a file from your local machine to a server using `scp`.

**Requirements:**
- Accepts 4 parameters:
  - Path to the file to be transferred
  - IP of the server
  - Username for `scp` connection
  - Path to the SSH private key

**Script Example:**

```bash
#!/usr/bin/env bash
# Transfers a file from client to server with scp

if [ "$#" -lt 3 ]; then
  echo "Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY"
elif [ "$#" -lt 4 ]; then
  scp -o StrictHostKeyChecking=no "$1" "$3@$2":~/
else
  scp -i "$4" -o StrictHostKeyChecking=no "$1" "$3@$2":~/
fi
```

### 1. Install Nginx Web Server

**Objective:** Install and configure Nginx to listen on port 80 and serve a page containing "Hello World!".

**Requirements:**
- Install Nginx on your server.
- Ensure Nginx is listening on port 80.
- Serve a page with the text "Hello World!".

**Script Example:**

```bash
#!/usr/bin/env bash
# Installs and configures Nginx web server

apt-get update
apt-get install -y nginx
echo "Hello World!" > /var/www/html/index.html
service nginx restart
```

### 2. Setup a Domain Name

**Objective:** Register a .tech domain and configure DNS records to point to your server.

**Requirements:**
- Register a free .tech domain using the GitHub student pack.
- Configure DNS records with an A entry pointing to your server’s IP address.

**Example Domain:**

```text
example.tech
```

### 3. Redirection

**Objective:** Configure Nginx to redirect `/redirect_me` to another page with a "301 Moved Permanently" status.

**Requirements:**
- Implement a 301 redirection for `/redirect_me`.

**Script Example:**

```bash
#!/usr/bin/env bash
# Configures Nginx redirection

sed -i '/server_name _;/a location /redirect_me {\n\treturn 301 https://www.example.com;\n}' /etc/nginx/sites-enabled/default
service nginx reload
```

### 4. Not Found Page 404

**Objective:** Create a custom 404 page that contains "Ceci n'est pas une page".

**Requirements:**
- Configure Nginx to serve a custom 404 page with the specified content.

**Script Example:**

```bash
#!/usr/bin/env bash
# Configures a custom 404 page for Nginx

echo "Ceci n'est pas une page" > /var/www/html/404.html
sed -i '/server_name _;/a error_page 404 /404.html;' /etc/nginx/sites-enabled/default
service nginx reload
```

## Resources

- [How the web works](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Child Process Concept](https://en.wikipedia.org/wiki/Process_management#Child_process)
- [HTTP Requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
- [DNS Records](https://www.cloudflare.com/learning/dns/what-are-dns-records/)

## Learning Objectives

By the end of this project, you should be able to:

- Explain the role of a web server.
- Understand the concept of a child process.
- Describe why web servers use parent and child processes.
- Recognize and explain main HTTP requests.
- Understand DNS, including its role and record types (A, CNAME, TXT, MX).

## Requirements

- All Bash script files must be executable.
- Scripts must pass Shellcheck (version 0.3.7) without errors.
- The first line of all scripts should be `#!/usr/bin/env bash`.
- The second line should be a comment explaining the script’s purpose.
- Use `vi`, `vim`, or `emacs` for editing files.
- No use of `systemctl` for restarting processes.

