---
title: "Install I2P+ on Windows"
description: "Step-by-step instructions for installing and configuring an I2P+ node on Windows."
tag: "Windows"
image: "/images/installi2ppluswindows.webp"
weight: 2
---

This guide provides step-by-step instructions for installing and configuring an I2P node on Windows.

## Requirements

- Java (JRE)
- For optimal performance and to effectively assist the I2P network, it is recommended to have a 24/7 internet connection.

## Step 1

We will need to install Java (JRE); if you already have this installed, skip to Step 2. Java can be downloaded from [java.com](https://www.java.com/en/download/manual.jsp).

## Step 2

Download the I2P+ package from the [I2P+ GitHub Repo](https://i2pplus.github.io/).

**Note:** At the time of writing, 2.6.0 was the latest release. Check [i2pplus.github.io](https://i2pplus.github.io/) for the latest version.

## Step 3

Launch the installer package as Administrator and accept the Windows UAC prompts. If you have Windows Defender running you will also need to allow the application through SmartScreen.

![Installation of I2P+ on Windows](/images/wininstall_01.png)

Click on Next.

![Installation of I2P+ on Windows](/images/wininstall_02.png)

## Step 4

These options cannot be changed, just click on Next.

![Installation of I2P+ on Windows](/images/wininstall_03.png)

## Step 5

You can leave the default installation path alone or modify as required. Click on Next when a location has been selected.

![Installation of I2P+ on Windows](/images/wininstall_04.png)

## Step 6

You will be prompted to create the I2P installation folder.

![Installation of I2P+ on Windows](/images/wininstall_05.png)

## Step 7

Unless you need to install I2P+ for only a certain user, the default selections can be left and you can click on Next.

![Installation of I2P+ on Windows](/images/wininstall_06.png)

## Step 8

When the installation is finished you can click on Next which will close out the installation package.

![Installation of I2P+ on Windows](/images/wininstall_07.png)

## Step 9

I2P+ starts automatically, but if it does not you can start I2P+ either through the Application List or through the Windows Services Panel.

![Installation of I2P+ on Windows](/images/wininstall_08.png)

To launch the Windows Services Panel, hold the Windows Key and press R. In the run box type `services.msc` and hit OK. Find "I2P+ Anonymizing Network" and ensure that it is Running.

![I2P Windows Service](/images/wininstall_09.png)

## Step 10

To launch the I2P+ Router Console you can either use the Application List or open a browser and navigate directly to `http://127.0.0.1:7657`

![I2P Router Console](/images/wininstall_10.png)

Congratulations, you have successfully configured an I2P node. New nodes can take some time to integrate with the network, so not all I2P websites and applications will work straight away. Learn more about [Accessing I2P Network & Applications](/guides/accessing-i2p).

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

### Opening Firewall

While I2P will work fine behind most firewalls, your speeds and network integration will generally improve if the I2P port is forwarded for both UDP and TCP.

You can visit [PortForward.com](https://portforward.com/router.htm) to get instructions for your specific router model.

### Allow Java through Windows Firewall

Open PowerShell as Administrator and run the command below.

```powershell
$javaPath = (Get-Command java.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source); if ($javaPath) { New-NetFirewallRule -Program $javaPath -Action Allow -Profile Domain,Private,Public -DisplayName "Allow Java" } else { Write-Output "java.exe not found in PATH." }
```

By default I2P+ picks a random port. Visit your [Router Console Network Configuration](https://127.0.0.1:7667/confignet) page to see your UDP & TCP port which you will need to forward.

![Network config for port forwarding](/images/postconfig_08.png)
