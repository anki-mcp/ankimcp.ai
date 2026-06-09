---
title: "How to Connect Cursor, Cline & Other MCP Clients to Anki"
linkTitle: "Connect coding tools"
description: "Connect Cursor, Cline, Zed, and other MCP clients to Anki. Add the AnkiMCP server over STDIO so your AI coding assistant can read and build flashcards."
keywords:
  - anki mcp cursor
  - anki mcp server
  - cline mcp client
  - connect cursor to anki
  - mcp server anki
  - anki cli
weight: 5
sitemap_priority: 0.8
aliases:
  - /docs/installation/mcp-clients/
---

**Connect Cursor, Cline, or another MCP client to Anki by adding the AnkiMCP server to your client's config, so your AI coding assistant can read your decks and build cards for you.**

You'll install the AnkiMCP server with npm, add the AnkiConnect plugin to Anki, then paste one config snippet into your client. The client launches the server over STDIO and talks to Anki on your machine. No cloud, no account.

## What you need

- **Node.js 22.12.0 or newer**. Get it from [nodejs.org](https://nodejs.org/). Check your version with `node --version`.
- The **AnkiConnect plugin** for Anki, code `2055492159`. You'll add it below. It lets the server reach your cards.
- **Anki open** on the same computer. The server only reaches your cards while Anki is running.
- A **supported MCP client**: [Cursor](https://www.cursor.com/), [Cline](https://github.com/cline/cline), [Zed](https://zed.dev/), or another client that supports STDIO.

**Time:** about 5 minutes.

**MCP** (Model Context Protocol) is the open standard that lets AI assistants talk to tools like Anki. **STDIO** is the local transport where your client runs the server as a subprocess and talks to it over standard input and output.

## Step 1: Install AnkiConnect in Anki

AnkiConnect is the plugin that lets the server talk to your collection.

1. Open Anki.
2. Go to **Tools → Add-ons → Get Add-ons...**
3. Enter this code: `2055492159`
4. Click **OK**, then restart Anki.

To confirm it works, open [http://localhost:8765](http://localhost:8765) in your browser. You should see the plain text `AnkiConnect`.

<!-- screenshot: Anki "Install Add-on" dialog with the code 2055492159 entered -->

## Step 2: Install the AnkiMCP server

You have two ways to run the server. Pick one.

**Option A: npx (no install).** The config in Step 3 runs the server on demand. You don't install anything now.

**Option B: Global install.** Install the `ankimcp` command once:

```bash
npm install -g @ankimcp/anki-mcp-server
```

## Step 3: Add the server to your client's config

Add the AnkiMCP server to your client's MCP config file. The snippet below uses npx, so it works with no global install.

```json
{
  "mcpServers": {
    "anki-mcp": {
      "command": "npx",
      "args": ["-y", "@ankimcp/anki-mcp-server", "--stdio"],
      "env": {
        "ANKI_CONNECT_URL": "http://localhost:8765"
      }
    }
  }
}
```

If you installed the server globally (Option B), use the `ankimcp` command instead:

```json
{
  "mcpServers": {
    "anki-mcp": {
      "command": "ankimcp",
      "args": ["--stdio"],
      "env": {
        "ANKI_CONNECT_URL": "http://localhost:8765"
      }
    }
  }
}
```

Where the config file lives depends on your client:

- **Cursor**: `~/.cursor/mcp.json` (macOS/Linux) or `%USERPROFILE%\.cursor\mcp.json` (Windows). Create or edit the file, paste the snippet, and save.
- **Cline**: open the Cline extension in VS Code and use its settings UI to add the MCP server. You can also edit `cline_mcp_settings.json` directly.
- **Zed**: install AnkiMCP as an MCP extension through Zed's extension marketplace.

<!-- screenshot: Cursor mcp.json open in the editor with the AnkiMCP server snippet pasted -->

## Step 4: Restart your client

Quit your MCP client fully, then open it again. The client loads the new server at startup.

Keep Anki open. The server only reaches your cards while the Anki app is running.

## Check it worked

With Anki open, ask your assistant: **"List my Anki decks."**

If it names your decks, the connection works. You can now ask it to make cards, search your collection, or review with you.

## Fix common problems

**My client can't find the server, or I see "command not found: npx".**
Install Node.js 22.12.0 or newer from [nodejs.org](https://nodejs.org/). npx ships with Node.js. Then restart your client.

**I see an `ERR_REQUIRE_ESM` error.**
Your Node.js is too old. The server needs version 22.12.0 or newer. Run `node --version` to check, then update Node.js.

**The assistant can't reach Anki.**
Make sure Anki is open and AnkiConnect is installed. Open [http://localhost:8765](http://localhost:8765) in your browser. You should see `AnkiConnect`. If not, reinstall the plugin with code `2055492159` and restart Anki.

**The server doesn't appear in my client.**
Check that your config JSON is valid: no trailing commas, matching quotes and braces. Then restart your client after any change.

<!-- VERIFY: Windows + Cline "spawn npx ENOENT" workaround (command "cmd", args ["/c", "npx", ...]) was in the old doc but is not in the repo README; confirm it's still needed -->

## Next steps

- New to the difference between the add-on and the CLI server? See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).
- Use Claude Desktop too? The [AnkiMCP bundle](/docs/how-to/connect-claude-desktop/) is a faster, drag-and-drop path for it.
- Want your assistant to reach Anki from another device? That uses a subscription-based [remote tunnel](https://github.com/ankimcp/anki-mcp-server#tunnel--recommended).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
