---
title: "Install I2P Plus on Linux - Full Guide"
description: "Follow StormyCloud Inc's guide to easily install I2P plus on Linux. Protect your digital privacy and uphold Internet freedom with I2P installation."
url: /install-i2p/
layout: install-i2p
image: "images/imagelogo.png" #used in og:meta image
bodyId: installlinux
page_content:
  h1_Heading: "Install I2P+ on Linux"
  header_image: images/installi2p.webp
  sections:
    - type: heading2
      text: "Setting up Linux I2P+ Node"

    - type: paragraph
      text: |
        This guide provides step-by-step instructions for installing and configuring an I2P node on Debian-based systems. Although the commands mentioned here are specific to Debian, most Linux distributions support I2P.

    - type: list
      title: "Requirements"
      items:
        - "Memory: By default, I2P only requires 128MB of memory. However, we recommend a minimum of 1GB and suggest 2GB for optimal performance."
        - "CPU: I2P has been tested and works on a wide range of systems, from single-board CPUs to enterprise-grade CPUs. The minimum requirement is 1 core, but we recommend at least 2 cores for better performance."
        - "For optimal performance and to effectively assist the I2P network, it is recommended to have a 24/7 internet connection."

    - type: paragraph
      text: "Step 1 - To ensure a smooth installation process, it is important to fetch the necessary prerequisites and update your server."

    - type: code
      title: ""
      content: |
        sudo apt update && sudo apt upgrade -y && sudo apt install default-jdk wget -y

    - type: image
      src: "/images/installi2p_1.png"
      alt: "Installation of I2P"

    - type: paragraph
      text: "Step 2 - To maintain optimal security and system integrity, it is not recommended to run I2P as a root user. Therefore, we will be initiating a new user profile specifically to operate the I2P-router."

    - type: code
      title: ""
      content: |
        sudo adduser i2p && sudo usermod -aG sudo i2p

    - type: image
      src: "/images/installi2p_2.png"
      alt: "Create i2p user"

    - type: paragraph
      text: "Step 3 - Moving forward, let's transition to the recently created user profile and proceed with retrieving the necessary I2P software components."

    - type: code
      title: ""
      content: |
        Note: At the time of writing this, 2.6.0 was the latest release, so our URLs in the examples reflect that. To check for the latest releases, view and amend the instructions as needed below.
        https://i2pplus.github.io/
        
        su i2p
        mkdir /home/i2p/i2p
        cd /home/i2p/i2p/
        wget http://i2pplus.github.io/installers/i2pinstall_2.6.0+.exe

    - type: image
      src: "/images/installi2p_3.png"
      alt: "Download I2P installer"

    - type: paragraph
      text: "Step 4 - After download, execute the headless Java installer for a quick, terminal-based setup. If your language of choice is english you can leave all settings as default."

    - type: code
      title: ""
      content: |
        java -jar i2pinstall_2.6.0+.exe -console


    - type: image
      src: "/images/installi2p_4.png"
      alt: "I2P Installation Step"

    - type: paragraph
      text: "Step 5 - It's crucial to ensure that I2P initiates automatically upon server reboot, guaranteeing continuous functionality."

    - type: code
      title: ""
      content: |
        sudo echo '/bin/su i2p -c "/home/i2p/i2p/i2prouter start"' | sudo tee -a /etc/rc.local && sudo chmod +x /etc/rc.local

    - type: image
      src: "/images/installi2p_5.png"
      alt: "Enable I2P autostart"

    - type: paragraph
      text: "Step 6 - We need to start I2P."

    - type: code
      title: ""
      content: |
        ./i2prouter start

    - type: image
      src: "/images/installi2p_6.png"
      alt: "Start I2P Router"

    - type: paragraph
      text: |
        The next step will depend on your system configuration. If you have a desktop environment installation please skip to Post Installation Instructions. If your server is remote please skip to [How to create SSH Tunnel](/create-ssh-tunnel).

    - type: paragraph
      text: |
        Step 7 - Congratulations you have successfully configured an I2P node. New nodes can take some time to integrate with the network. So not all I2P websites & application will work straight away and can take some time for the router to be intergrated into the I2P Network. Learn more about accessing the  [Accessing I2P Network & Applications](/accessing-i2p).

    - type: heading4
      text: "Post-Install Configuration (optional)"

    - type: paragraph
      text: |
        While the default I2P+ will work with no changes, there are several modifications that we can make to improve the experience and performance.

    - type: heading4
      text: "Enabling automatic updates"

    - type: paragraph
      text: "Step 1 - Navigate to the [Router Console Update Page](https://127.0.0.1:7667/configupdate)"

    - type: paragraph
      text: "Step 2 - Change the Update policy to Download,verify, and restart, then click on Save."

    - type: image
      src: "/images/postconfig_01.png"
      alt: "Enable automatic updates"

    - type: paragraph
      text: "To reload the settings, you will need to restart your router. Click on the restart symbol in the bottom left."

    - type: image
      src: "/images/postconfig_02.png"
      alt: "Restart after updates"

    - type: heading4
      text: "Configure Bandwidth Settings"

    - type: paragraph
      text: |
        I2P+ will work best if you configure your rates to match the speed of your internet connection.

    - type: paragraph
      text: |
        Step 1 - Navigate to the [Router Console Bandwidth Configuration](https://127.0.0.1:7667/config)

    - type: image
      src: "/images/postconfig_03.png"
      alt: "Bandwidth settings"

    - type: paragraph
      text: "Step 2 - After entering your Download, Upload, and Network share percentage hit the Save Changes button."

    - type: code
      title: ""
      content: |
        Your contribution to the network (network share) is determined by the allocation of upstream bandwidth (upload speed).  The maximum data transfer values indicate the theoretical maximum, and in practice will normally be much lower.

    - type: heading4
      text: "Opening Firewall"

    - type: paragraph
      text: |
        While I2P will work fine behind most firewalls, your speeds and network integration will generally improve if the I2P port is forwarded for both UDP and TCP.

        We are unable to write a step by step guide to opening ports on a firewall as there are hundreds of different models each having their own settings. What we can do is provide some helpful links and guides to help accomplish this task.

        You can visit [PortForward.com](https://portforward.com/router.htm) to get instructions for your specific router model.

        By default I2P+ picks a random port, visit your [Router Console Network Configuration](https://127.0.0.1:7667/confignet)  page. You will see your UDP & TCP port which you will need to forward.


    - type: image
      src: "/images/postconfig_08.png"
      alt: "Network config for port forwarding"

---
