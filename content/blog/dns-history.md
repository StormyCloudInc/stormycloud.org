---
title: "DNS: From a Text File to the Internet's Encrypted Backbone"
date: 2026-07-01
description: "The complete history of DNS — from ARPANET's HOSTS.TXT file to encrypted DNS protocols and the upcoming 2026 root key rollover that will shape the future of internet security."
tags: ["DNS", "Privacy"]
image: "/images/blog/dns-history.jpg"
author: "StormyCloud Team"
---

Every time you make a phone call to someone, send an e-mail or connect to a video conference, the Domain Name System (DNS) performs a behind-the-scenes translation from a user-friendly name to the specific Internet Protocol Address (IP) required by your device. It's essentially the internet's version of a telephone directory. However, unlike traditional telephone directories, DNS manages trillions of look-ups per day, is available worldwide and is experiencing the largest change in its nearly 40-year existence.

## One Small File Could Not Handle Scaling

Prior to the advent of DNS, each host computer on ARPANET used a centralized file named HOSTS.TXT to resolve names. This file was managed by a group at SRI International. Host administrators would contact a designated administrator responsible for the HOSTS.TXT file via email with updates to hostname entries. After receiving these updates, the administrator would compile the new version of HOSTS.TXT, typically once or twice per week, and redistribute the updated file via FTP to all computers on the ARPANET.

While this method functioned well until ARPANET transitioned to TCP/IP on January 1, 1983, the number of hosts increased exponentially. As such, the size of HOSTS.TXT grew too large to be redistributed effectively. With each host having unique identifiers within a flat namespace, collisions became inevitable. Additionally, because the update process occurred once or twice per week, records were always out of date.

Jon Postel asked Paul Mockapetris to develop a solution to fix the problems created by the growth of HOSTS.TXT. On November 23, 1983, Mockapetris submitted **RFC 882** and **RFC 883** detailing DNS as a hierarchical, distributed database. Within each organization could maintain control over their portion of the naming hierarchy. In December 1983, four graduate students from the University of California developed **BIND** for use with Berkeley Software Distribution (BSD). Once included in Berkeley's distribution package, DNS rapidly spread throughout the world.

In 1987, Mockapetris further refined his original work through submission of **RFC 1034** and **RFC 1035**. These two documents have remained the foundation for how DNS functions today.

## How Name Resolutions Function Using DNS

DNS functions as an inverse tree structure. At the base of this structure exists the **root zone (.)**, followed by the **top-level domains** (.com, .org, etc.), branching off from there are **second-level domains** (example.com), followed by **sub-domains**. Each level of the hierarchy delegating authority to the subsequent levels means no one party has to be aware of every name associated with the internet.

Once you enter a URL into your browser, your computer will check to ensure a valid copy of the requested resource is stored locally (the "cache") by your device's stub resolver. If the requested resource is missing from your local cache, your stub resolver will forward your request to a **recursive resolver** (your Internet Service Provider (ISP) or a third-party service provider such as Cloudflare's 1.1.1.1). From there, your recursive resolver begins traversing down the tree structure (inverse tree):

1. Asking a **root server**
2. Being directed towards a **Top-Level Domain (TLD) server**
3. Being directed toward the **authoritative nameservers** for your desired resource
4. Ultimately retrieving the response — an **A record** mapping your desired name to an IPv4 address or an **AAAA record** mapping your desired name to an IPv6 address

Typically, this entire transaction occurs in less than 100 milliseconds, and due to Time-to-Live values embedded within DNS records, results are retained in caches based upon those TTLs.

### Beyond Address Resolution

DNS provides functionality beyond simply resolving addresses:

- **MX records** direct mail routing
- **TXT records** contain policy information related to email authentication including SPF (Sender Policy Framework), DKIM (Domain Keys Identified Mail) and DMARC (Domain-based Message Authentication, Reporting & Conformance)
- **SRV records** provide service discovery capabilities for SIP (Session Initiation Protocol) and XMPP (Extensible Messaging and Presence Protocol)
- **CAA records** (Certificate Authority Authorization) restrict Certificate Authorities authorized to issue TLS certificates for a given domain
- **SVCB and HTTPS record types** (RFC 9460) allow services to embed service-specific metadata along with Encrypted Client Hello keys directly into DNS — allowing for quicker and more secure connectivity

## Encrypted DNS

Previous versions of DNS transmit requests in plain-text UDP packets making them observable and accessible to anyone between your resolver and destination. Three primary encryption methods exist today to mitigate this issue:

### DNS-over-TLS (DoT)

DoT encapsulates requests using TLS on port 853. Google utilizes DoT as part of its Private DNS feature for Android devices. DoT utilizes a separate port making management easier for network administrators while also making censorship simpler for governments.

### DNS-over-HTTPS (DoH)

DoH encapsulates requests inside standard HTTPS traffic utilizing port 443 and appears as regular web traffic. Both Mozilla's Firefox and Google's Chrome include DoH as an option for many users, with all major OS platforms supporting DoH at the platform layer.

### DNS-over-QUIC (DoQ)

DoQ uses UDP port 853 and offers approximately 20% improved performance compared to DoT by removing head-of-line blocking. The BIND project includes active development for support of DoQ beginning with version 9.21. In addition, AdGuard hosts over 17% of global DoQ resolvers.

### Encrypted DNS Is Now Mandatory

On January 28th 2025, President Joe Biden signed a U.S. executive order requiring encrypted DNS on all U.S. Federal government networks. Similarly, the European Union's proposed NIS2 Directive requires DNS providers across all member states to implement some form of encrypted DNS. Encrypted DNS is no longer optional — it has become a regulatory requirement.

## DNSSEC and the Future of DNS Security

In 1983, Paul Mockapetris created the Internet's Domain Name System (DNS) as an efficient solution to an identification issue. Now nearly four decades later, this "solution" forms the basis for almost every decision regarding trust and routing that takes place across the entire Internet. This year, there are three significant factors changing how we use DNS:

- **The need for encryption is now mandatory**
- **DNS is transitioning** from being simply a passive mechanism for performing name lookups into an active control plane for security
- **Two major changes to DNS cryptography** occurring in 2026 will determine if the systems used to update all aspects of the Internet can be scaled to perform globally

The **Domain Name System Security Extensions (DNSSEC)**, added to the DNS system in 1999, provides each resolver with digital signature verification capabilities to ensure that no one alters any of the information within the response. However, when the Root Zone of the Internet was finally made secure using DNSSEC in July 2010, global acceptance of the technology remained low — as of today only about 35% of all resolvers globally are validating DNSSEC. While many countries have seen increased levels of validation — including the European Union where they currently average approximately 49% — the rate of adoption varies widely.

### The 2026 Root Key Rollover

One of the largest events facing the industry is the planned rollover of the current key signing keys for the root zone of the Internet in **October of 2026**. ICANN announced its plans for a new trust anchor in August 2024. Automated rollouts utilizing RFC 5011 have already begun to occur. A prior rollover of these same key signing keys occurred in October of 2018 and was also the first attempt to do so. It had originally been intended to happen in October of 2017 however ICANN decided to delay due to concerns about readiness and ultimately did so until after their IANA transition was completed.

Additionally, looking ahead to future potential updates to the root zone, ICANN recently invited public comments on a proposed plan to migrate away from RSA-based cryptography toward **Elliptic Curve Digital Signature Algorithm (ECDSA)**-based cryptography. The goal for this migration is to retire RSA-based cryptography by 2029.
