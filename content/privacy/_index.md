---
title: "Privacy Policy"
description: "Privacy Policy for ankimcp.ai, the AnkiMCP open-source project, and the AnkiMCP SaaS cloud service."
sitemap_priority: 0.3
---

## Privacy Policy

**Effective Date:** June 30, 2026

{{< callout type="info" >}}
**The short version.** This summary is for convenience only — the full policy below is what applies.

- The main website sets **no cookies** and uses anonymous analytics. No account is needed.
- Your flashcards **only pass through** our tunnel servers — they are never stored, logged, or read.
- The optional **Hosted Anki** feature is different: it runs a copy of Anki on our servers, so your collection and media **are stored there** while your instance exists and are permanently removed when you delete it. Your **AnkiWeb password is never stored** — you enter it yourself inside the remote desktop.
- The community forum and the cloud service each need their own account; the forum and the SaaS dashboard use cookies to keep you signed in.
- Tunnel connection logs (times and IP addresses) are kept for up to **90 days**; service-monitoring data for up to **30 days**.
- The newsletter stores only your email address; you can unsubscribe at any time.
- Email [support@ankimcp.ai](mailto:support@ankimcp.ai) to see or delete the data we hold about you.
{{< /callout >}}

This Privacy Policy describes how ankimcp.ai ("Website"), the AnkiMCP software ("Software"), and the AnkiMCP SaaS cloud service ("SaaS Service") handle your information.

### 1. Information We Collect

#### Website Analytics
We use [Umami](https://umami.is), a privacy-focused, self-hosted analytics platform. Umami collects:

- Page views and referrer URLs
- Browser type and operating system
- Country-level location (from IP, which is not stored)

Umami **does not use cookies**, does not track users across sites, and does not collect personal information. All data is aggregated and anonymous.

#### Newsletter
If you subscribe to our newsletter via [MailerLite](https://www.mailerlite.com), we collect your **email address**. MailerLite acts as our data processor and stores your email on their servers. You can unsubscribe at any time using the link in every email.

#### Hosting
This website is hosted on [GitHub Pages](https://pages.github.com). GitHub may collect technical information such as IP addresses in server logs according to their own [Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement).

#### Community Forum (forum.ankimcp.ai)
We operate a self-hosted [Discourse](https://www.discourse.org) community forum. When you use the forum, we collect:

- **Account information:** email address, username, and display name. Accounts are created through our self-hosted [Keycloak](https://www.keycloak.org) identity provider, which supports Google and GitHub social login as well as email/password registration.
- **Posts and messages:** all content you publish, including topics, replies, and direct messages.
- **Uploaded files:** images and attachments you upload to posts.
- **IP addresses:** logged for security and anti-abuse purposes.
- **Activity data:** page views, read tracking, visit history, and notification preferences.
- **Cookies:** the forum sets `_t` (authentication token) and `_forum_session` (session) cookies, which are required for the forum to function.

All forum data is stored in a self-hosted PostgreSQL database on AnkiMCP infrastructure — no third-party SaaS is involved in data storage. Email notifications from the forum are delivered via [SMTP2GO](https://www.smtp2go.com), a third-party email delivery service.

#### SaaS Cloud Service (AnkiMCP SaaS)

The AnkiMCP SaaS cloud service lets LLM clients (such as ChatGPT and Claude.ai) interact with your Anki — either your local installation via secure tunnels, or a copy of Anki we run for you on our servers (the experimental **Hosted Anki** feature). When you use the SaaS Service, we collect and process the following information.

##### SaaS Account Information

When you create a SaaS account, we collect:

- **Authentication data:** your email address, display name, and Keycloak user ID. If you sign in via Google or GitHub, we also receive your avatar image URL from the social login provider.
- **Account identifiers:** a unique user ID and tunnel UUID assigned to your account.
- **Authentication method:** which social login provider you used, or that you registered with email/password.
- **Cookies:** when you sign in to the SaaS dashboard (web.ankimcp.ai), it sets httpOnly authentication and session cookies. These are required for sign-in and are not used for tracking.

SaaS accounts are managed through our self-hosted [Keycloak](https://www.keycloak.org) identity provider (in the `ankimcp` realm), separate from forum authentication.

##### Tunnel Connection Data

When you connect your local AnkiMCP client (the add-on or the CLI) to the SaaS tunnel server, we collect:

- **Connection metadata:** tunnel UUID, connection timestamps (connect/disconnect), and your IP address.
- **Connection state:** whether your client is currently connected, for display on your dashboard and to route LLM requests.

Connection state is held **in memory only** on the tunnel server and is not persisted to a database. Connection timestamps and IP addresses are recorded in server logs.

##### LLM OAuth Data

When an LLM client connects to your tunnel, we process:

- **OAuth client registrations:** LLM clients register via Dynamic Client Registration in a separate Keycloak realm (`tunnels`). We store the client ID and associated metadata. We do **not** store OAuth access tokens or refresh tokens — those are managed by Keycloak and issued directly to the LLM client.
- **Client-to-user mappings:** we maintain a mapping between registered OAuth clients and your tunnel UUID so that LLM requests can be routed to your client.

The `tunnels` Keycloak realm is **isolated** from your SaaS account realm. LLM providers cannot access your SaaS account information.

##### Subscription Data

We store:

- **Subscription tier:** your current plan (Free, Plus, or Pro).
- **Tier history:** an audit trail of tier changes (upgrades, downgrades) with timestamps.
- **Expiration date:** when your current subscription period ends (for paid plans).

Payment processing is not yet implemented. When it is added, payment is handled by a third-party payment processor — we will not store full credit card numbers. This Privacy Policy will be updated before payment processing goes live.

##### Service Monitoring (OpenTelemetry)

We use [OpenTelemetry](https://opentelemetry.io) to collect service health metrics and request traces. This includes:

- **Performance metrics:** request latency, error rates, and service availability.
- **Request traces:** request paths, HTTP status codes, and timing data across services.
- **Service identifiers:** your user ID or tunnel UUID may appear in trace metadata for debugging purposes.

OpenTelemetry data is used exclusively for service reliability and debugging. It does **not** capture the content of your Anki flashcards or LLM conversations.

##### Data Transit (Anki Flashcard Data)

This is important to understand: when you use the SaaS tunnel, your Anki flashcard data **passes through** our tunnel server on its way between the LLM client and your local Anki installation. Here is how we handle it:

- **No persistent storage:** Anki data is relayed in real-time over WebSocket connections. It is temporarily present in server memory during transit but is **never written to disk, logged, or stored in any database**.
- **No inspection or analysis:** we do not read, index, analyze, or use the content of your flashcards or LLM requests/responses.
- **Encryption in transit:** connections between your AnkiMCP client (the add-on or the CLI) and our tunnel server, and between LLM clients and our tunnel server, use TLS encryption.
- **Your data stays yours:** all Anki data remains on your local machine. The tunnel is a pass-through — we are a conduit, not a data controller, with respect to your flashcard content.

##### Hosted Anki Data (Experimental)

Hosted Anki is different from the tunnel. To run a copy of Anki on our servers, we store your Anki data rather than only relaying it. When you use Hosted Anki:

- **Stored collection and media:** your **Anki collection and media files are stored on persistent storage** on AnkiMCP infrastructure. We store this so your hosted instance can run and be reached by your AI (and by you through the remote desktop). We store it only to operate the feature — we do not read, index, analyze, or use its content for any other purpose.
- **Remote desktop sessions:** when you open your hosted Anki through the in-browser remote desktop, the session streams the running desktop to your browser. We may process operational data needed to run and route the session (such as session and connection state, timing, and IP address for the connection), but we do not record the contents of your screen or capture what you type.
- **AnkiWeb password is never stored:** if you sync your hosted instance with AnkiWeb, you enter your AnkiWeb credentials yourself, inside your remote desktop session, directly with AnkiWeb. Your AnkiWeb password is **never stored, transmitted to, or accessible by AnkiMCP.**
- **Retention:** your stored collection and media persist for as long as your hosted instance exists. When you delete the instance (or when it is removed after account deletion), that data is **permanently removed** and cannot be recovered. You are responsible for your own backups — see [Data Retention](#5-data-retention) below.

### 2. Information We Do Not Collect

- **No cookies** are set by the main website (ankimcp.ai). The community forum (forum.ankimcp.ai) and the SaaS dashboard (web.ankimcp.ai) use cookies for authentication — see the respective sections above.
- **No user accounts** are required on the main website (ankimcp.ai). The community forum and the SaaS cloud service each require separate accounts — see the respective sections above.
- **No personal data** is collected through website analytics.
- **The AnkiMCP software**, when used in local-only mode (without the SaaS tunnel), runs entirely on your machine and **does not send any data** to our servers or any third party. When used with the SaaS tunnel service, flashcard data passes through our servers in transit but is not stored — see [Data Transit](#data-transit-anki-flashcard-data) above.
- **No flashcard content** is stored, logged, or analyzed by the SaaS **tunnel**. We do not have access to the contents of your Anki decks when you use the tunnel. (The optional, experimental **Hosted Anki** feature is the exception: because it runs Anki on our servers, your collection and media are stored there — see [Hosted Anki Data](#hosted-anki-data-experimental) above.)
- **No AnkiWeb password** is ever collected, stored, transmitted to, or accessible by AnkiMCP. If you sync Hosted Anki with AnkiWeb, you enter your AnkiWeb credentials yourself inside your remote desktop session, directly with AnkiWeb.

### 3. Third-Party Services

We rely on the following third-party services:


| Service | Purpose | Their Privacy Policy |
|---------|---------|---------------------|
| GitHub Pages | Website hosting | [GitHub Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement) |
| Umami (self-hosted) | Anonymous analytics | [Umami Privacy](https://umami.is/privacy) |
| MailerLite | Newsletter delivery | [MailerLite Privacy Policy](https://www.mailerlite.com/legal/privacy-policy) |
| Discourse (self-hosted) | Community forum | [Discourse Privacy Policy](https://www.discourse.org/privacy) |
| Keycloak (self-hosted) | Authentication for forum, SaaS accounts, and LLM OAuth | [Keycloak Privacy](https://www.keycloak.org/privacy) |
| SMTP2GO | Forum email notifications | [SMTP2GO Privacy Policy](https://www.smtp2go.com/privacy) |
| PostgreSQL (self-hosted) | SaaS user data and subscription storage | N/A (self-hosted, no third-party access) |
| NATS (self-hosted) | Internal event streaming between SaaS services | N/A (self-hosted, no third-party access) |
| OpenTelemetry (self-hosted) | SaaS service health monitoring | N/A (self-hosted, no third-party access) |

**A note on self-hosted infrastructure:** PostgreSQL, NATS, Keycloak, and OpenTelemetry are all hosted on AnkiMCP-controlled infrastructure. Your SaaS data does not pass through third-party SaaS platforms for storage or processing.

### 4. Your Rights

You have the right to:

- **Unsubscribe** from the newsletter at any time via the unsubscribe link in emails
- **Request deletion** of your email from our newsletter list
- **Request information** about what data we hold about you

Since we use cookieless, anonymous analytics, there is no personal website analytics data to delete or export.

**Forum users** additionally have the right to:

- **Edit or delete** your own posts and direct messages
- **Export your data** via the Discourse profile settings (account data download)
- **Delete your account** via profile settings or by contacting us — this anonymizes your posts (see Data Retention below)
- **Control notifications** — manage email notification preferences in your forum profile

**SaaS users** additionally have the right to:

- **Access your data** — view your account information, connection history, and subscription status through the SaaS dashboard.
- **Delete your account** — request complete deletion of your SaaS account and all associated data by contacting [support@ankimcp.ai](mailto:support@ankimcp.ai). Account deletion removes your user record, tunnel UUID, OAuth client mappings, and subscription history. This action is irreversible.
- **Cancel your subscription** — downgrade from a paid tier to the free tier at any time through the dashboard.
- **Disconnect your client** — disconnect your local AnkiMCP add-on or CLI from the tunnel at any time, immediately stopping all data transit through our servers.
- **Delete Hosted Anki data** — if you use Hosted Anki, delete your hosted instance at any time to permanently remove the collection and media stored for it from our servers.
- **Request data export** — request a copy of all personal data we hold about your SaaS account by contacting [support@ankimcp.ai](mailto:support@ankimcp.ai).

### 5. Data Retention

- **Newsletter emails** are retained until you unsubscribe or request deletion
- **Analytics data** is aggregated and anonymous — no individual user data is stored
- **Forum posts** are retained for as long as the forum operates. Soft-deleted posts are permanently purged after 30 days.
- **Forum IP addresses** are retained for security and anti-abuse purposes
- **Forum account deletion** anonymizes your posts (author replaced with a generic label) but does not remove the post content, as other users may have relied on or replied to it
- **SaaS account data** (email, name, avatar, Keycloak ID) is retained for the lifetime of your account and deleted upon account deletion
- **Tunnel connection logs** (timestamps, IP addresses) are retained in server logs for up to **90 days** and then automatically purged
- **OAuth client registrations** are retained while your account is active. They are deleted when you delete your account
- **Subscription history** (tier changes, timestamps) is retained for the lifetime of your account for audit purposes and deleted upon account deletion
- **OpenTelemetry data** (metrics and traces) is retained for up to **30 days** and then automatically purged. This data is used only for service debugging and does not contain flashcard content
- **In-memory tunnel state** (active connection data) exists only while your client is connected and is lost when the connection ends or the server restarts
- **Hosted Anki data** (your stored collection and media) is retained for as long as the hosted instance exists and is **permanently deleted** when you delete the instance or when it is removed following account deletion. Deletion is irreversible, so you are responsible for maintaining your own backups (for example, via AnkiWeb sync or by exporting your collection)

### 6. Children's Privacy

This website and software are not directed at children under 13. We do not knowingly collect personal information from children.

### 7. Changes to This Policy

We may update this Privacy Policy from time to time. Changes will be posted on this page with an updated effective date.

### 8. Contact

For privacy-related questions or requests, contact us at [support@ankimcp.ai](mailto:support@ankimcp.ai).
