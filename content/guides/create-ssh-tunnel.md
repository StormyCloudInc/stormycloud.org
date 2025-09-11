---
title: "SSH Tunnel Creation Guide"
description: "Learn how to create an SSH Tunnel with the step-by-step guide from StormyCloud Inc, a non-profit organization dedicated to Internet freedom."
url: /create-ssh-tunnel/
layout: install-i2p
image: "images/imagelogo.png" #used in og:meta image
bodyId: createssh
page_content:
  h1_Heading: "How to create an SSH Tunnel"
  header_image: images/sshtunnel.webp
  sections:
    - type: heading2
      text: "What is an SSH Tunnel?"
    - type: paragraph
      text: |
        An SSH tunnel is a method of routing data and information securely over an encrypted SSH (Secure Shell) connection. Imagine it as a secure pipeline through the internet where data can travel safely, away from prying eyes. It's like sending a letter in a sealed, tamper-proof envelope instead of a postcard. SSH tunneling is often used to securely access remote systems, like a server, by creating this protected passageway for data transmission. The tunnel encrypts the data to keep it safe from interception, and only the intended recipient can decrypt and use it.
    - type: heading3
      text: Creating SSH Tunnel on Windows
    - type: paragraph
      text: |
        For those utilizing a Windows operating system, we suggest employing <a target="_blank" href="https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html">Putty</a>, a widely recognized tool, to manage your SSH sessions effectively.
    - type: paragraph
      text: | 
        Step 1 - Open Putty and enter the IP or Host Name for the remote server.
    - type: image
      src: "/images/sshtunnel_1.webp"
      alt: "Create SSH Tunnel"
    - type: paragraph
      text: Step 2 - Expand the SSH tab and click on Tunnels.
    - type: paragraph
      text: In the Source port is a local port we can select, this number can be anything from 1-65535 as long as   its not being used by anything else.
    - type: paragraph
      text: "In the Destination type in:"
    - type: code
      title: ""
      content: 127.0.0.1:7657

    - type: list
      title: ""
      items:
        - "127.0.0.1: This is the IP for the localhost running on the remote server, this is also the destination we aim to reach via the SSH server."
        - "7657 - This is the destination port, assigned to the I2P console."
    - type: image
      src: "/images/sshtunnel_2.webp"
      alt: "Create SSH Tunnel"

    - type: paragraph
      text: Step 3 - Click on Open and type in your username and password. If successful you will see the screen below.
    - type: image
      src: "/images/sshtunnel_3.webp"
      alt: "Create SSH Tunnel"

    - type: heading3
      text: Configuring SSH Tunnel on Linux
    - type: paragraph
      text: | 
        Step 1 - To create an SSH tunnel on Linux open the terminal.
    - type: image
      src: "/images/sshtunnel_4.webp"
      alt: "Create SSH Tunnel"
    - type: paragraph
      text: Step 2 - Enter the following command into the terminal
    - type: code
      title: ""
      content: ssh -L 7657:127.0.0.1:7657 i2p@20.228.143.58
    - type: list
      title: ""
      items:
        - "7657 - This is the local port we can select, this number can be anything from 1-65535 as long as its not being used by anything else."
        - "127.0.0.1: This is the IP for the localhost running on the remote server, this is also the destination we aim to reach via the SSH server."
        - 7657 - This is the destination port, assigned to the I2P console.
        - i2p - This is the username used to log into the remote server. This should be different for everyone.
        - 20.228.143.58 - This is the IP of the remote server that I2P is installed on.
    - type: heading3
      text: Creating SSH Tunnel on Mac
    - type: paragraph
      text: Step 1 - To create an SSH tunnel on Mac open the terminal.
    - type: image
      src: "/images/sshtunnel_5.webp"
      alt: "Create SSH Tunnel"
    - type: paragraph
      text: Step 2 - Enter the following command into the terminal
    - type: code
      title: ""
      content: ssh -L 7657:127.0.0.1:7657 i2p@20.228.143.58
    - type: list
      title: ""
      items:
        - "7657 - This is the local port we can select, this number can be anything from 1-65535 as long as its not being used by anything else."
        - "127.0.0.1: This is the IP for the localhost running on the remote server, this is also the destination we aim to reach via the SSH server."
        - 7657 - This is the destination port, assigned to the I2P console.
        - i2p - This is the username used to log into the remote server. This should be different for everyone.
        - 20.228.143.58 - This is the IP of the remote server that I2P is installed on.
---
