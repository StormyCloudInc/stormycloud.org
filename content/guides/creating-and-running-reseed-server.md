---
title: "Creating & Running an I2P Reseed Server"
description: "Set up and operate a reseed server to help integrate new routers into the I2P network."
tag: "Infrastructure"
image: "/images/reseed.webp"
weight: 5
---

## What is an I2P Reseed Server?

Reseed hosts play a crucial role in integrating new routers into the I2P network. When a new router is set up, it requires an initial group of nodes to establish connections. Reseed hosts facilitate this by providing a starting list of nodes during the router's bootstrapping process. Moreover, existing routers occasionally need to undergo reseeding, particularly when they face difficulties connecting to the network, often due to their current known nodes being inaccessible.

The reseeding process is securely conducted over an encrypted connection, ensuring the integrity and authenticity of the bootstrap information. Each piece of information received during reseeding is digitally signed by the reseed host. This security measure effectively prevents any unauthorized sources from disseminating false or malicious data, thereby maintaining the network's reliability and security.

## Preparing the Server

**Step 1:** Update the server and install the required packages.

```bash
sudo apt update && sudo apt upgrade -y && sudo apt-get install golang-go git make docker.io docker-compose -y
```

**Step 2:** Pull the reseed-tools repo. Note: Change the home directory to where I2P is installed. For example, if you followed our guide you will want to change the command to read `cd /home/i2p/`.

```bash
cd /home/i2p
git clone https://i2pgit.org/idk/reseed-tools
cd reseed-tools
make build
sudo make install
```

![Building reseed-tools](/images/reseed_01.png)

**Note:** The "install invalid user 'i2psvc'" message is expected. We will run this reseed service as the same user as the I2P router.

**Step 3:** Change two values for better performance. We will increase the number of routerInfos included in each su3 file from 77 to 100, and reduce the number of su3 files built.

```bash
sed -i '/Value: 77/{s/77/100/;:a;n;ba}' cmd/reseed.go
sed -i '0,/Value: 50/{//s/50/4/}' cmd/reseed.go
sed -i 's/NumRi: 77/NumRi: 100/' reseed/service.go
make build
```

![Configuring reseed-tools](/images/reseed_02.png)

**Step 4:** Generate an SSL certificate for the reseed server. Run the command, select yes to generate the keys, and then cancel the script with CTRL+C.

Parameter explanations:

- `i2p` - The user that you installed the I2P router & reseed server
- `--signer=admin@stormycloud.org` - Change this to your email address (clearnet or I2P email)
- `--netdb=/home/i2p/.i2p/netDb` - Your I2P Router netDb file path
- `--port 8443` - The port the reseed server lives on

```bash
su - i2p -c 'reseed-tools reseed --signer=admin@stormycloud.org --netdb=/home/i2p/.i2p/netDb --port=8443 --ip=127.0.0.1 --trustProxy'
```

![Generating reseed certificates](/images/reseed_03.png)

**Step 5:** Ensure to securely back up the generated keys for server restoration or expansion. Store them in a safe, encrypted location with limited access.

**Step 6:** Create a system service so this service can run without scripts. Change the service variables to match your environment (same as Step 4).

```bash
sudo tee /etc/systemd/system/reseed.service <<EOF
[Unit]
Description=Reseed Service
After=network.target

[Service]
User=i2p
WorkingDirectory=/home/i2p
ExecStart=/bin/bash -c 'reseed-tools reseed --signer=admin@stormycloud.org --netdb=/home/i2p/.i2p/netDb --port=8443 --ip=127.0.0.1 --trustProxy'
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable reseed
sudo systemctl start reseed
```

**Step 7:** Verify the reseed service is running:

```bash
systemctl status reseed.service
```

![Reseed service status](/images/reseed_04.png)

**Step 8 (optional):** Add a crontab job to restart the reseed server every 3 hours to avoid serving older su3 files:

```bash
echo "0 */3 * * * systemctl restart reseed" | crontab -
```

## Setting up a Reverse Proxy

A reverse proxy is a server that sits between users and web servers. When users send requests (like loading a webpage), the reverse proxy takes these requests and sends them to the appropriate web server. It helps improve performance, security, and manage traffic flow.

**Step 1:** We recommend using [Nginx Proxy Manager](https://nginxproxymanager.com/). Deploy it using Docker:

```bash
docker run -d \
--name nginx-proxy-manager \
-p 80:80 \
-p 81:81 \
-p 443:443 \
-v $(pwd)/data:/data \
-v $(pwd)/letsencrypt:/etc/letsencrypt \
--restart unless-stopped \
jc21/nginx-proxy-manager:latest
```

**Step 2:** Visit your server over port 81 (e.g., `23.128.248.250:81`). You might need to temporarily disable your firewall. Log in and change the default credentials.

Default Admin Credentials:

- **Email:** admin@example.com
- **Password:** changeme

![Nginx Proxy Manager login](/images/reseed_05.png)

**Step 3:** To add the reseed service click on Hosts > Proxy Host > Add Proxy Host.

![Adding proxy host](/images/reseed_06.png)

**Step 4:** Add the information for the reseed server. Use the below example as a guide to match your environment.

![Proxy host configuration](/images/reseed_07.png)

**Step 5:** Click on the SSL tab. Select "Request a new SSL certificate". Enter your email address and agree to the terms, then select Save.

![SSL certificate setup](/images/reseed_08.png)

**Step 6:** If everything was successful, browsing the domain should show the reseed server page.

![Reseed server running](/images/reseed_09.png)

Re-enable your firewall but allow port 80 (HTTP) & 443 (HTTPS) to be accessible.

**Step 7:** Send an email to `zzz@mail.i2p` (I2P) or `zzz@i2pmail.org` (Clearnet) with the following information:

- Reseed website URL
- Public reseed su3 certificate
- Your contact email
