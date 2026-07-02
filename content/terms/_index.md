---
title: "Terms of Service"
description: "Terms of Service for ankimcp.ai, the Anki MCP open-source project, and the Anki MCP SaaS cloud service."
sitemap_priority: 0.3
---

## Terms of Service

**Effective Date:** June 30, 2026

These Terms of Service ("Terms") govern your use of the ankimcp.ai website, the Anki MCP software, and the Anki MCP SaaS cloud service (collectively, the "Service"). By accessing or using the Service, you agree to these Terms.

### 1. Acceptance of Terms

By using ankimcp.ai, the Anki MCP software, or the SaaS cloud service, you agree to be bound by these Terms. If you do not agree, do not use the Service.

### 2. Description of Service

Anki MCP is a free, open-source Model Context Protocol (MCP) server that connects AI assistants to Anki flashcard software. The Service includes:

- The ankimcp.ai website (documentation, blog, and resources)
- The community forum at forum.ankimcp.ai
- The Anki MCP software distributed via GitHub
- The Anki MCP SaaS cloud service — a hosted tunnel service that enables LLM clients (such as ChatGPT and Claude.ai) to connect to your local Anki installation over the internet via secure WebSocket tunnels

### 3. Open-Source License

The Anki MCP software is distributed under its open-source license as specified in its GitHub repositories — the [CLI server](https://github.com/ankimcp/anki-mcp-server) and the [Anki add-on](https://github.com/ankimcp/anki-mcp-server-addon). Your use of the software is governed by that license.

### 4. Use at Your Own Risk

The Service is provided **"as is"** and **"as available"** without warranties of any kind, either express or implied. We do not guarantee that:

- The Service will be uninterrupted or error-free
- The software will be compatible with all systems or Anki versions
- AI-generated flashcard content will be accurate or complete
- The SaaS tunnel service will be available at all times or at any specific uptime level
- LLM clients will always be able to connect to your tunnel

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

The Anki MCP SaaS cloud service ("SaaS Service") provides hosted tunnel infrastructure that enables LLM clients to connect to your local Anki installation. The following additional terms apply when you use the SaaS Service.

#### Account Registration and Eligibility

- SaaS accounts are managed through our self-hosted Keycloak identity provider (in the `ankimcp` realm, separate from the forum). You may sign in with Google, GitHub, or email/password.
- You must be at least **13 years old** to create a SaaS account.
- You may create one SaaS account per person.
- You are responsible for keeping your account credentials secure. You are responsible for all activity that occurs under your account.
- You must provide accurate information when creating your account.

#### Subscription Tiers

The SaaS Service currently offers two subscription tiers:

- **Free tier:** includes a monthly allowance of tunnel requests (currently 100 authenticated and 1,000 authless requests per month). No payment required. Available to all registered users.
- **Paid tier:** removes those limits (unlimited requests) for a recurring fee (currently $5 per month). Full payment terms will be published when payment processing is implemented.

We reserve the right to modify tier features, request allowances, introduce new tiers, or adjust pricing with reasonable notice. Changes to paid tier pricing will not apply to active subscription periods.

#### Tunnel Usage and Fair Use

- Each account receives a unique tunnel UUID and optional custom slug for LLM client connections.
- You may not share your tunnel credentials with others or allow others to use your tunnel.
- You may not use the tunnel service for purposes unrelated to Anki flashcard management via MCP.
- You may not use the tunnel to transmit illegal, harmful, or infringing content.
- You may not attempt to reverse-engineer, probe, or exploit the tunnel infrastructure.
- We reserve the right to impose rate limits, connection time limits, or other usage restrictions to ensure fair access for all users.

#### LLM Client Connections

- LLM clients connect to your tunnel via OAuth 2.0 (Dynamic Client Registration) through a separate, isolated Keycloak realm (`tunnels`).
- You are responsible for deciding which LLM clients to authorize to access your Anki data.
- We do not control, endorse, or take responsibility for the behavior of third-party LLM clients that connect to your tunnel.
- You may revoke all LLM client access at any time by changing your tunnel slug, which invalidates all existing OAuth tokens.

#### Service Availability

- The SaaS Service is provided on a **best-effort basis**. We do not offer any service level agreement (SLA) or uptime guarantee at this time.
- We may perform maintenance, updates, or service changes that result in temporary downtime, with or without advance notice.
- We are not liable for any loss or damage resulting from service interruptions, including but not limited to lost connections, failed LLM requests, or unavailability of tunnels.

#### Account Suspension and Termination

- We may suspend or terminate your SaaS account if you violate these Terms, abuse the service, or engage in activity that threatens the security or availability of the service for other users.
- We will make reasonable efforts to notify you before or at the time of suspension, except where immediate action is necessary for security reasons.
- You may delete your SaaS account at any time by contacting [support@ankimcp.ai](mailto:support@ankimcp.ai). Account deletion removes your user data, tunnel configuration, OAuth client mappings, and subscription history.
- Upon termination (whether by you or by us), your tunnel immediately stops functioning and all LLM client access is revoked.

### 8. Data Processing and Your Anki Data

This section clarifies how your Anki flashcard data is handled when using the SaaS tunnel service.

#### Data Transit, Not Data Storage

- When you use the SaaS tunnel, your Anki flashcard data passes through our servers in real-time as it is relayed between the LLM client and your local Anki installation.
- Your flashcard data is **temporarily present in server memory** during transit but is **never written to disk, logged, stored in a database, or otherwise persisted** by our service.
- We do **not** read, inspect, analyze, index, or use the content of your flashcards or LLM conversations for any purpose.

#### Your Responsibility

- **You own your Anki data.** We do not claim any rights to the content of your flashcards.
- You are solely responsible for the content stored in your Anki installation and any modifications made through LLM interactions.
- You are responsible for maintaining backups of your Anki data. We are not liable for any data loss or corruption resulting from the use of the tunnel service, LLM interactions, or any other cause.
- You are responsible for evaluating the accuracy and appropriateness of any content generated by LLM clients and added to your Anki decks.

#### Security

- Connections between your Anki MCP client (the add-on or the CLI) and our tunnel server use TLS encryption.
- Connections between LLM clients and our tunnel server use TLS encryption.
- Despite these measures, no system is perfectly secure. You acknowledge that transmitting data over the internet involves inherent risks.

### 9. Intellectual Property

- **Anki MCP** project content, documentation, and branding are owned by the project maintainers
- **Anki** is a registered trademark of Ankitects Pty Ltd. This project is NOT affiliated with Ankitects
- User-created flashcard content remains the property of the respective users

### 10. Third-Party Services

The Service integrates with or relies on third-party services including but not limited to:

- Anki and AnkiConnect
- AI assistant providers (e.g., Anthropic, OpenAI)
- GitHub for software distribution
- [Discourse](https://www.discourse.org) (self-hosted) for the community forum
- [Keycloak](https://www.keycloak.org) (self-hosted) for forum authentication, SaaS authentication, and LLM OAuth
- [SMTP2GO](https://www.smtp2go.com) for forum email notifications
- LLM client providers (e.g., OpenAI ChatGPT, Anthropic Claude) — these services connect to your tunnel via OAuth. We facilitate the OAuth authentication flow but do not control how these providers process your data once it reaches them.

We are not responsible for the availability, terms, or policies of these third-party services.

**Important:** When you authorize an LLM client to access your Anki data through the tunnel, that LLM provider receives your flashcard data according to their own terms and privacy policies. We recommend reviewing the terms of any LLM service before granting it access to your tunnel. We are not responsible for how LLM providers handle your data after it leaves our tunnel.

### 11. Limitation of Liability

To the fullest extent permitted by law, the Anki MCP project and its maintainers shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the Service.

Without limiting the above, we are specifically not liable for:

- **Data loss or corruption** in your Anki installation resulting from LLM interactions, tunnel usage, or any other cause
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
