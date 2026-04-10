---
title: "Install I2P+ on Linux"
description: "Step-by-step instructions for installing and configuring an I2P+ node on Debian-based Linux systems."
tag: "Linux"
image: "/images/installi2ppluslinux.webp"
weight: 1
---

This guide provides step-by-step instructions for installing and configuring an I2P node on Debian-based systems. Although the commands mentioned here are specific to Debian, most Linux distributions support I2P.

## Requirements

- **Memory:** By default, I2P only requires 128MB of memory. However, we recommend a minimum of 1GB and suggest 2GB for optimal performance.
- **CPU:** I2P has been tested and works on a wide range of systems, from single-board CPUs to enterprise-grade CPUs. The minimum requirement is 1 core, but we recommend at least 2 cores for better performance.
- For optimal performance and to effectively assist the I2P network, it is recommended to have a 24/7 internet connection.

## Step 1

To ensure a smooth installation process, it is important to fetch the necessary prerequisites and update your server.

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install default-jdk wget -y
```

![Installation of I2P](/images/installi2p_1.png)

## Step 2

To maintain optimal security and system integrity, it is not recommended to run I2P as a root user. Therefore, we will be initiating a new user profile specifically to operate the I2P-router.

```bash
sudo adduser i2p && sudo usermod -aG sudo i2p
```

![Create i2p user](/images/installi2p_2.png)

## Step 3

Moving forward, let's transition to the recently created user profile and proceed with retrieving the necessary I2P software components.

**Note:** At the time of writing this, I2P+ has moved to a universal installer. To check for the latest releases, visit [i2pplus.github.io](https://i2pplus.github.io/).

```bash
su i2p
mkdir /home/i2p/i2p
cd /home/i2p/i2p/
wget https://i2pplus.github.io/installers/i2pinstall.exe
```

![Download I2P installer](/images/installi2p_3.png)

## Step 4

After download, execute the headless Java installer for a quick, terminal-based setup. If your language of choice is English you can leave all settings as default.

```bash
java -jar i2pinstall.exe -console
```

![I2P Installation Step](/images/installi2p_4.png)

## Step 5

It's crucial to ensure that I2P initiates automatically upon server reboot, guaranteeing continuous functionality.

```bash
sudo echo '/bin/su i2p -c "/home/i2p/i2p/i2prouter start"' | sudo tee -a /etc/rc.local && sudo chmod +x /etc/rc.local
```

![Enable I2P autostart](/images/installi2p_5.png)

## Step 6

We need to start I2P.

```bash
./i2prouter start
```

![Start I2P Router](/images/installi2p_6.png)

The next step will depend on your system configuration. If you have a desktop environment installation please skip to Post Installation Instructions. If your server is remote please skip to [How to Create an SSH Tunnel](/guides/create-ssh-tunnel).

## Step 7

Congratulations, you have successfully configured an I2P node. New nodes can take some time to integrate with the network. So not all I2P websites and applications will work straight away and can take some time for the router to be integrated into the I2P Network. Learn more about [Accessing I2P Network & Applications](/guides/accessing-i2p).

## Post-Install Configuration (optional)

While the default I2P+ will work with no changes, there are several modifications that we can make to improve the experience and performance.

### Enabling Automatic Updates

**Step 1:** Navigate to the [Router Console Update Page](https://127.0.0.1:7667/configupdate).

**Step 2:** Change the Update policy to "Download, verify, and restart", then click Save.

![Enable automatic updates](/images/postconfig_01.png)

To reload the settings, you will need to restart your router. Click on the restart symbol in the bottom left.

![Restart after updates](/images/postconfig_02.png)

### Configure Bandwidth Settings

I2P+ will work best if you configure your rates to match the speed of your internet connection.

**Step 1:** Navigate to the [Router Console Bandwidth Configuration](https://127.0.0.1:7667/config).

![Bandwidth settings](/images/postconfig_03.png)

**Step 2:** After entering your Download, Upload, and Network share percentage hit the Save Changes button.

Your contribution to the network (network share) is determined by the allocation of upstream bandwidth (upload speed). The maximum data transfer values indicate the theoretical maximum, and in practice will normally be much lower.

### Opening Firewall

While I2P will work fine behind most firewalls, your speeds and network integration will generally improve if the I2P port is forwarded for both UDP and TCP.

We are unable to write a step by step guide to opening ports on a firewall as there are hundreds of different models each having their own settings. What we can do is provide some helpful links and guides to help accomplish this task.

You can visit [PortForward.com](https://portforward.com/router.htm) to get instructions for your specific router model.

By default I2P+ picks a random port. Visit your [Router Console Network Configuration](https://127.0.0.1:7667/confignet) page. You will see your UDP & TCP port which you will need to forward.

![Network config for port forwarding](/images/postconfig_08.png)
