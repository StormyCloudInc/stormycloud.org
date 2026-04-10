---
title: "How to Create an SSH Tunnel"
description: "Route data securely over an encrypted SSH connection with platform-specific instructions for Windows, Linux, and Mac."
tag: "Networking"
image: "/images/sshtunnel.webp"
weight: 4
---

## What is an SSH Tunnel?

An SSH tunnel is a method of routing data and information securely over an encrypted SSH (Secure Shell) connection. Think of it like sending correspondence in a sealed envelope rather than a postcard. SSH tunneling enables secure remote system access through an encrypted data passageway that prevents interception.

## Creating SSH Tunnel on Windows

Windows users should use [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), a recognized SSH management tool.

**Step 1:** Open PuTTY and enter the IP or Host Name for the remote server.

![PuTTY host configuration](/images/sshtunnel_1.webp)

**Step 2:** Expand the SSH tab and click on Tunnels. Source port can be any number from 1-65535 (unused). Enter the destination as:

```text
127.0.0.1:7657
```

- `127.0.0.1` - Localhost IP on remote server
- `7657` - Destination port assigned to I2P console

![PuTTY tunnel configuration](/images/sshtunnel_2.webp)

**Step 3:** Click Open and enter username and password.

![PuTTY login](/images/sshtunnel_3.webp)

## Configuring SSH Tunnel on Linux

**Step 1:** Open the terminal.

![Linux terminal](/images/sshtunnel_4.webp)

**Step 2:** Enter the following command into the terminal:

```bash
ssh -L 7657:127.0.0.1:7657 i2p@20.228.143.58
```

Parameter breakdown:

- `7657` (first) - Local port selection (1-65535, unused)
- `127.0.0.1` - Localhost IP on remote server (destination)
- `7657` (second) - Destination port for I2P console
- `i2p` - Username for remote server login (varies per user)
- `20.228.143.58` - Remote server IP with I2P installation

## Creating SSH Tunnel on Mac

**Step 1:** Open the terminal.

![Mac terminal](/images/sshtunnel_5.webp)

**Step 2:** Enter the following command into the terminal:

```bash
ssh -L 7657:127.0.0.1:7657 i2p@20.228.143.58
```

Parameter breakdown:

- `7657` (first) - Local port selection (1-65535, unused)
- `127.0.0.1` - Localhost IP on remote server (destination)
- `7657` (second) - Destination port for I2P console
- `i2p` - Username for remote server login (varies per user)
- `20.228.143.58` - Remote server IP with I2P installation
