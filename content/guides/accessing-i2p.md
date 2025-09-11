---
title: "Accessing I2P Network & Applications"
description: "Learn how to access the I2P Network and Applications with StormyCloud Inc's comprehensive guide. Protect your digital privacy now."
keywords: I2P Network, digital privacy, StormyCloud Inc, secure browsing, anonymous internet, privacy tools, internet security
url: /accessing-i2p/
layout: install-i2p
image: "images/imagelogo.png" #used in og:meta image
bodyId: accessi2p
page_content:
  h1_Heading: "Accessing I2P Network & Application's"
  header_image: images/accessi2p.webp
  sections:
    - type: paragraph
      text: ""
    - type: paragraph
      text: |
        I2P, unlike the Tor Network, does not come with a dedicated browser. To access I2P, it's necessary to both establish a connection to the I2P network and adjust your browser's proxy settings. This configuration will ensure seamless access to the I2P platform.
    - type: paragraph
      text: |
        To effectively navigate the I2P network, it's essential to establish a connection with the HTTP proxy. By default, this connection is configured to port 4444. Please refer to our How to Create an SSH Tunnel guide and replace port 7657 with 4444 in the instructions. Upon establishing a successful connection, proceed with one of the following guides for further steps.
    - type: heading3
      text: Configuring Safari
    - type: paragraph
      text: | 
        Step 1 - In the Safari app on your Mac, choose Safari > Settings, then click Advanced.
    - type: image
      src: "/images/accessi2p_1.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: | 
        Step 2 - Click on Change Settings
    - type: paragraph
      text: | 
        Step 3 - Enable Web proxy (HTTP) and enter 127.0.0.1 for the server and 4444 for the port.
    - type: image
      src: "/images/accessi2p_2.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: | 
        Start to browse the I2P network!
    - type: heading3
      text: Configuring FireFox
    - type: paragraph
      text: | 
        Step 1 - In the Firefox application, open the setting's option.
    - type: image
      src: "/images/accessi2p_3.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: | 
        Step 2 - Type in proxy in the search bar and click on Settings.
    - type: image
      src: "/images/accessi2p_4.png"
      alt: "Accessing I2P"

    - type: paragraph
      text: | 
        Step 3 - Select Manual proxy configuration in the HTTP Proxy selection type in 127.0.0.1 and for the Port type in 4444.
    - type: image
      src: "/images/accessi2p_5.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: | 
        Step 4 - Click on OK and start to browse the I2P Network!
    - type: heading3
      text: Configuring Chrome
    - type: paragraph
      text: Step 1 - Open Settings
    - type: image
      src: "/images/accessi2p_6.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: Step 2 - Search for proxy and select Open your computer's proxy settings.
    - type: image
      src: "/images/accessi2p_7.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: Step 3 - Under Manual proxy setup click on Set up.
    - type: image
      src: "/images/accessi2p_8.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: Step 4 - Turn Use a proxy server on, and under the Proxy IP address type in 127.0.0.1 under Port type in 4444. Click on Save.
    - type: image
      src: "/images/accessi2p_9.png"
      alt: "Accessing I2P"
    - type: paragraph
      text: Step 5 - Start to browse the I2P Network!
    - type: heading3
      text: I2P Application's
    - type: heading4
      text: BitTorrent
    - type: paragraph
      text: Did you know that I2P, the anonymous network layer, comes with its own built-in BitTorrent client and network? This means you can share and download files within the I2P network, all while maintaining your privacy. It's an integrated solution that combines the power of BitTorrent with the anonymity of I2P.
    - type: paragraph
      text: To access the I2P client visit the below URL once you are connected to the I2P network.
    - type: code
      title: ""
      content: http://127.0.0.1:7657/torrents
    - type: image
      src: "/images/accessi2p_10.png"
      alt: "Accessing I2P"   
    - type: paragraph
      text: It's important to note that the BitTorrent client in I2P operates exclusively within the I2P network. This means that you can only download torrents that have been uploaded within the I2P network itself. Torrent files from external sources, like The Pirate Bay, are not compatible with this system. This design ensures that all torrenting activity is contained within the secure, anonymous environment of I2P.
    - type: paragraph
      text: I2P isn't just a network, it's an ecosystem. It has its own torrent tracker which is used to manage torrent file uploads and downloads within the I2P network. This tracker acts as a centralized hub where users can search for and download torrents that have been uploaded by others in the network. So, everything you need to share and download files is contained within the secure, anonymous environment of I2P. Remember, this tracker only handles torrents within the I2P network, maintaining the network's privacy and security standards.
    - type: code
      title: ""
      content: http://tracker2.postman.i2p/
    - type: image
      src: "/images/accessi2p_11.png"
      alt: "Accessing I2P"   
    - type: heading4
      text: I2P Forum
    - type: paragraph
      text: I2P fosters a vibrant community through its own dedicated forum. This provides a safe and anonymous platform for users to communicate, share insights, ask questions, and engage in discussions with fellow I2P members. It's a great resource for new users to learn more about the network, or for seasoned users to keep up with the latest developments and help others navigate the world of I2P. As always, this forum operates within the privacy and security standards set by the I2P network.
    - type: code
      title: ""
      content: http://i2pforum.i2p/
    - type: heading4
      text: I2P "Reddit"
    - type: paragraph
      text: I2P includes a platform known as 'Rambler', which is a lot like Reddit. On Rambler, users can post stories, ask questions, share pictures, and contribute in many more ways. The platform features a voting system, allowing users to upvote or downvote content, shaping what becomes most visible in the community. Additionally, a comment system is in place for discussions, enabling users to engage in dialogue about the posts. This all happens within the secure and private environment of the I2P network, ensuring the privacy and anonymity of its users.
    - type: code
      title: ""
      content: http://ramble.i2p
    - type: image
      src: "/images/accessi2p_12.png"
      alt: "Accessing I2P"   
    - type: heading4
      text: I2P IRC
    - type: paragraph
      text: II2P has its own IRC ecosystem with hundreds of channel's full of active I2P users. We have setup a public I2P IRC server that you can connect to and chat on the I2P IRC servers.
    - type: paragraph
      text: <a href="https://i2p-irc.stormycloud.org/">Access IRC Server</a>

---
