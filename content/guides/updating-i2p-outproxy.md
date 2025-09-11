---
title: "Updating I2P Outproxy Setttings"
description: "Easily update your I2P Outproxy settings with the step-by-step guide from StormyCloud Inc. Protect your internet freedom and digital privacy."
url: /updating-i2p-outproxy/
layout: install-i2p
image: "images/imagelogo.png" #used in og:meta image
bodyId: updatingoutproxy
page_content:
  h1_Heading: "Updating I2P Outproxy"
  header_image: images/updateoutproxy.webp
  sections:
    - type: heading3
      text: "I2P/I2P+"
    - type: paragraph
      text: |
        As of <a title="Enable StormyCloud OutProxy" target="_blank" href="https://geti2p.net/en/blog/post/2022/08/04/Enable-StormyCloud">August 2022</a> the I2P team made StormyCloud the default outproxy provider for I2P. The default outproxy provider for I2P+ is purokishi.i2p. However, if you need to update the outproxy information please follow the below steps. If you are connecting to a remote server you will want to follow our <a title="Create Ssh Tunnel" href="/create-ssh-tunnel">SSH Tunnel guide</a>.
    - type: paragraph
      text: |
        Step 1 - Connect to your router console - <a title="127.0.0.1:7657" href="127.0.0.1:7657">127.0.0.1:7657</a>
    - type: image
      src: "/images/updateoutproxy_01.png"
      alt: "Updating I2P Outproxy"
    - type: paragraph
      text: | 
        Step 2 - Navigate to the <a title="Tunnelmanager" target="_blank" href="http://127.0.0.1:7657/tunnelmanager">Tunnel Manager</a>.
    - type: image
      src: "/images/updateoutproxy_02.png"
      alt: "Updating I2P Outproxy"
    - type: paragraph
      text: | 
        Step 3 - Click on the <a title="Edit" target="_blank" href="http://127.0.0.1:7657/i2ptunnel/edit?tunnel=0">I2P HTTP Proxy</a>.
    - type: paragraph
      text: | 
        Step 4 - Update both the Outproxies and SSL Outproxies with the information below and hit the Save button.
    - type: code
      title: ""
      content: exit.stormycloud.i2p,purokishi.i2p
    - type: image
      src: "/images/updateoutproxy_03.png"
      alt: "Updating I2P Outproxy"
    - type: heading3
      text: I2PD
    - type: paragraph
      text: | 
        To add an Outproxy for I2PD, you will need to update the i2pd.conf file. You can either use our simple one-line command to do this automatically or follow the instructions below.
    - type: code
      title: ""
      content: curl -sSL https://stormycloud.org/scripts/i2pd.sh | bash
    - type: paragraph
      text: | 
        Step 1 - We need to open the i2pd configuration file, we can do this in nano or vim.
    - type: code
      title: ""
      content: nano /etc/i2pd/i2pd.conf
    - type: paragraph
      text: | 
        Step 2 - Locate the block starting with [httpproxy].
    - type: paragraph
      text: | 
        Add in the following line outproxy = http://exit.stormycloud.i2p
    - type: paragraph
      text: | 
        If you do not have an http proxy block setup you can copy and paste this entire block below.
    - type: code
      title: ""
      content: |
        [httpproxy]
        port = 4444
        outproxy = http://exit.stormycloud.i2p
    - type: paragraph
      text: | 
        Step 3 - You will want to restart I2PD and that is all!
    - type: code
      title: ""
      content: systemctl restart i2pd
    - type: heading3
      text: Address Helper
    - type: paragraph
      text: | 
        <p class="center" id="outproxyinfo">
        <span class="address-container">
            <b>Address:</b> <span class="address">exit.stormycloud.i2p</span>
            <a id="helper" href="http://exit.stormycloud.i2p/?i2paddresshelper=Ms6qmq4ZpttjEZK8r7ev38BL8dyT~-ENUK~j74G-nN-WIN7-rUJWbbYAyagQOyerJ31Bf52vtJeXPVHGQdUnbOgBmNkN-Hoo6LkDle1Su7eKYlOrbE2RNihOCh-U0Yq7vDYDBnKI8ldE7s24RY4Nmk1ZlVq8nQwT~RrNf0nbBKBjgGKJkmsfBq6i0G6eZN9Cy2Ip6uGbG70jHzzyAqW9hLUxLArVZKNMAh-fzgGUQkj3llOMqJ5NQqZn2sMrcKkO~c2nn65KNYp2zAGUnbzz3y5M~BOBj9egGYzoakDpGTEpErNj8PiO3oDeKrlgsFFsfmfcMyTKrv82FhBiwxi-izX~P7vo7wcOqhmfic5jqgzY5J-8hEpg0LerjcrW0GjOzHra20GclknvtY5M9m9eUJnRDt43n5IwBrO6-C3VJJLvWvi1gabEP2wuKvAcgHcLn6vU1reqS7QwT~Y-bteoUEw1gZ-GCPkRhGKmr6d2NyxLzEEJispBLoCoTWKPZCHkBQAEAAcAAA==" target="_blank" title="Add this address to your I2P addressbook">
                <img src="/images/helper.svg" width="24" alt="i2p address helper">
            </a>
        </span>
        <span class="long-address">5d4s7pcvfdpftfk7npc7hllyujhufsdprtrf4o53i44rgsa2xbwa.b32.i2p</span>
        </p>


---
