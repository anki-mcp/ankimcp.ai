---
title: "How to Connect Claude to Anki with AnkiMCP"
linkTitle: "Connect Claude to Anki"
description: "Connect Claude Desktop to Anki in minutes with the AnkiMCP bundle. Drag, drop, and let Claude read and build your flashcards for you."
keywords:
  - claude anki
  - anki claude integration
  - connect claude to anki
  - claude anki add-on
  - claude anki mcp
  - anki mcp claude
weight: 1
sitemap_priority: 0.8
aliases:
  - /docs/installation/desktop/
---

**Connect Claude Desktop to Anki by dragging one file into Claude, so Claude can see your decks and create cards for you.**

You'll download the AnkiMCP bundle, drop it into Claude Desktop's Extensions, and install a small Anki plugin. After that, you can ask Claude about your cards in plain language. No config files, no coding.

## What you need

- **Claude Desktop** installed. Download the desktop app from [claude.ai/download](https://claude.ai/download).
- **Anki** installed on the same computer. Get it from [apps.ankiweb.net](https://apps.ankiweb.net/).
- The **AnkiConnect plugin** for Anki. You'll add it below. It lets the bundle reach your cards.
- The **AnkiMCP bundle** (a `.mcpb` file). You'll download it below.

You do **not** need to install Node.js. The bundle includes everything needed to run locally, and Claude Desktop runs it for you.

**Time:** about 5 minutes.

## Step 1: Install AnkiConnect in Anki

AnkiConnect is the plugin that lets the bundle talk to your collection.

1. Open Anki.
2. Go to **Tools → Add-ons → Get Add-ons...**
3. Enter this code: `2055492159`
4. Click **OK**, then restart Anki.

To confirm it works, open [http://localhost:8765](http://localhost:8765) in your browser. You should see the plain text `AnkiConnect`.

<!-- screenshot: Anki "Install Add-on" dialog with the code 2055492159 entered -->

## Step 2: Download the AnkiMCP bundle

Go to the [AnkiMCP Releases page](https://github.com/ankimcp/anki-mcp-server/releases) on GitHub.

Download the latest `.mcpb` file. It's the bundle that connects Claude to Anki.

<!-- screenshot: GitHub Releases page with the .mcpb file highlighted -->

## Step 3: Install the bundle in Claude Desktop

1. Open Claude Desktop.
2. Go to **Settings → Extensions**.
3. Drag and drop the `.mcpb` file into the Extensions window.
4. Click **Install** when Claude asks.

The bundle self-configures. It sets the AnkiConnect address to `http://localhost:8765`, which is correct for most setups. You don't need to change it.

<!-- screenshot: Claude Desktop Settings → Extensions showing the AnkiMCP extension installed -->

<!-- VERIFY: confirm the Settings → Extensions drag-and-drop path matches the current Claude Desktop on Windows -->

## Step 4: Restart Claude Desktop

Quit Claude Desktop fully, then open it again. Claude loads the new extension at startup.

Keep Anki open. The bundle only reaches your cards while the Anki app is running.

## Check it worked

With Anki open, ask Claude: **"List my Anki decks."**

If Claude names your decks, the connection works. You can now ask it to make cards, search your collection, or review with you.

## Fix common problems

**Claude can't find my decks.**
Make sure Anki is open. The bundle only works while the Anki app is running. Then restart Claude Desktop.

**I don't see `AnkiConnect` in my browser at localhost:8765.**
The AnkiConnect plugin isn't running. Reinstall it with code `2055492159`, then restart Anki and try again.

**The extension installed but won't connect.**
Check that the extension's AnkiConnect URL is `http://localhost:8765`. Open **Settings → Extensions** in Claude Desktop to confirm, then restart both Anki and Claude.

## Next steps

- Prefer the add-on, or want the difference? See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/). The add-on is the simpler general-purpose path, but for Claude Desktop, this bundle is the quickest.
- Want Claude to reach Anki from another device? That uses a subscription-based [remote tunnel](https://github.com/ankimcp/anki-mcp-server#tunnel--recommended).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
