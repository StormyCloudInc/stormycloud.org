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
    - title: "Warrant Canary"
      text: |
        A signed warrant canary will be published quarterly (January, April, July, and October) to ensure that StormyCloud has not been compromised by any third-party using a subpoena. You can download the [warrant](/files/message.txt.asc) and the [PGP key](/files/public.asc).
      code: |
       
        Hash: SHA256

        StormyCloud Inc, August 2025

        StormyCloud Inc has not produced any information in response to a secret subpoena, such as one served under 18 U.S.C. Section 2709(c) of the U.S. Patriot Act, and has not built "backdoors" for any government into our products. All government requests for user data need to come through the front door (i.e., by serving valid legal process upon StormyCloud).
        
        -----BEGIN PGP MESSAGE-----

        owFdkU1oE1EQxzfaQhoRWpDcgmNFbSUsaUBioaUNFUVRKEQR8fT2vcnu0s2b+D6i
        QTxahIIotFa8VkovYj160qMKXjwLgnj14KEHQcHJYkvpbZiP//zmP0+OHg6K5ZUL
        czR6d/ZY4VVhLTrSQWtFjKG755LH6ydbjkynv5CRV3BZyyo0feytg3qtfq5UOlCF
        RFjQ5KBrSHmJCoTuQ6rb3CVcSppjMGi7pC2CIxBgURp0YH3UJdSiypFMgGVIIxdN
        j0W8Vmhg6jzcCFvhQggtlLlYvVGbnpCTQG1wCeZVWBTOpEzQlK7K29UeUuTTzMF4
        JOSSIjJ2HJgq54uph0Z3UDvGYyjy5v8BzobQzLL9HQbveLTO5tOeAUEJJ0Ajc/Ks
        pA4flhjycZJDtQ3x1GAjTKQhhlWI+vldqY6hJ7JUQYaxyAYbJVsPns2Bfb5OhqVH
        figoF4NK+cTQpXcvry7/vj7z9cfbtd2/DR8aPCoojYzuZlamC8Gv71MjZ9Pas83X
        /jP+ffB87NqL+YtbZzYebh0/9XNnZ74QrOLtp5/Wv8w1Niuq8i1rvDm9vfHxz81b
        95dXr9Q/vC/+Aw==
        =t8Qf

        -----END PGP MESSAGE-----
       

    - title: "How to verify the warrant canary?"
      text: ""
      code: |
        bash
        wget -q http://www.stormycloud.org/warrant-canary/message.txt.asc -O message.txt.asc && wget -q http://www.stormycloud.org/warrant-canary/public.asc -O public.asc && gpg --import public.asc && gpg --verify message.txt.asc
        
---
