---
title: "Warrant Canary & Transparency Report"
description: "StormyCloud Inc operates with transparency. Check our warrant canary to ensure no secret orders have been issued, defending your digital freedoms."
url: /warrant-canary/
layout: warrant-canary
image: "images/imagelogo.png"
bodyId: canary
page_content:
  h1_Heading: "Warrant Canary"
  sections:
    - title: "Our Philosophy"
      text: |
        **StormyCloud operates on a simple philosophy: we do not retain logs.**

        - All servers automatically purge logs every 15 minutes
        - We do not keep logs of any kind
        - We do not provide information to any law enforcement agency
        - All public inquiries from law enforcement will be published on this page

        Because we don't retain data, we cannot provide what we don't have.

    - title: "Warrant Canary"
      text: |
        A signed warrant canary will be published quarterly (January, April, July, and October) to ensure that StormyCloud has not been compromised by any third-party using a subpoena. You can download the [warrant](/files/message.txt.asc) and the [PGP key](/files/public.asc).
      code: |
       
        Hash: SHA256

        StormyCloud Inc, August 2025

        StormyCloud Inc has not produced any information in response to a secret subpoena, such as one served under 18 U.S.C. Section 2709(c) of the U.S. Patriot Act, and has not built "backdoors" for any government into our products. All government requests for user data need to come through the front door (i.e., by serving valid legal process upon StormyCloud).
        
        -----BEGIN PGP MESSAGE-----

        iHUEARYIAB0WIQRHv6RMhvlUPNzkuZWLRD9vEHc9FAUCaQaLGwAKCRCLRD9vEHc9
        FOQ8AP9CPJKkbPdp/6Bl9F3B8dKcJMO+4GzKATUWdaPfFxPPDQD/dkOGgX8LSMGv
        5JjODkJf8qjXQdRcreq5aeTV5pNffwA=
        =9bgf

        -----END PGP MESSAGE-----
       

    - title: "How to verify the warrant canary?"
      text: ""
      code: |
        bash
        wget -q http://www.stormycloud.org/warrant-canary/message.txt.asc -O message.txt.asc && wget -q http://www.stormycloud.org/warrant-canary/public.asc -O public.asc && gpg --import public.asc && gpg --verify message.txt.asc
        
---
