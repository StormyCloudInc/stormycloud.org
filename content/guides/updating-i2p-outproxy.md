---
title: "Updating I2P Outproxy"
description: "Configure outproxy settings in I2P, I2P+, and I2PD with step-by-step instructions."
tag: "Configuration"
image: "/images/updateoutproxy.webp"
weight: 6
---

As of August 2022, the I2P team made StormyCloud the default outproxy provider for I2P. The default outproxy provider for I2P+ is purokishi.i2p. Users needing updates should follow the steps below. For remote server connections, refer to the [SSH Tunnel guide](/guides/create-ssh-tunnel).

## I2P / I2P+

**Step 1:** Connect to the router console. Navigate to: `127.0.0.1:7657`

![I2P Router Console](/images/updateoutproxy_01.png)

**Step 2:** Navigate to the Tunnel Manager: `http://127.0.0.1:7657/tunnelmanager`

![I2P Tunnel Manager](/images/updateoutproxy_02.png)

**Step 3:** Click "I2P HTTP Proxy" to navigate to: `http://127.0.0.1:7657/i2ptunnel/edit?tunnel=0`

**Step 4:** Update both the Outproxies and SSL Outproxies fields with:

```text
exit.stormycloud.i2p,purokishi.i2p
```

![Update outproxy settings](/images/updateoutproxy_03.png)

## I2PD

**Step 1:** Open the I2PD configuration file:

```bash
nano /etc/i2pd/i2pd.conf
```

**Step 2:** Locate the httpproxy block and add the following line:

```text
outproxy = http://exit.stormycloud.i2p
```

Or add the complete block if it doesn't exist:

```ini
[httpproxy]
port = 4444
outproxy = http://exit.stormycloud.i2p
```

**Step 3:** Restart I2PD:

```bash
systemctl restart i2pd
```

## Address Helper

**Address:** `exit.stormycloud.i2p`

**B32 Address:**

```text
5d4s7pcvfdpftfk7npc7hllyujhufsdprtrf4o53i44rgsa2xbwa.b32.i2p
```
