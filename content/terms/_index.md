---
title: "Terms of Service"
description: "Terms of Service for ankimcp.ai, the AnkiMCP open-source project, and the AnkiMCP SaaS cloud service."
sitemap_priority: 0.3
---

## Terms of Service

**Effective Date:** June 30, 2026

{{< callout type="info" >}}
**The short version.** This summary is for convenience only — the full Terms below are what applies.

- The client software (CLI, add-on) is free and open source; the cloud service is not. Everything is provided **"as is"** — no warranty.
- **Back up your Anki decks.** The AI can change or delete cards, and you are responsible for your own data.
- Be respectful on the forum. You own your posts; we may moderate content that breaks the rules.
- The tunnel has a **free tier** with monthly limits and a **Plus tier** ($5/month). There's also a **Pro tier** ($15/month) that adds **Hosted Anki**. Limits and pricing can change with notice.
- Paid plans renew monthly and you can **cancel anytime** — access lasts until the end of the period you've paid for, with no automatic refund for unused time. There's a **14-day money-back guarantee** on your first payment. Payments are handled by **Paddle**, and refunds are issued through Paddle. See "Payments, Refunds, and Cancellation."
- **Hosted Anki is experimental** — it runs a copy of your Anki on our servers, may change or go away, and deleting an instance is permanent. Keep your own backups.
- Your tunnel is for you only — don't share it, and you choose which AI apps may access your Anki. If you turn on **authless access**, anyone with your private link can reach your Anki — keep it secret.
- Our liability is limited: at most, what you paid us in the last 12 months.
{{< /callout >}}

These Terms of Service ("Terms") govern your use of the ankimcp.ai website, the AnkiMCP software, and the AnkiMCP SaaS cloud service (collectively, the "Service"). The Service is operated by **[Anatoly Tarnavsky](https://anatoly.dev)**, sole proprietor ("AnkiMCP", "we", "us"). By accessing or using the Service, you agree to these Terms.

### 1. Acceptance of Terms

By using ankimcp.ai, the AnkiMCP software, or the SaaS cloud service, you agree to be bound by these Terms. If you do not agree, do not use the Service.

### 2. Description of Service

AnkiMCP is a free, open-source Model Context Protocol (MCP) server that connects AI assistants to Anki flashcard software. The Service includes:

- The ankimcp.ai website (documentation, blog, and resources)
- The community forum at forum.ankimcp.ai
- The AnkiMCP software distributed via GitHub
- The AnkiMCP SaaS cloud service — a hosted tunnel service that enables LLM clients (such as ChatGPT and Claude.ai) to connect to your local Anki installation over the internet via secure WebSocket tunnels
- **Hosted Anki** — an experimental part of the SaaS Service that runs a copy of the Anki desktop application on AnkiMCP's cloud servers, reachable both by LLM clients over MCP and by you through an in-browser remote desktop

### 3. Open-Source License

The **client-side components** of AnkiMCP — such as the [CLI server](https://github.com/ankimcp/anki-mcp-server) and the [Anki add-on](https://github.com/ankimcp/anki-mcp-server-addon), together with any other software we distribute via GitHub — are open source, distributed under the licenses specified in their repositories. Your use of that software is governed by those licenses.

The **SaaS platform** — the tunnel infrastructure, the dashboard, and the systems that provision and manage Hosted Anki instances — is **not** open source. It is proprietary software operated by us and made available to you as a service under these Terms.

### 4. Use at Your Own Risk

The Service is provided **"as is"** and **"as available"** without warranties of any kind, either express or implied. We do not guarantee that:

- The Service will be uninterrupted or error-free
- The software will be compatible with all systems or Anki versions
- AI-generated flashcard content will be accurate or complete
- The SaaS tunnel service will be available at all times or at any specific uptime level
- LLM clients will always be able to connect to your tunnel
- The Hosted Anki feature — which is **experimental** — will remain available, or that a hosted instance will be reachable without delay (hosted instances sleep when idle and take time to wake)

You are solely responsible for your use of the software and any flashcard content created through it.

### 5. User Responsibilities

You agree to:

- Use the Service in compliance with all applicable laws
- Not use the Service to create harmful, illegal, or infringing content
- Not attempt to disrupt or overload the website or any related infrastructure

### 6. Community Forum (forum.ankimcp.ai)

We operate a community forum powered by [Discourse](https://www.discourse.org), self-hosted on AnkiMCP infrastructure. The following additional terms apply when you use the forum.

#### Account Registration

- Forum accounts are managed through our self-hosted Keycloak identity provider. You may sign in with Google, GitHub, or email/password.
- You may create one account per person. Creating multiple accounts to evade moderation or manipulate discussions is prohibited.
- You must be at least **13 years old** to create a forum account.
- You are responsible for keeping your account credentials secure.

#### Acceptable Use

When using the forum, you agree **not** to:

- **Spam** — post unsolicited promotions, advertisements, or repetitive content
- **Harass** — target, threaten, bully, or intimidate other users
- **Post illegal content** — share anything that violates applicable laws
- **Impersonate** — pretend to be another person or entity
- **Dox** — publish private information about others without consent
- **Evade bans** — create new accounts after being suspended or banned
- **Disrupt** — intentionally interfere with the forum's operation or other users' experience

#### User-Generated Content

- You retain ownership of the content you post on the forum.
- By posting, you grant AnkiMCP a **non-exclusive, royalty-free license** to display, distribute, and archive your content as part of forum operations.
- This license ends when you delete your content, except where your posts have been quoted or referenced by others, or exist in system backups.
- We do not claim ownership of your posts, nor do we sell user content.

#### Moderation

- Moderators and administrators may **edit, move, close, or delete** posts or topics that violate these Terms or disrupt the community.
- Moderators may **view IP addresses** associated with posts for anti-abuse purposes.
- Users may be **warned, temporarily suspended, or permanently banned** for violations.
- If you believe a moderation action was taken in error, you may appeal by contacting [support@ankimcp.ai](mailto:support@ankimcp.ai).

#### Direct Messages

- Direct messages on the forum are private between participants. However, administrators may access direct messages when investigating reported abuse or violations of these Terms.
- Do not use direct messages for spam, harassment, or other prohibited conduct.

#### Account Termination

- You may delete your account at any time through your forum profile settings.
- We may suspend or delete accounts that violate these Terms.
- When an account is deleted, posts are **anonymized** (author attribution removed) but post content is retained to preserve discussion continuity.

### 7. SaaS Cloud Service

The AnkiMCP SaaS cloud service ("SaaS Service") provides hosted tunnel infrastructure that enables LLM clients to connect to your local Anki installation. The following additional terms apply when you use the SaaS Service.

#### Account Registration and Eligibility

- SaaS accounts are managed through our self-hosted Keycloak identity provider. You may sign in with Google, GitHub, or email/password.
- You must be at least **13 years old** to create a SaaS account.
- You may create one SaaS account per person.
- You are responsible for keeping your account credentials secure. You are responsible for all activity that occurs under your account.
- You must provide accurate information when creating your account.

#### Subscription Tiers

The SaaS Service currently offers three subscription tiers:

- **Free tier:** includes a monthly allowance of tunnel requests (currently 100 authenticated ("signed-in") and 1,000 unauthenticated ("authless") requests per month). No payment required. Available to all registered users.
- **Plus tier:** removes those limits (unlimited requests) for a recurring fee (currently $5 per month). See "Payments, Refunds, and Cancellation" below for billing terms.
- **Pro tier:** includes everything in the Plus tier and adds the **Hosted Anki** feature (see below) for a recurring fee (currently $15 per month). Hosted Anki is experimental; the Pro tier's features, availability, and pricing may change while the feature matures.

We reserve the right to modify tier features, request allowances, introduce new tiers, or adjust pricing with reasonable notice. Changes to paid tier pricing will not apply to active subscription periods.

#### Payments, Refunds, and Cancellation

Paid tiers (Plus and Pro) are billed as recurring subscriptions. The following terms apply to all paid subscriptions.

- **Payment processor (merchant of record).** Payments for paid tiers are processed by **Paddle** (Paddle.com Market Limited and its affiliates), which acts as the **merchant of record** for your purchase. This means Paddle — not AnkiMCP — is the seller of record for the transaction, handles billing, and issues any refunds. When you buy a paid subscription, **Paddle's Buyer Terms and Refund Policy also apply** to that purchase, in addition to these Terms.
- **Recurring billing and renewal.** Paid subscriptions renew automatically at the end of each billing period until cancelled. Each renewal is charged to your payment method on file through Paddle. To avoid being charged for the next period, **cancel before your renewal date**.
- **Cancelling.** You may cancel a paid subscription at any time — through the subscription-management link in your Paddle receipt or billing email, or by emailing [support@ankimcp.ai](mailto:support@ankimcp.ai). When you cancel, your paid access **continues until the end of the period you have already paid for** and is not renewed after that. We do **not** provide automatic partial refunds for the unused part of a billing period.
- **14-day money-back guarantee.** If you are not satisfied with your **first** payment for a paid subscription, you may request a full refund within **14 days** of that purchase by emailing [support@ankimcp.ai](mailto:support@ankimcp.ai). This voluntary guarantee applies to a first-time subscription purchase and does not apply to subsequent renewals.
- **Statutory rights unaffected.** Nothing in this section limits any refund or cancellation rights you may have under applicable law. In particular, consumers in the EU, EEA, and UK generally have a **14-day right of withdrawal** on digital purchases (which may no longer apply once a digital service has been fully performed, or where you have agreed that it begins immediately). Where these statutory rights apply, they are in addition to the guarantee above.
- **How refunds are issued.** Approved refunds are processed by Paddle to your original payment method where possible. Depending on your payment provider, a refund may take a number of days to appear.

#### Tunnel Usage and Fair Use

- You may not share your tunnel credentials with others or allow others to use your tunnel.
- You may not use the tunnel service for purposes unrelated to Anki flashcard management via MCP.
- You may not use the tunnel to transmit illegal, harmful, or infringing content.
- You may not attempt to reverse-engineer, probe, or exploit the tunnel infrastructure.
- We reserve the right to impose rate limits, connection time limits, or other usage restrictions to ensure fair access for all users.

#### LLM Client Connections

- The tunnel supports two connection modes: **authenticated**, where LLM clients connect via OAuth 2.0 (Dynamic Client Registration), and **authless**, which is **disabled by default**.
- If you enable **Authless access** in your Tunnel Dashboard, you receive a private URL containing a secret identifier. This URL grants access to your Anki through your tunnel **without any sign-in**: anyone who obtains it can read and modify your Anki data until you disable authless access or regenerate the URL. You are solely responsible for keeping this URL confidential — treat it like a password.
- You are responsible for deciding which LLM clients to authorize to access your Anki data.
- We do not control, endorse, or take responsibility for the behavior of third-party LLM clients that connect to your tunnel.

#### Hosted Anki (Experimental)

Hosted Anki is an **experimental** feature available on the Pro tier. It runs a copy of the Anki desktop application on our cloud servers, which you can reach both through LLM clients over MCP and through an in-browser remote desktop. The following additional terms apply when you use Hosted Anki.

- **Experimental status.** Hosted Anki is offered on an experimental, best-effort basis. We may change, limit, or discontinue it at any time, with or without notice. Availability, performance, and features are not guaranteed.
- **Cloud hosting of your collection.** When you use Hosted Anki, your Anki collection and media files are stored on persistent storage on AnkiMCP's servers so that your hosted instance can run and be reached by your AI. You retain ownership of this content; we store it solely to operate the feature for you.
- **Sleep and wake.** To conserve resources, a hosted instance is stopped ("sleeps") after a period of inactivity and is started again automatically on your next request. Waking a sleeping instance takes time (typically tens of seconds), during which requests may be delayed or fail.
- **Precedence over local Anki.** While you have a running hosted instance, it takes precedence over any locally connected Anki installation for the purposes of routing your AI's requests.
- **AnkiWeb sync.** Hosted Anki supports syncing with AnkiWeb, but you sign in to AnkiWeb yourself from within the remote desktop session. We do **not** store, request, or have access to your AnkiWeb password.
- **Deletion is permanent; keep your own backups.** If you delete a hosted instance — or if it is removed following account termination — the collection and media stored for that instance are **permanently deleted and cannot be recovered**. You are solely responsible for maintaining your own backups (for example, via AnkiWeb sync or by exporting your collection). We are not liable for any loss of data stored in a hosted instance.
- **Acceptable use of the remote desktop.** The acceptable-use expectations that apply to the tunnel service also apply to the in-browser remote desktop. You may not use the remote desktop for anything other than managing your own Anki collection, and you may not use it to store, transmit, or process illegal, harmful, or infringing content, to run unrelated software or workloads, or to probe, overload, or exploit our infrastructure.

#### Service Availability

- The SaaS Service is provided on a **best-effort basis**. We do not offer any service level agreement (SLA) or uptime guarantee at this time.
- We may perform maintenance, updates, or service changes that result in temporary downtime, with or without advance notice.
- We are not liable for any loss or damage resulting from service interruptions, including but not limited to lost connections, failed LLM requests, or unavailability of tunnels.

#### Account Suspension and Termination

- We may suspend or terminate your SaaS account if you violate these Terms, abuse the service, or engage in activity that threatens the security or availability of the service for other users.
- We will make reasonable efforts to notify you before or at the time of suspension, except where immediate action is necessary for security reasons.
- You may delete your SaaS account at any time by contacting [support@ankimcp.ai](mailto:support@ankimcp.ai). Account deletion removes your user data, tunnel configuration, OAuth client mappings, and subscription history.
- Upon termination (whether by you or by us), your tunnel immediately stops functioning and all LLM client access is revoked. Any Hosted Anki instance associated with your account is stopped and removed, and the collection and media stored for it are permanently deleted.

### 8. Data Processing and Your Anki Data

This section clarifies how your Anki flashcard data is handled when using the SaaS Service. How your data is handled depends on which feature you use: the **tunnel** relays your data without storing it, while **Hosted Anki** stores your collection on our servers so it can run there.

#### Data Transit, Not Data Storage (Tunnel)

- When you use the SaaS tunnel, your Anki flashcard data passes through our servers in real-time as it is relayed between the LLM client and your local Anki installation.
- Your flashcard data is **temporarily present in server memory** during transit but is **never written to disk, logged, stored in a database, or otherwise persisted** by our service.
- We do **not** read, inspect, analyze, index, or use the content of your flashcards or LLM conversations for any purpose.

#### Data Storage (Hosted Anki)

- Hosted Anki is different from the tunnel: to run a copy of Anki on our servers, your **Anki collection and media files are stored on persistent storage** on AnkiMCP infrastructure for as long as your hosted instance exists.
- We store this content solely to operate the feature for you. We do **not** read, inspect, analyze, index, or use the content of your collection for any purpose other than running your hosted instance and serving your own requests.
- Your **AnkiWeb password is never stored, transmitted to, or accessible by AnkiMCP.** If you sync with AnkiWeb, you enter your AnkiWeb credentials yourself inside your remote desktop session, directly with AnkiWeb.
- When you delete a hosted instance, the stored collection and media for that instance are **permanently removed** and cannot be recovered. See "Hosted Anki (Experimental)" above regarding backups.

#### Your Responsibility

- **You own your Anki data.** We do not claim any rights to the content of your flashcards.
- You are solely responsible for the content stored in your Anki installation and any modifications made through LLM interactions.
- You are responsible for maintaining backups of your Anki data. We are not liable for any data loss or corruption resulting from the use of the tunnel service, LLM interactions, or any other cause.
- You are responsible for evaluating the accuracy and appropriateness of any content generated by LLM clients and added to your Anki decks.

#### Security

- Connections between your AnkiMCP client (the add-on or the CLI) and our tunnel server use TLS encryption.
- Connections between LLM clients and our tunnel server use TLS encryption.
- Despite these measures, no system is perfectly secure. You acknowledge that transmitting data over the internet involves inherent risks.

### 9. Intellectual Property

- **AnkiMCP** project content, documentation, and branding are owned by the project maintainers
- **Anki** is a registered trademark of Ankitects Pty Ltd. This project is NOT affiliated with Ankitects
- User-created flashcard content remains the property of the respective users

### 10. Third-Party Services

The Service integrates with or relies on third-party services including but not limited to:

- Anki and AnkiConnect
- AI assistant providers (e.g., Anthropic, OpenAI)
- GitHub for software distribution
- [Discourse](https://www.discourse.org) (self-hosted) for the community forum
- [Keycloak](https://www.keycloak.org) (self-hosted) for forum authentication, SaaS authentication, and LLM OAuth
- A third-party email delivery service for forum email notifications
- LLM client providers (e.g., OpenAI ChatGPT, Anthropic Claude) — these services connect to your tunnel via OAuth. We facilitate the OAuth authentication flow but do not control how these providers process your data once it reaches them.

We are not responsible for the availability, terms, or policies of these third-party services.

**Important:** When you authorize an LLM client to access your Anki data through the tunnel, that LLM provider receives your flashcard data according to their own terms and privacy policies. We recommend reviewing the terms of any LLM service before granting it access to your tunnel. We are not responsible for how LLM providers handle your data after it leaves our tunnel.

### 11. Limitation of Liability

To the fullest extent permitted by law, the AnkiMCP project and its maintainers shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the Service.

Without limiting the above, we are specifically not liable for:

- **Data loss or corruption** in your Anki installation, or in any Hosted Anki instance (including data permanently lost when an instance sleeps, stops, is deleted, or is removed), resulting from LLM interactions, tunnel usage, Hosted Anki usage, or any other cause
- **Service interruptions** including tunnel downtime, failed connections, or unavailability of the SaaS Service
- **LLM behavior** including incorrect, harmful, or inappropriate content generated by third-party LLM clients connected to your tunnel
- **Unauthorized access** resulting from compromised account credentials, OAuth tokens, or tunnel URLs that you have shared or failed to secure
- **Consequential damages** such as lost study time, missed exams, or any other impact resulting from service unavailability or malfunction

For paid subscription users, our total aggregate liability for any claims arising from the SaaS Service shall not exceed the amount you paid for the SaaS Service in the **twelve (12) months** preceding the claim.

### 12. Changes to Terms

We may update these Terms from time to time. Changes will be posted on this page with an updated effective date. Continued use of the Service after changes constitutes acceptance of the new Terms.

For material changes that significantly affect your rights or obligations (such as changes to subscription pricing or data handling), we will make reasonable efforts to notify active SaaS users via email at least **14 days** before the changes take effect.

### 13. Contact

For questions about these Terms, contact us at [support@ankimcp.ai](mailto:support@ankimcp.ai).

The Service is operated by **[Anatoly Tarnavsky](https://anatoly.dev)**, sole proprietor.
