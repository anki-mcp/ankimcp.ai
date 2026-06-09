---
title: "How to Connect Claude Desktop to Anki"
linkTitle: "Connect Claude Desktop to Anki"
description: "Connect the Claude Desktop app to Anki with the free AnkiMCP bundle. Drag one file in, no Node.js and no config editing. Set up in about 5 minutes."
keywords:
  - claude desktop anki
  - claude desktop mcp
  - connect claude desktop to anki
  - claude anki
  - anki mcp claude desktop
weight: 2
sitemap_priority: 0.8
aliases:
  - /docs/installation/desktop/
---

**Connect the Claude Desktop app to Anki by dragging one bundle file into Claude's settings, so Claude can read your decks and build cards for you.**

This is the free, local way to use Claude with your cards. You drop the AnkiMCP bundle into Claude Desktop, keep Anki open, and you're done. No Node.js, no config files, no coding. It works in the Claude Desktop app on this one computer.

## What you need

- **Claude Desktop**, installed from [claude.ai/download](https://claude.ai/download).
- **Anki** on the same computer, open, with the **AnkiConnect plugin** (code `2055492159`). You'll add it in Step 1.
- The **AnkiMCP bundle**, a `.mcpb` file. You'll download it in Step 2.

**Time:** about 5 minutes.

The **`.mcpb` bundle** is a single file that holds the whole AnkiMCP server. Claude Desktop installs it as an extension and runs it for you.

## Step 1: Install AnkiConnect in Anki

AnkiConnect is the plugin that lets the bundle reach your collection.

1. Open Anki.
2. Go to **Tools → Add-ons → Get Add-ons...**
3. Enter this code: `2055492159`
4. Click **OK**, then restart Anki.

To confirm it works, open [http://localhost:8765](http://localhost:8765) in your browser. You should see the plain text `AnkiConnect`.

<!-- screenshot: Anki "Install Add-on" dialog with the code 2055492159 entered -->

## Step 2: Download the AnkiMCP bundle

Get the latest `.mcpb` file from the [AnkiMCP Releases page](https://github.com/ankimcp/anki-mcp-server/releases). Save it somewhere you can find it, like your Downloads folder.

## Step 3: Install the bundle in Claude Desktop

In Claude Desktop, go to **Settings → Extensions**. Drag and drop the `.mcpb` file into the window, then click **Install**.

The bundle self-configures the AnkiConnect address to `http://localhost:8765`. You don't need to change it.

<!-- VERIFY: Windows Settings→Extensions path -->

<!-- screenshot: Claude Desktop Settings → Extensions showing the AnkiMCP extension installed -->

## Step 4: Restart Claude Desktop

Quit Claude Desktop fully, then open it again. Keep Anki open. Claude reaches your cards only while Anki is running.

## Where this works (and how to get it everywhere)

This bundle runs **locally**, next to Anki. That makes it free and private. But it lives in the Claude Desktop app on **this one computer only**.

{{< callout type="info" >}}
**This connection is desktop-only.** It will **not** appear in Claude on the web or on your phone. If you want Anki in Claude **everywhere** — web, desktop, and mobile, synced to your account — set it up through the AnkiMCP add-on instead. That's the better path for global access. See [Connect Claude Web to Anki](/docs/how-to/connect-claude-web/).
{{< /callout >}}

The web path uses a subscription-based tunnel, so Claude can reach your computer from anywhere. The Desktop bundle here is the fastest free way to try Claude with your cards, and you can add the web connector later.

## Check it worked

With Anki open, ask Claude Desktop: **"List my Anki decks."**

If Claude names your decks, the connection works. You can now ask it to make cards, search your collection, or review with you.

## Common questions

**Can I use this on my phone or on claude.ai?**
No. This bundle runs only in the Claude Desktop app on the computer where you installed it. To reach Anki from a browser or your phone, use the add-on and web path instead. See [Connect Claude Web to Anki](/docs/how-to/connect-claude-web/).

**Do I need to keep Anki open?**
Yes. Claude reaches your cards only while Anki is running, with the AnkiConnect plugin installed.

**Claude can't reach Anki. What's wrong?**
Make sure Anki is open and AnkiConnect is installed. Open [http://localhost:8765](http://localhost:8765) in your browser. You should see `AnkiConnect`. If not, reinstall the plugin with code `2055492159` and restart Anki.

**Do I need Node.js for this?**
No. The bundle includes everything it needs. Node.js is only required for the web and coding-tool setups.

## Next steps

- Want Anki in Claude on your phone and the web? See [Connect Claude Web to Anki](/docs/how-to/connect-claude-web/).
- Ready to make cards? Try our [Anki AI prompts](/docs/how-to/anki-ai-prompts/).
- Use Cursor, Cline, or another tool? See [Connect coding tools](/docs/how-to/connect-mcp-clients/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
