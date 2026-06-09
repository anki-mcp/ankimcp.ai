---
title: "How to Connect Claude to Anki with AnkiMCP"
linkTitle: "Connect Claude to Anki"
description: "Choose how to connect Claude to Anki with AnkiMCP: Claude on the web, Claude Desktop, or Claude Code. Compare the three ways and pick the right one."
keywords:
  - claude anki
  - anki claude integration
  - connect claude to anki
  - claude anki mcp
  - anki claude
weight: 1
sitemap_priority: 0.8
aliases:
  - /docs/installation/desktop/
---

**There are three ways to connect Claude to Anki, and the one you pick decides where Anki shows up: on the web, in the Claude Desktop app, or in Claude Code.**

AnkiMCP lets Claude read your decks and build cards for you. Claude on the web reaches everywhere — web, desktop, and your phone — but needs a subscription. Claude Desktop and Claude Code are free, but each works on one computer only. Pick the path that matches how you use Claude.

## The three ways to connect

Each method connects Claude to Anki, but they differ in **where** Anki then works and what they cost.

| Connect via | Where Anki then works | Cost |
|---|---|---|
| **Claude on the web** | web + desktop + mobile (synced; mobile in beta) | subscription |
| **Claude Desktop** | that desktop app only | free |
| **Claude Code** | Claude Code only, that computer | free |

Claude on the web connects from Anthropic's cloud, so it follows your account across web, desktop, and phone. The cloud can't see your computer, so it bridges the gap with a public **tunnel**, a subscription service. Claude Desktop and Claude Code run **locally**, next to Anki. That makes them free, but each reaches Anki on that one computer only.

If you're unsure, start with **Claude Desktop**. It's the fastest free way to try Claude with your cards, and you can add the web connector later.

## Set it up — pick your Claude

Choose your tab below and follow the steps. All three need **Anki open** with the **AnkiConnect plugin** (code `2055492159`).

{{< tabs >}}
{{< tab name="Web" >}}

### Claude on the web (and mobile)

Connect Anki to claude.ai through the AnkiMCP tunnel. The connector follows your account, so it works on the web, the desktop app, and your phone (mobile is in beta).

**What you need:**

- **Anki open** with the **AnkiConnect plugin** (code `2055492159`).
- An **AnkiMCP tunnel account** (a paid subscription).
- A **Claude account** at [claude.ai](https://claude.ai/) (any plan).
- **Node.js 22.12.0 or newer** from [nodejs.org](https://nodejs.org/).

1. In Anki, go to **Tools → Add-ons → Get Add-ons...**, enter code `2055492159`, click **OK**, and restart Anki. Check it at [http://localhost:8765](http://localhost:8765) — you should see `AnkiConnect`.
2. Open a terminal and run the tunnel:

   ```bash
   npx @ankimcp/anki-mcp-server --tunnel
   ```

3. Your browser opens an AnkiMCP approval page. Click to approve and sign in (once only). Keep this terminal running.
4. Copy the public tunnel URL the terminal prints.
5. In [claude.ai](https://claude.ai/), go to **Settings → Connectors → Add custom connector**, paste the URL, and save.

On **Free** plans you can add only **one** custom connector.

<!-- VERIFY: exact claude.ai custom-connector URL format / streamable-HTTP endpoint -->

<!-- screenshot: claude.ai Settings → Connectors with the "Add custom connector" dialog and the pasted tunnel URL -->

{{< /tab >}}
{{< tab name="Desktop" >}}

### Claude Desktop app

Drag one bundle file into the Claude Desktop app. It's free, runs on your own computer, and needs no config files, no coding, and no Node.js.

**What you need:**

- **Claude Desktop** from [claude.ai/download](https://claude.ai/download).
- **Anki** on the same computer, open, with the **AnkiConnect plugin** (code `2055492159`).
- The **AnkiMCP bundle** (a `.mcpb` file). You'll download it below.

1. In Anki, go to **Tools → Add-ons → Get Add-ons...**, enter code `2055492159`, click **OK**, and restart Anki. Check it at [http://localhost:8765](http://localhost:8765) — you should see `AnkiConnect`.
2. Download the latest `.mcpb` file from the [AnkiMCP Releases page](https://github.com/ankimcp/anki-mcp-server/releases).
3. In Claude Desktop, go to **Settings → Extensions**, drag and drop the `.mcpb` file into the window, and click **Install**.
4. Quit Claude Desktop fully, then reopen it. Keep Anki open.

The bundle self-configures the AnkiConnect address to `http://localhost:8765`. You don't need to change it.

<!-- VERIFY: confirm the Settings → Extensions drag-and-drop path matches the current Claude Desktop on Windows -->

<!-- screenshot: Claude Desktop Settings → Extensions showing the AnkiMCP extension installed -->

{{< /tab >}}
{{< tab name="Code" >}}

### Claude Code

Add the AnkiMCP server to Claude Code with one command. It's free, runs locally, and needs no account.

**What you need:**

- **Claude Code** installed and working in your terminal.
- **Node.js 22.12.0 or newer** from [nodejs.org](https://nodejs.org/).
- **Anki** open, with the **AnkiConnect plugin** (code `2055492159`).

1. In Anki, go to **Tools → Add-ons → Get Add-ons...**, enter code `2055492159`, click **OK**, and restart Anki. Check it at [http://localhost:8765](http://localhost:8765) — you should see `AnkiConnect`.
2. Run this command in your terminal:

   ```bash
   claude mcp add --transport stdio anki -- npx -y @ankimcp/anki-mcp-server --stdio
   ```

   This adds the server at **local** scope (current project only). To use it in every project, add `--scope user`.

3. Verify the connection:

   ```bash
   claude mcp list
   ```

   You should see `anki` with a connected status.

{{< /tab >}}
{{< /tabs >}}

To confirm any setup, open Claude with Anki running and ask: **"List my Anki decks."** If Claude names your decks, the connection works.

## Common questions

**Which option works on my phone?**
Claude on the web. Once you add the connector on claude.ai, it syncs to the Claude mobile app after you log in. Mobile support is in beta, so expect rough edges.

**Which option is free?**
Claude Desktop and Claude Code are both free. They run on your computer, next to Anki. Claude on the web needs a subscription, because it connects through a managed tunnel.

**Do I need to keep Anki open?**
Yes, for all three methods. Claude reaches your cards only while Anki is running, with the AnkiConnect plugin installed.

**Does the Desktop or Claude Code setup sync to Claude on the web or my phone?**
No. Both run locally and reach only the Anki on that computer. To reach Anki from a browser or your phone, use the **Web** tab above.

**What if I use Cursor, Cline, or another tool?**
Those aren't Claude apps. To connect them, see [Connect coding tools](/docs/how-to/connect-mcp-clients/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
