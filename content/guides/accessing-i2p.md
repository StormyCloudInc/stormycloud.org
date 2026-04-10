---
title: "Accessing I2P Network & Applications"
description: "Learn how to configure browser proxy settings to connect to the I2P network and explore built-in applications."
tag: "Getting Started"
image: "/images/accessi2p.webp"
weight: 3
---

I2P, unlike the Tor Network, does not come with a dedicated browser. To access I2P, it's necessary to both establish a connection to the I2P network and adjust your browser's proxy settings. This configuration will ensure seamless access to the I2P platform.

To effectively navigate the I2P network, it's essential to establish a connection with the HTTP proxy. By default, this connection is configured to port 4444. Please refer to our [How to Create an SSH Tunnel](/guides/create-ssh-tunnel) guide and replace port 7657 with 4444 in the instructions. Upon establishing a successful connection, proceed with one of the following guides.

## Configuring Safari

**Step 1:** In the Safari app on your Mac, choose Safari > Settings, then click Advanced.

![Safari Settings](/images/accessi2p_1.png)

**Step 2:** Click on Change Settings.

**Step 3:** Enable Web proxy (HTTP) and enter `127.0.0.1` for the server and `4444` for the port.

![Safari proxy configuration](/images/accessi2p_2.png)

Start to browse the I2P network!

## Configuring Firefox

**Step 1:** In the Firefox application, open the settings option.

![Firefox Settings](/images/accessi2p_3.png)

**Step 2:** Type "proxy" in the search bar and click on Settings.

![Firefox proxy search](/images/accessi2p_4.png)

**Step 3:** Select Manual proxy configuration. In the HTTP Proxy field type `127.0.0.1` and for the Port type `4444`.

![Firefox proxy configuration](/images/accessi2p_5.png)

**Step 4:** Click OK and start to browse the I2P Network!

## Configuring Chrome

**Step 1:** Open Settings.

![Chrome Settings](/images/accessi2p_6.png)

**Step 2:** Search for "proxy" and select "Open your computer's proxy settings".

![Chrome proxy search](/images/accessi2p_7.png)

**Step 3:** Under Manual proxy setup click on Set up.

![Chrome manual proxy setup](/images/accessi2p_8.png)

**Step 4:** Turn "Use a proxy server" on. Under the Proxy IP address type `127.0.0.1`, under Port type `4444`. Click Save.

![Chrome proxy configuration](/images/accessi2p_9.png)

**Step 5:** Start to browse the I2P Network!

## I2P Applications

### BitTorrent

I2P comes with its own built-in BitTorrent client and network, allowing file sharing while maintaining privacy.

To access the I2P BitTorrent client, visit the following URL once you are connected to the I2P network:

```text
http://127.0.0.1:7657/torrents
```

![I2P BitTorrent client](/images/accessi2p_10.png)

The BitTorrent client in I2P operates exclusively within the I2P network. This means that you can only download torrents that have been uploaded within the I2P network itself.

I2P has its own torrent tracker for managing uploads and downloads:

```text
http://tracker2.postman.i2p/
```

![I2P torrent tracker](/images/accessi2p_11.png)

### I2P Forum

I2P fosters a vibrant community through its own dedicated forum, providing a safe and anonymous platform for users to communicate, share insights, ask questions, and engage in discussions.

```text
http://i2pforum.i2p/
```

### I2P "Reddit" (Ramble)

I2P includes Ramble, a platform similar to Reddit where users can post stories, ask questions, share pictures with voting and comment systems.

```text
http://ramble.i2p
```

![Ramble on I2P](/images/accessi2p_12.png)

