---
title: "Install I2P Plus on Windows- Full Guide"
description: "Follow StormyCloud Inc's guide to easily install I2P plus on Windows. Protect your digital privacy and uphold Internet freedom with I2P installation."
url: /install-i2p-windows/
layout: install-i2p
image: "images/imagelogo.png" #used in og:meta image
bodyId: installwindows
page_content:
  h1_Heading: "Install I2P+ on Windows"
  header_image: images/installi2p.webp
  sections:
    - type: heading2
      text: "Setting up Windows I2P+ Node"

    - type: paragraph
      text: |
        This guide provides step-by-step instructions for installing and configuring an I2P node on Windows.

    - type: list
      title: "Requirements"
      items:
        - "Java (JRE)"
        - "For optimal performance and to effectively assist the I2P network, it is recommended to have a 24/7 internet connection."

    - type: paragraph
      text: | 
        Step 1 - We will need to **install Java** (JRE); if you already have this installed, step to skip 2. Java can be downloaded from <a title="Java Download" target="_blank" href="https://www.java.com/en/download/manual.jsp">java.com</a>

    - type: paragraph
      text: | 
        Step 2 - To start we need to download the I2P+ package. We are able to download the installation directly from the <a title="I2P+ Download" target="_blank" href="https://i2pplus.github.io/installers/i2pinstall_2.6.0+.exe"> I2P+ Github Repo </a>

    - type: code
      title: ""
      content: |
        Note: At the time of writing this, 2.6.0 was the latest release, so our URLs in the examples reflect that. To check for the latest releases, view and amend the instructions as needed below.
        https://i2pplus.github.io/

    - type: paragraph
      text: "Step 3 - Launch the installer package as Administrator and accept the Windows UNC Prompts. If you have Windows defender running you will also need to allow the application through their smart screen tool."

    - type: image
      src: "/images/wininstall_01.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 3 - Click on Next.
    
    - type: image
      src: "/images/wininstall_02.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 4 - These options can not be changed just click on Next.
    
    - type: image
      src: "/images/wininstall_03.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 5 - You can leave the default installation path alone or modify as required. Click on Next when a location as been selected.

    - type: image
      src: "/images/wininstall_04.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 6 - You will be prompted to create the I2P installation folder.

    - type: image
      src: "/images/wininstall_05.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 7 - Unless you need to install I2P+ for only a certain user the default selections can be left and you can click on Next.

    - type: image
      src: "/images/wininstall_06.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 8 - When the installation is finished you can click on Next which will close out the installation package.

    - type: image
      src: "/images/wininstall_07.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 9a - I2P+ Starts automatically, but if it does not you can start I2P+ either through the Application List or through the Windows Services Panel.

    - type: image
      src: "/images/wininstall_08.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 9b - To Launch the Windows Services Panel, Hold the Windows Key and Hit R at the same time. In the run box type in services.msc and hit Okay.
    - type: paragraph
      text: You will want to find "I2P+ Anonymizing Network" and ensure that it is Running.

    - type: image
      src: "/images/wininstall_09.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: Step 10 - To Launch the I2P+ Router Console you can either us the Application List or open a browser and navigate directly to http://127.0.0.1:7657

    - type: image
      src: "/images/wininstall_10.png"
      alt: "Installation of I2P+ on Windows"

    - type: paragraph
      text: |
        Congratulations you have successfully configured an I2P node. New nodes can take some time to integrate with the network. So not all I2P websites & application will work straight away and can take some time for the router to be intergrated into the I2P Network. Learn more about accessing the <a title="Accessing I2p" href="../accessing-i2p">I2P Network &amp; Applications.</a>
    - type: heading4
      text: Post-Install Configuration (optional)
    - type: paragraph
      text: While the default I2P+ will work with no changes, there are several modifications that we can make to improve the experience and performance.
    - type: paragraph
      text: Enabling automatic updates

    - type: paragraph
      text: Step 1.- Navigate to the <a title="Router Consoles Update Page" target="_blank" href="https://127.0.0.1:7667/configupdate">Router Console Update Page</a>
    - type: paragraph
      text: Step 2 - Change the Update policy to Download,verify, and restart, then click on Save.

    - type: image
      src: "/images/postconfig_01.png"
      alt: "Installation of I2P+ on Windows"
    - type: paragraph
      text: Step 3 - To reload the settings, you will need to restart your router. Click on the restart symbol in the bottom left.
    - type: image
      src: "/images/postconfig_02.png"
      alt: "Installation of I2P+ on Windows"

    - type: heading4
      text: Confuring Bandwidth Settings
    - type: paragraph
      text: I2P+ will work best if you configure your rates to match the speed of your internet connection.
    - type: paragraph
      text: Step 1.- Navigate to the <a title="Router Console Config" target="_blank" href="https://127.0.0.1:7667/config">Router Console Bandwidth Configuration</a>
    - type: image
      src: "/images/postconfig_03.png"
      alt: "Installation of I2P+ on Windows"
    - type: paragraph
      text: Step 2 - After entering your Download, Upload, and Network share percentage hit the Save Changes button.
    - type: paragraph
      text: The rest of the wizard can be skipped by either clicking Skip Setup or closing out of the browser tab.
    - type: code
      title: ""
      content: |
        Your contribution to the network (network share) is determined by the allocation of upstream bandwidth (upload speed).  The maximum data transfer values indicate the theoretical maximum, and in practice will normally be much lower.
    
    - type: heading4
      text: Opening Firewall
    - type: paragraph
      text: While I2P will work fine behind most firewalls, your speeds and network integration will generally improve if the I2P port is forwarded for both UDP and TCP.
    - type: paragraph
      text: We are unable to write a step by step guide to opening ports on a firewall as there are hundreds of different models each having their own settings. What we can do is provide some helpful links and guides to help accomplish this task.
    - type: paragraph
      text: You can visit <a title="portforward" target="_blank" href="https://portforward.com/router.htm">PortForward.com</a> to get instructions for your specific router model.
    - type: paragraph
      text: Allow Java through Windows Firewall
    - type: paragraph
      text: Open PowerShell as Administrator and run the command below.

    - type: code
      title: ""
      content: |
        $javaPath = (Get-Command java.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source); if ($javaPath) { New-NetFirewallRule -Program $javaPath -Action Allow -Profile Domain,Private,Public -DisplayName "Allow Java" } else { Write-Output "java.exe not found in PATH." }
    - type: paragraph
      text: By default I2P+ picks a random port, visit your <a title="I2P Router Console Network" target="_blank" href="https://127.0.0.1:7667/confignet">Router Console Network Configuration</a> page. You will see your UDP &amp; TCP port which you will need to forward.

    - type: image
      src: "/images/postconfig_08.png"
      alt: "Create i2p user"
---
