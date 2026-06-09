---
title: "How to Connect Claude Code to Anki"
linkTitle: "Connect Claude Code to Anki"
description: "Connect Claude Code to Anki via MCP. Use the AnkiMCP add-on for a one-command HTTP setup, or the CLI over STDIO. Both run free on your computer."
keywords:
  - claude code anki
  - anki claude code
  - claude code mcp anki
  - claude mcp add anki
  - anki mcp claude code
weight: 3
sitemap_priority: 0.8
---

**Connect Claude Code to Anki with one command, so Claude Code can read your decks and build cards while you work in the terminal.**

The fastest way is the **AnkiMCP add-on**. It runs a local server inside Anki, and you point Claude Code at it. Prefer no add-on? The **CLI** works too. Both are free and run on your computer. This setup lives in Claude Code only, not claude.ai.

## What you need

- **Claude Code** installed and working in your terminal.
- **Anki** open on the same computer. Claude Code reaches your cards only while Anki runs.
- For the add-on: **Anki 25.07 or newer**. Check in **Anki → About**.
- For the CLI: **Node.js 22.12.0 or newer** from [nodejs.org](https://nodejs.org/), plus the **AnkiConnect** plugin.

**Time:** about 5 minutes.

**MCP** (Model Context Protocol) is the open standard that lets AI tools like Claude Code talk to Anki. **STDIO** is a local transport where Claude Code runs the server as a subprocess.

## Connect with the add-on (recommended)

The AnkiMCP add-on runs a local HTTP server inside Anki. It talks to Anki directly, so you don't need Node.js or the AnkiConnect plugin.

1. Open Anki and go to **Tools → Add-ons → Get Add-ons...**
2. Enter this code: `124672614`
3. Click **OK**, then restart Anki.

   The server starts on its own at `http://127.0.0.1:3141/`. You can check its status under **Tools → AnkiMCP Server Settings...**

4. In your terminal, add the server to Claude Code:

   ```bash
   claude mcp add --transport http anki http://127.0.0.1:3141/
   ```

   This adds the server at **local** scope (the current project only). To use it in every project, add `--scope user`:

   ```bash
   claude mcp add --scope user --transport http anki http://127.0.0.1:3141/
   ```

That's it. Keep Anki open so Claude Code can reach your cards.

## Or use the CLI

No add-on, or you prefer the command line? The CLI runs the AnkiMCP server over STDIO. It needs Node.js and the AnkiConnect plugin.

1. In Anki, go to **Tools → Add-ons → Get Add-ons...**, enter code `2055492159`, click **OK**, and restart Anki. To confirm it works, open [http://localhost:8765](http://localhost:8765) in your browser. You should see the text `AnkiConnect`.
2. In your terminal, add the server to Claude Code:

   ```bash
   claude mcp add --transport stdio anki -- npx -y @ankimcp/anki-mcp-server --stdio
   ```

   This adds the server at **local** scope. Add `--scope user` to use it in every project. Claude Code runs the server with npx, so you don't install anything else.

## Check it worked

List your servers to confirm the connection:

```bash
claude mcp list
```

You should see `anki` with a connected status. With Anki open, ask Claude Code: **"List my Anki decks."** If it names your decks, you're done. You can now ask it to make cards or search your collection.

## Common questions

**Add-on or CLI — which should I pick?**
Start with the add-on. It's one command and needs no Node.js or AnkiConnect, because it talks to Anki directly. Pick the CLI if you'd rather not install an add-on, or you already use AnkiConnect.

**Does this work in claude.ai or the Claude mobile app?**
No. This setup reaches Anki from Claude Code on that one computer. It does not sync to claude.ai on the web, desktop, or mobile. To reach Anki from a browser or your phone, see [Connect Claude Web to Anki](/docs/how-to/connect-claude-web/) and use the web option.

**Do I need to keep Anki open?**
Yes. Both methods reach your cards only while the Anki app is running.

## Next steps

- Use Cursor, Cline, or another coding tool? See [Connect coding tools](/docs/how-to/connect-mcp-clients/).
- Want Claude on the web, desktop, or your phone instead? See [Connect Claude Web to Anki](/docs/how-to/connect-claude-web/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
