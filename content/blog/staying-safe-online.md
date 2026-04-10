---
title: "Staying Safe Online in 2025–2026"
date: 2026-05-01
description: "A comprehensive guide to protecting your digital life — from VPNs and Tor to passkeys and AI-powered threats. Practical steps every consumer can take today."
tags: ["Privacy & Security"]
image: "/images/blog/staying-safe-online.jpg"
author: "StormyCloud Team"
---

Privacy tools work best for everyday people.

## VPNs Protect Your Connection — But Not Your Identity

A VPN will encrypt the traffic between your computer and the VPN server, and hide your IP number from websites. That's good — it blocks your ISP from logging everything you do on the web, protects against hackers on public Wi-Fi, and allows you to circumvent geo-restrictions. However, VPNs do not keep you anonymous. As long as you're signed up for Google or Facebook, they'll know it was you visiting their sites. You may be tracked by cookies and browser fingerprints. Additionally, your VPN service provider can view what you're doing online — and therefore you've simply shifted the risk of trusting your ISP to your VPN service.

### Choosing a VPN You Can Trust

Choosing a VPN provider that you can actually trust is likely the most important decision when selecting a VPN.

- **Mullvad VPN** stands out: Mullvad VPN requires NO information about you to sign up, takes cash delivered by mail, operates RAM only servers, and has completed numerous independent audits. In 2024, when Swedish authorities raided Mullvad's offices, they didn't find anything — there is no subscriber data kept anywhere.
- **Proton VPN** offers a powerful free service based in Switzerland, and works well with the rest of the Proton privacy system.
- **IVPN** is also a good privacy first choice with many audits done regularly.

You should avoid VPN providers that:

- Have not been audited independently
- Have unclear terms and conditions regarding privacy
- Offer "free" services without a clearly defined business model
- Are owned/controlled by parties whose identities are unknown

A huge free VPN leak exposed 360M records back in 2023. According to Specops research, close to 2M VPN account credentials were stolen via malware in 2024. With regards to free VPN services, the danger is even greater since nearly 30% of VPN users are still relying on these services although there have been many reports of companies selling this type of data.

### WireGuard Has Won the Protocol War

WireGuard has largely become the winner in 2025 when it comes to VPN protocol choices:

- **Throughput:** WireGuard produces average rates of 920–960 Mbps while OpenVPN averages around 620–780 Mbps
- **Codebase:** WireGuard contains approximately 4,000 lines of code while OpenVPN contains more than 600,000
- **Vulnerabilities:** WireGuard has zero recorded CVEs while OpenVPN has several dozen

While OpenVPN is still being used today by some individuals in highly censored countries for its ability to run on TCP port 443 mimicking HTTPS traffic.

**Action:** Choose a reputable paid VPN with WireGuard enabled and install a killswitch. Combine the VPN with additional security measures. Do NOT depend solely on a VPN for privacy.

## Tor Offers Genuine Anonymity — at a Price

Unlike a VPN, Tor does not offer anonymity through obfuscation of traffic flow, but rather through hiding your location. Once connected to a Tor network, your traffic is routed through at least two hops before reaching its final destination. Each hop adds a layer of encryption, preventing any single point along the route from knowing both the originator of the message and its intended recipient. No legitimate organization outside of the Tor network knows how you accessed the Tor network because your exit node appears to originate from wherever it resides.

Therefore, Tor is one of the few legitimate consumer tools that provides true anonymity instead of merely offering privacy. Since May 2025, the Tor Project has been working on rewriting its code base from C to Rust under the name Arti (Arti version 2.0.0 released in Feb 2026). Arti removes at least half of past known vulnerability types by design.

However, Tor has its own set of disadvantages:

- Tor traffic often slows down significantly due to multi-hopping
- Many websites now prohibit visitors who connect through Tor exit nodes
- You'll likely encounter CAPTCHA challenges frequently
- Most importantly, if you log in to any personal accounts while connected to Tor, then you've essentially defeated its purpose of hiding your location — Tor hides your source location but doesn't conceal your identity once you provide it

In May 2024, German law enforcement officials successfully deanonymized a Tor user by identifying his identity through analyzing timing differences in traffic patterns across various monitored nodes combined with data collected from ISPs related to his use of a child pornography website. The Tor Project confirmed the individual had been using an older version of Tor Browser Software that lacked Vanguards-Lite protection (the latter having been added to Tor Browser Software in early 2022).

**Use a VPN for routine browsing privacy and performance. Use Tor whenever you require genuine anonymity — i.e., whenever it truly matters whether anyone — including your VPN Service Provider — can associate your identity with your activities.**

## I2P — An End-to-End Private Decentralized Network

The I2P project is developing a completely end-to-end decentralized communication network. The routing technique developed for this project called garlic routing, combines several messages in a single package which are then encrypted together and distributed via one-way tunnels. As such it becomes much more difficult to correlate activity when compared to traditional onion-routing. I2P currently hosts approximately 12,000–55,000 active nodes worldwide. Each node acts as both a source and a relay node at the same time, thus each user contributes to the network's overall performance.

While Tor is generally used for providing anonymity while connecting to the general public internet, I2P is specifically designed to provide private communication internally. Accessible from within the I2P network are "eepsites" (.i2p addresses), anonymous e-mail, file sharing and various other services that reside solely inside the network. Since there are no central exit nodes for I2P, it provides greater advantages over other networks in terms of censorship-resistance and overall robustness. Organizations like StormyCloud also continue to increase the size of the I2P network, running more than 50 I2P servers to help improve its overall structure and availability.

I2P represents a completely different use case scenario when compared to either a VPN or Tor. If you require censorship-resistance for internal communication — i.e., journalists, activist groups, privacy researchers etc. — I2P would represent the best option. Additionally, due to its decentralized nature, I2P is capable of providing secure peer-to-peer support for email (I2P-Bote), file-sharing, IRC and web-hosting — all located behind an encrypted layer.

## Different Trade-Offs Exist Between Privacy Browsers

### Brave

As of September 2025, Brave has become the leading browser for mainstream privacy-focused browsers with 100 million monthly active users and the highest rating provided by PrivacyTests.org (143/156). By default, Brave blocks tracking cookies/scripts by utilizing its built-in shields — thus eliminating the necessity for add-ons/extensions. Within Brave in 2025, developers have included new features — including blocking Microsoft's "Recall" screenshot feature and an AI-based cookie notification blocker. Overall, Brave is the most accessible way to achieve strong levels of privacy if you prefer to use a Chrome-like environment.

### Firefox (with Hardening)

Firefox with additional hardening will allow you to customize your browser in ways that other browsers cannot match. However, you'll have to configure many items yourself. These include:

- Switching Enhanced Tracking Protection to 'Strict'
- Disabling telemetry (if available)
- Enabling DNS-over-HTTPS
- Installing uBlock Origin (which functions properly on Firefox unlike Chrome under Manifest V3 restrictions)

If you'd rather have all of these options configured prior to launch, you may consider using **LibreWolf**, a community-created fork of Firefox that runs with all options set to maximum security upon launching; however, it does lack auto-update functionality and it has no mobile offering.

### Mullvad Browser

The Mullvad Browser was created through collaboration efforts by Mullvad VPN and the Tor Project. Through this collaboration effort, the Mullvad Browser utilizes the anti-fingerprinting technologies found in Tor Browser but operates outside of the Tor network. Due to this operation, all users appear identical for fingerprinting purposes; additionally, private mode is activated by default. The Mullvad Browser is ideal for compartmented browsing sessions along with a VPN.

### The Fingerprinting Problem

Regardless of how well a browser attempts to protect against fingerprinting — approximately 83.6% of browsers will possess a unique fingerprint derived from 50–200 data points regarding your specific device. Unlike cookies, which can be easily deleted since they're based on actual data collected regarding your usage habits — fingerprints cannot be removed as they are directly tied to hardware and software attributes of your device. Privacy focused browsers mitigate fingerprint threats through two methods:

- **Standardization:** Tor/Mullvad makes all users appear identical
- **Randomization:** Brave intentionally alters certain API values — referred to as "farbling"

## The Most Important Part of Any Digital Life: Encrypting Your Communications

### Signal — The Gold Standard

When asked about which is best, Signal stands out from the rest. More than 70–100 million people use Signal each month; it operates on an annual budget of approximately $50 million and collects virtually no data — basically just your phone number, when you created your account and the last time you connected (to the nearest day).

If ever required to produce information related to a case, Signal will have nothing to give law enforcement — since there is no data to hand over.

Signal utilizes three different protocols that are combined into one called "the Signal Protocol":

- **X3DH Key Exchange**
- **Double Ratchet Algorithm**
- **AES-256 Encryption**

Together they provide for "forward secrecy" (messages previously sent remain safe and secure even if the sender has lost their keys).

In 2025, Signal implemented Post Quantum Encryption (using PQXDH with ML-KEM) along with Secure Backups — allowing users to save their messages securely using end-to-end encryption for cloud backups, addressing the issue of losing messages due to loss of your phone.

### Session — For Real Anonymity

Session is used by those looking for real anonymity. Session does not require either a phone number or email address. Users only need to generate a random 66-character ID. Sessions are routed through approximately 2,000 node operators in the open-source community, using Onion Routing. Session introduced the new version of its protocol, Version 2 in December 2025. It included the addition of Post Quantum Encryption and Perfect Forward Secrecy to the original protocol.

### SimpleX Chat — Zero Identifiers

With SimpleX Chat, users do not use any identifying features whatsoever — no phone numbers, names, usernames, or even random IDs. All conversations create temporary queues for messages, with no ability to relate those queues to the same individual. SimpleX Chat has been audited by Trail of Bits and recommended by Privacy Guides.

### A Warning About Telegram

Regarding Telegram: regular "cloud chats" are not end-to-end encrypted, since Telegram retains the keys to decrypt the chats. Telegram provides end-to-end encryption via "secret chats," but only in 1:1 mobile conversations and only if they are enabled manually. This feature is also deeply buried within the app. Group chats are never end-to-end encrypted.

**Security experts agree that while Telegram may appear to be a messaging application, it is actually a social media platform — therefore not a secure messenger.**

### Why This Matters Now

Chinese-state sponsored hackers accessed major U.S. telecommunications systems and were able to intercept both voice calls and texts during the Salt Typhoon attack on major U.S. communications networks in late 2024. Following this event, CISA made explicit recommendations regarding end-to-end encryption of messaging services. As part of this statement, a senior cybersecurity official directly stated: **"Encryption is your friend."**

## Encrypting Your DNS

Traditional DNS requests — essentially "looking up the phone book" for websites your device accesses — are sent in plaintext form. Therefore, your ISP records every single site you visit. DNS-over-HTTPS (DoH) encodes traditional DNS requests in encrypted HTTPS traffic. Firefox includes DoH enabled by default for users located in Canada and the United States. To enable DoH in other locations, changing browser settings takes approximately thirty seconds.

There are many options available for choosing a DNS provider:

- **Cloudflare 1.1.1.1** — for speed (averages ~10–15ms globally and deletes logs after 24 hours)
- **Quad9** — a private DNS service with integrated security (a non-profit based in Switzerland that collaborates with threat intelligence provided by twenty-five additional security firms)
- **NextDNS** — for fine-grained control and custom blocking lists

---

## Part 2: Emerging Cybersecurity Risks Consumers Face Today

### AI Phishing Has Surpassed Human Social Engineers

One of the most important shifts occurring within cyber security today is the fact that AI-based phishing attacks are exceeding those conducted by elite human social engineers. A study released by Hoxhunt in 2025 using simulated attacks against 70,000 users reported that AI-based attacks were able to fool users 24% better than elite teams of human attackers — representing a 55% relative increase over data collected in 2023 in which AI-based attacks performed 31% worse than human attackers. Since the launch of ChatGPT in 2022, the amount of phishing attacks has increased by 4,151%.

### Old School Advice is Obsolete

No longer will you be able to look for simple spelling errors to determine if a message sent to your email account is legitimate. In addition to generating perfect grammar and spellings, AI can generate messages based upon information it obtained regarding the user from social media; this enables the AI to personalize its messages. According to the same IBM study referenced above, AI can produce a phishing attack in 5 prompts and 5 minutes, while it would take human experts approximately 16 hours to produce similar results. Users must now look for behavioral indicators such as:

- Unexpected urgency
- Unusual requests for money or credentials
- Emotional pressure tactics used to force a decision
- Requests to keep matters secret from other family members and friends

### Voice Cloning: The Fastest-Growing Attack Vector

According to CrowdStrike reports, voice cloning saw a 442% increase in usage between the first half and second half of 2024. Voice cloning utilizes artificial intelligence to clone the voice of a person in a matter of only seconds. Approximately 3 seconds of audio allows AI to create an 85% match with a person's original voice. More than one quarter of all U.S. adults have experienced an AI voice scam. Seventy percent of these individuals stated that they were unable to tell whether they heard a cloned version of someone's voice or the actual person speaking.

**Protect yourself and your family:**

- Establish a "safe word" with all family members so they will know if it is really you who is calling them when there is an emergency
- Always verify any request for urgent action through a separate communication channel that is known by you
- Do not send any amount of money using wire transfers, gift cards or cryptocurrency based upon a phone call or video conference alone

### SIM Swapping Remains a Devastating Attack Vector

SIM swapping — getting a cell provider to switch your telephone number to another person's SIM card — has resulted in $25.98 million of loss due to the FBI receiving 982 reports throughout 2024. Furthermore, the United Kingdom experienced a tremendous rise of 1,055% in unauthorized SIM swappings.

T-Mobile will be required to provide reimbursement totaling $33 million due to a federal court ruling after hackers circumvented carrier security alerts resulting in an estimated $38 million being stolen in cryptocurrency from one individual customer.

A recent example of how a hacker used this method to affect others occurred when the SEC's X (previously known as Twitter) account posted about a fraudulent Bitcoin ETF approval which caused nearly $230 million of market liquidation through a SIM swap.

**Prevention is simple:**

- Establish a SIM PIN and set a port freeze at your cellular service provider
- If you are using SMS-based two-factor authentication, replace it with either an authenticator app or a passkey
- The FCC recently implemented stricter requirements for cellular carriers to authenticate users, however, the timing of implementation has been delayed so consumers need to proactively protect themselves

### QR Code Phishing Exploits Trust in a Familiar Format

Phishing using QR codes ("Quishing") increased by a factor of five in 2025 and QR codes are now seen in 12% of all phishing attacks. Researchers who specialize in identifying threats note they discover an average of 11,000 malicious QR codes each day. These types of scams work because QR codes do not reveal the destination URL and 73% of American adults scan QR codes without verifying where the link goes. This type of scam appears in places such as:

- On parking meters and electric vehicle charging stations
- As email attachments designed to look like prompts to reset multi-factor authentication

**Consumer tip:** Preview the URL associated with any QR code prior to scanning it; do not input any credentials on web pages accessed using QR codes; and inspect for signs of physical tampering (i.e., stickers covering legitimate QR codes).

### AI-Powered Malware Is Nascent but Accelerating

In late November 2025 Google's Threat Intelligence Group announced a groundbreaking finding: malware families that utilize large language models during runtime for self-modifying behavior. Additionally, Google found five additional AI-enabled malware families capable of rewriting their own source code periodically to evade detection signatures.

While the above represents the most immediate consumer-related implications related to scale and accessibility, AI-generated polymorphic malware produces thousands of new code variants per minute (each variant produced every 15 seconds). Therefore, the ease of creating and utilizing these types of malicious applications is reduced significantly compared to traditional methods. Additionally, according to Google, since mid-year 2025 there has been an explosion in infostealer malware that accounted for 84% of all credential-stealing activity during that time frame. It has also become easier for even unskilled individuals to create and utilize password cracking AI-powered tools that can identify and break down 81% of commonly-used passwords within a calendar month.

**Consumer protection:**

- Use a reputable password manager that creates unique passwords for each account
- Utilize phishing resistant MFA (e.g. passkeys or hardware tokens)
- Always update your operating system and other software programs
- Install and run antivirus software with behavioral analysis capabilities rather than merely signature-based detection

---

## Part 3: The New Authentication Landscape

### Passkeys Are Ready for Mainstream Adoption

In terms of security upgrades currently available to consumers, passkeys represent the biggest leap forward. They are based upon the WebAuthn/FIDO2 standard. Each passkey is tied to a specific web site domain so phishing becomes a mathematical impossibility. Nothing secret is sent when you log in; the private key remains on your device.

We believe we've reached a tipping point regarding adoption:

- 69% of users have created at least one passkey
- 48% of the top 100 web sites allow passkeys
- Well over one billion passkeys have been created worldwide
- Google states that using a passkey results in four times more successful logins than using a password
- In May 2025, Microsoft set passkeys as the default method of authentication for all new accounts

Many large companies use passkeys including but not limited to Google, Apple, Amazon, PayPal, GitHub, WhatsApp and TikTok.

The last barrier to widespread acceptance will be the ability to easily move passkeys across platforms (e.g. from an Apple to an Android) and worry about what happens if all of your devices go missing. A new "Credential Exchange" protocol is being developed to assist with portability issues.

### Data Breaches Hit an All-Time High

In total, 3,158 data breaches occurred in 2024; additionally, consumers received 1.73 billion notices of victimization — a 312% increase over 2023. A total of six mega breaches occurred in 2024 with each releasing more than 100 million records. Additionally, the "RockYou2024" collection contained about 10 billion unique passwords taken from approximately 4,000 databases.

- Compromised credentials were the leading method of breaching and comprised 22% of all 2024 breaches
- Four of the top five breaches could have been prevented had organizations enforced multi-factor authentication (MFA)
- These preventable breaches resulted in 1.24 billion preventable records being exposed
- Social media account takeovers currently rank as the most common way that identities are misused, affecting nearly 35.3% of individuals who were victims of identity crime
- Credential stuffing accounted for 31% of social media account takeovers because many consumers continue to use the same username/password combinations across multiple websites

**It is crucial for consumers to:** check haveibeenpwned.com to see if their login credentials have been breached, use a password manager (as per official NIST recommendations), turn on MFA for every account possible, and potentially put a freeze on credit if your personally identifiable information has been breached.

### Recommendations From Official Authorities

Multiple federal agencies including CISA, NIST and the Electronic Frontier Foundation (EFF) have published guidance for consumers. NIST recently released its revised guidelines for developing passwords via its Special Publication (SP) 800-63B. Among other things, the new version:

- Recommends using a minimum of 15 character passwords
- Does not require complex characters (e.g., numbers, special characters)
- Does not require consumers to change passwords periodically
- Will screen created passwords against lists of previously compromised credentials
- Specifically states that SMS-based 2FA should be considered sufficient for low assurance environments but should not be used for high assurance environments due to significant vulnerabilities

CISA's "Secure Our World" initiative provides the following concise advice:

- Use strong, unique passwords
- Update your computer software as soon as you receive notifications regarding updates
- Be cautious prior to clicking on links sent to you via e-mail and/or messaging applications
- Turn on Multi-Factor Authentication (MFA) on every online account possible

## Ten Strategies That Will Have the Greatest Impact

1. **Turn on passkeys** on Google, Microsoft, Apple, Amazon, and any other services that support them
2. **Use a password manager** (such as 1Password or Bitwarden or a built-in option) to create unique and long passwords for everything else
3. **Replace SMS 2FA immediately** with either an authenticator app or a passkey
4. **Configure a SIM PIN and port lock** with your mobile provider
5. **Create a family code word** that can be used to verify emergency phone calls against voice cloning scams
6. **Switch private conversations to Signal** and enable disappearing messages
7. **Use a private browser** (Brave for simplicity, Firefox/LibreWolf for granular control) and configure DNS-over-HTTPS (DoH)
8. **Keep all software up to date** utilizing automatic update features
9. **Avoid scanning unknown QR codes** until you review the destination URL first
10. **Check haveibeenpwned.com regularly** to determine if your login credentials have been breached and freeze your credit files with each of the three major credit reporting agencies if they have

## Conclusion

Cybersecurity in 2025–2026 presents an interesting paradox. Cyber threats have evolved into some of the most sophisticated attacks ever experienced — AI has significantly shortened the time frame attackers need to exploit vulnerabilities; deep fakes are virtually indistinguishable from reality; and annual data breaches release millions of personally identifiable information records. However, consumers have never had better tools or easier ways to defend themselves than what exists today. Passkeys eliminate entire classes of potential attacks. E2E encryption is both mainstream and post-quantum secure. Privacy browsers provide fingerprint protection which was virtually unachievable just five years ago.

One of the key insights from analyzing data related to cybercrime activity during the past couple of years is that **social engineering causes approximately 83% of all cybercrime losses — while technical exploits cause the remaining 17%**. According to the FBI, $16.6 billion in reported losses are primarily attributed to deception — phishing, business email compromise, investment fraud and romance scams — rather than sophisticated malware. Therefore, protecting consumers through education and awareness creates much greater value than providing a single piece of security software.

The methods outlined in this document do protect against cybercrime. The problem is implementation. Currently, 59% of consumers use the same password across multiple websites — and 1.24 billion breach records could have been protected by simply implementing MFA. The current difference between technology available to protect against cybercrime and actual consumer practices is the greatest threat to our safety today.

**Begin with one small step today — add a passkey, install Signal, change your DNS — and build upon those steps tomorrow.**
