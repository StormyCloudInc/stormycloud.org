---
title: "Setting Up Encrypted DNS"
description: "Configure DNS-over-HTTPS and DNS-over-TLS on Windows, macOS, Linux, Android, iOS, browsers, and routers using StormyCloud's privacy DNS servers."
image: "/images/encrypted-dns-hero.png"
tag: "Privacy"
weight: 7
---

Every time you visit a website, your device sends a DNS query to translate the domain name into an IP address. By default, these queries are sent in plain text over UDP port 53. This means your ISP, network operator, or anyone on the same network can see every site you visit, even if the site itself uses HTTPS.

Encrypted DNS solves this by wrapping your queries in a layer of encryption. This prevents eavesdropping, tampering, and censorship of your DNS traffic. It is one of the simplest and most impactful steps you can take to improve your online privacy.

---

## Understanding the Protocols

### DNS-over-HTTPS (DoH)

DoH sends DNS queries inside standard HTTPS requests on port 443. Because it uses the same port as regular web traffic, it blends in and is very difficult to block or detect. This makes it the best option in restrictive network environments. Most modern browsers support it natively.

### DNS-over-TLS (DoT)

DoT encrypts DNS queries using TLS on a dedicated port, 853. It provides the same encryption strength as DoH but uses a distinct port, which makes it easier for network administrators to identify and manage. Android has built-in support for DoT under the name "Private DNS."

### Protocol Comparison

<table class="guide-table">
  <thead>
    <tr><th>Feature</th><th>DoH</th><th>DoT</th></tr>
  </thead>
  <tbody>
    <tr><td>Port</td><td>443 (HTTPS)</td><td>853 (dedicated)</td></tr>
    <tr><td>Transport</td><td>HTTPS / HTTP/2</td><td>TLS over TCP</td></tr>
    <tr><td>Blockable?</td><td>Very difficult</td><td>Moderate (port 853)</td></tr>
    <tr><td>Browser support</td><td>Chrome, Firefox, Edge, Brave</td><td>Limited</td></tr>
    <tr><td>OS support</td><td>Windows 11, macOS, iOS, Android</td><td>Android (Private DNS), Linux</td></tr>
    <tr><td>Best for</td><td>Censorship resistance, browsers</td><td>System-wide on Android, routers</td></tr>
  </tbody>
</table>

---

## StormyCloud DNS Server Details

StormyCloud operates high-performance, zero-logging DNS resolvers with DNSSEC validation. Our servers provide unfiltered access and support both IPv4 and IPv6. Use the following addresses throughout this guide.

<table class="guide-table">
  <thead>
    <tr><th>Protocol</th><th>Address</th></tr>
  </thead>
  <tbody>
    <tr><td>DNS (UDP/TCP)</td><td><code>23.128.248.2</code> and <code>23.128.248.4</code></td></tr>
    <tr><td>DNS IPv6</td><td><code>2602:FC05::2</code> and <code>2602:FC05::4</code></td></tr>
    <tr><td>DNS-over-HTTPS</td><td><code>https://dns.stormycloud.org/dns-query</code></td></tr>
    <tr><td>DNS-over-TLS</td><td><code>dns.stormycloud.org</code> (port 853)</td></tr>
  </tbody>
</table>

<div class="guide-callout guide-callout--info">

**Note:** StormyCloud does not log your queries. We operate as a 501(c)(3) nonprofit with a mission to provide privacy tools for unrestricted internet access.

</div>

---

## Windows

### Windows 11 (DoH, built-in)

Windows 11 supports DoH natively. No additional software is needed.

1. Open **Settings** and navigate to **Network & internet**.

![Windows 11 Settings — Network & internet](/images/encdns_01.png)

2. Select your active connection (Wi-Fi or Ethernet).

![Network & internet — select Ethernet](/images/encdns_02.png)

3. Next to **DNS server assignment**, click **Edit**.

![DNS server assignment — click Edit](/images/encdns_03.png)

4. Select **Manual** from the dropdown.
5. Enable **IPv4** and set the **Preferred DNS** to `23.128.248.2`.
6. Set **Alternate DNS** to `23.128.248.4`.
7. Under **Preferred DNS**, set **DNS over HTTPS** to **On (manual template)** and enter `https://dns.stormycloud.org/dns-query` as the DoH template.
8. If you use IPv6, enable it and enter `2602:FC05::2` and `2602:FC05::4`.

![Edit DNS settings — manual DoH configuration](/images/encdns_04.png)

9. Click **Save**.

### Windows 10

Windows 10 does not support DoH natively in the Settings UI. You have two options: configure DoH in your browser (see the [Browser Configuration](#browser-configuration) section below) or use a local proxy tool such as dnscrypt-proxy or YogaDNS.

---

## macOS

### Using a DNS Profile (DoH)

macOS supports encrypted DNS through configuration profiles. You can create one manually or use a profile generator.

1. Download or create a `.mobileconfig` profile that specifies DoH with the URL `https://dns.stormycloud.org/dns-query`.
2. Double-click the `.mobileconfig` file to open it.
3. Open **System Settings**, then navigate to **Privacy & Security** and select **Profiles**.

![macOS Device Management — DNS profile downloaded](/images/encdns_05.png)

4. Select the StormyCloud DNS profile and click **Install**.

![macOS — click Install on the DNS profile](/images/encdns_06.png)

5. Enter your password when prompted.

<div class="guide-callout guide-callout--tip">

**Tip:** You can generate a DNS profile at [dns.notjakob.com/tool.html](https://dns.notjakob.com/tool.html) or similar profile generator sites. Select DoH, enter `https://dns.stormycloud.org/dns-query`, and download the profile.

</div>

### Manual Configuration (Unencrypted Fallback)

If you do not wish to use a profile, you can set the DNS servers manually in System Settings under Network. Note that this uses traditional unencrypted DNS on port 53, not DoH or DoT.

1. Open **System Settings** and click **Network**.

![macOS System Settings — Network](/images/encdns_07.png)

2. Select your active connection and click **Details**.
3. Click **DNS** on the left sidebar.
4. Remove existing DNS servers and add `23.128.248.2` and `23.128.248.4`.

![macOS DNS settings — StormyCloud servers configured](/images/encdns_08.png)

5. Click **OK** and then **Apply**.

---

## Linux

### systemd-resolved (DoT)

Most modern Linux distributions ship with systemd-resolved, which supports DNS-over-TLS.

**Step 1: Edit the resolved configuration**

Open `/etc/systemd/resolved.conf` in your preferred text editor and set the following:

```ini
[Resolve]
DNS=23.128.248.2#dns.stormycloud.org 23.128.248.4#dns.stormycloud.org
DNSOverTLS=yes
```

**Step 2: Restart the service**

```bash
sudo systemctl restart systemd-resolved
```

**Step 3: Verify the configuration**

```bash
resolvectl status
```

You should see `dns.stormycloud.org` listed with `DNSOverTLS` shown as `yes`.

### Using dnscrypt-proxy (DoH)

dnscrypt-proxy is a flexible DNS proxy that supports DoH, DNSCrypt, and more. It works on any Linux distribution.

**Step 1: Install dnscrypt-proxy**

Install from your package manager or download it from [github.com/DNSCrypt/dnscrypt-proxy](https://github.com/DNSCrypt/dnscrypt-proxy).

**Step 2: Edit the configuration**

Edit the configuration file, typically at `/etc/dnscrypt-proxy/dnscrypt-proxy.toml`:

```toml
listen_addresses = ['127.0.0.1:53']
server_names = ['stormycloud']

[static.'stormycloud']
stamp = 'sdns://AgcAAAAAAAAADjIzLjEyOC4yNDguMgATZG5zLnN0b3JteWNsb3VkLm9yZwovZG5zLXF1ZXJ5'
```

<div class="guide-callout guide-callout--info">

**Note:** The DNS stamp above encodes StormyCloud's DoH endpoint. You can generate or verify stamps at [dnscrypt.info/stamps](https://dnscrypt.info/stamps).

</div>

**Step 3: Point your system DNS to the local proxy**

Set your system DNS to `127.0.0.1` (via `/etc/resolv.conf`, NetworkManager, or systemd-resolved).

**Step 4: Start the service**

```bash
sudo systemctl enable --now dnscrypt-proxy
```

---

## Android

### Private DNS (DoT) — Android 9+

Android 9 and later include a built-in Private DNS feature that uses DNS-over-TLS.

1. Open **Settings** and navigate to **Network & internet** (or **Connections**).
2. Tap **Private DNS** (may be under **Advanced** or **More connection settings**).
3. Select **Private DNS provider hostname**.
4. Enter `dns.stormycloud.org` and tap **Save**.

This applies system-wide, including all apps and browsers.

<div class="guide-callout guide-callout--tip">

**Tip:** On Samsung devices, go to **Settings** > **Connections** > **More connection settings** > **Private DNS**.

</div>

---

## iOS / iPadOS

### Using a DNS Profile (DoH)

Like macOS, iOS supports encrypted DNS via configuration profiles.

1. On your iPhone or iPad, visit a DNS profile generator (such as [dns.notjakob.com/tool.html](https://dns.notjakob.com/tool.html)) in Safari.
2. Select DoH and enter `https://dns.stormycloud.org/dns-query` as the server URL.
3. Download the generated profile.
4. Open **Settings**. A **"Profile Downloaded"** prompt should appear near the top. Tap it.
5. Tap **Install**, enter your passcode, and confirm.

The profile applies system-wide. To remove it later, go to **Settings** > **General** > **VPN & Device Management**.

---

## Browser Configuration

Configuring DoH in your browser encrypts DNS queries made by that browser only. This is useful on systems where you cannot change the system-wide DNS (such as a work computer) or as an additional layer on top of system DNS.

### Mozilla Firefox

1. Open Firefox **Settings** (`about:preferences`).
2. Scroll down to the **Privacy & Security** section.
3. Find **DNS over HTTPS** and select **Max Protection**.
4. In the provider dropdown, select **Custom**.
5. Enter `https://dns.stormycloud.org/dns-query` and close the settings tab.

![Firefox — DNS over HTTPS with Max Protection](/images/encdns_09.png)

### Google Chrome / Brave / Edge

1. Open browser **Settings**.
2. Navigate to **Privacy and security** > **Security**.
3. Under **Advanced**, find **Use secure DNS**.
4. Toggle it on and select **With: Custom**.
5. Enter `https://dns.stormycloud.org/dns-query`.

![Chrome — Use secure DNS with custom provider](/images/encdns_10.png)

---

## Router-Level Configuration

Configuring encrypted DNS on your router protects every device on your network without needing per-device setup.

### Standard DNS (All Routers)

Every router supports setting custom DNS servers. This uses unencrypted DNS on port 53 but still points your queries to StormyCloud instead of your ISP.

1. Log into your router's admin panel (commonly `192.168.1.1` or `192.168.0.1`).
2. Find the **DNS** or **DHCP** settings.
3. Set **Primary DNS** to `23.128.248.2` and **Secondary DNS** to `23.128.248.4`.
4. Save and reboot the router.

### DoH/DoT on Supported Routers

Some routers and firmware (OpenWrt, pfSense, OPNsense, Asus with Merlin firmware, Keenetic) support DoH or DoT natively. Consult your router's documentation for encrypted DNS settings and use the StormyCloud endpoints listed in the [server details](#stormycloud-dns-server-details) table above.

---

## Verifying Your Configuration

After setting up encrypted DNS, verify that your queries are going to StormyCloud and are encrypted.

### DNS Leak Test

1. Visit [dnsleaktest.com](https://dnsleaktest.com) or [browserleaks.com/dns](https://browserleaks.com/dns) in your browser.
2. Run the **extended test**.
3. The results should show StormyCloud IP addresses (`23.128.248.x`) as your DNS servers.
4. If you see your ISP's DNS servers, your configuration is not active. Double-check the steps for your platform.

### Command Line Verification

**Linux / macOS:**

```bash
dig @23.128.248.2 example.com
```

For DoH specifically, you can test with curl:

```bash
curl -s -H 'accept: application/dns-json' \
  'https://dns.stormycloud.org/dns-query?name=example.com&type=A'
```

**Windows (PowerShell):**

```powershell
Resolve-DnsName -Name example.com -Server 23.128.248.2
```

---

## Troubleshooting

<table class="guide-table">
  <thead>
    <tr><th>Problem</th><th>Solution</th></tr>
  </thead>
  <tbody>
    <tr><td>Pages load slowly after switching</td><td>Your old DNS cache may be stale. Flush it: Windows (<code>ipconfig /flushdns</code>), macOS (<code>sudo dscacheutil -flushcache</code>), Linux (<code>resolvectl flush-caches</code>).</td></tr>
    <tr><td>Some sites do not load</td><td>Verify the DNS server addresses are entered correctly. Try switching between DoH and DoT to rule out port blocking on your network.</td></tr>
    <tr><td>DoT blocked on your network</td><td>Port 853 is sometimes blocked by corporate or public networks. Switch to DoH instead, which uses port 443 and is much harder to block.</td></tr>
    <tr><td>Android Private DNS says "Cannot connect"</td><td>Check for typos in the hostname. It must be <code>dns.stormycloud.org</code> with no <code>https://</code> prefix and no port number.</td></tr>
    <tr><td>Browser DoH not working</td><td>Make sure no browser extension or VPN is overriding your DNS settings. Disable other DNS-related extensions and test again.</td></tr>
  </tbody>
</table>

---

## Why StormyCloud?

- **Zero logging:** We do not record your queries or IP address.
- **Nonprofit:** StormyCloud is a 501(c)(3) organization. We have no financial incentive to monetize your data.
- **Unfiltered:** We do not block or censor any domains.
- **DNSSEC validation:** Responses are verified to prevent spoofing and tampering.
- **IPv4 and IPv6:** Full dual-stack support.
- **High performance:** Our resolvers are built for speed with large response caches.

For more information, visit [stormycloud.org](https://stormycloud.org) or join our community on Discord.
