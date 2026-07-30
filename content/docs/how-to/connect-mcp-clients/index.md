---
title: "How to Connect Cursor, Cline & Other MCP Clients to Anki"
linkTitle: "Connect coding tools"
description: "Connect Cursor, Cline, and Zed to Anki two ways: the AnkiMCP add-on over local HTTP, or the npx CLI over STDIO. Step-by-step config for each client."
keywords:
  - anki mcp cursor
  - anki mcp server
  - cline mcp client
  - connect cursor to anki
  - mcp server anki
  - zed mcp anki
  - anki mcp http
  - anki cli stdio
weight: 3
sitemap_priority: 0.8
# Tabs repeat headings (What you need, Check it worked, Fix common problems)
# across both panels, so the right-sidebar ToC would list them twice. Hide it.
toc: false
aliases:
  - /docs/installation/mcp-clients/
---

**Connect Cursor, Cline, or Zed to Anki so your AI coding assistant can read your decks and build cards for you. Add the AnkiMCP server to your client's config, keep Anki open, and you're done. No cloud, no account.**

Two ways to connect: the **add-on** (HTTP, recommended) or the **CLI** (STDIO). The add-on is simplest and most capable. Use the CLI only if your client needs STDIO.

**MCP** (Model Context Protocol) is the open standard that lets AI assistants talk to tools like Anki.

{{< tabs >}}

{{< tab name="Add-on (HTTP)" selected=true >}}

**Install the AnkiMCP add-on, then point your client at its local web address. The add-on runs a server inside Anki, so you skip Node.js and any extra add-on.**

The add-on runs a local **HTTP** server at `http://127.0.0.1:3141/`. Your client connects to that address. This is the simplest path and gives access to the most Anki features.

### What you need

- **Anki 25.07 or newer**, open on your computer. Check in **Anki → About**. Get it from [apps.ankiweb.net](https://apps.ankiweb.net/).
- The **AnkiMCP add-on** for Anki, code `124672614`. You'll install it below.
- A **client that supports remote HTTP MCP servers**: [Cursor](https://www.cursor.com/), [Cline](https://github.com/cline/cline), or [Zed](https://zed.dev/).

**Time:** about 3 minutes.

### Step 1: Install the AnkiMCP add-on

The add-on starts a small server inside Anki. It launches on its own every time you open Anki.

1. Open Anki.
2. Go to **Tools → Add-ons → Get Add-ons...**
3. Enter this code: `124672614`
4. Click **OK**, then restart Anki.

The server starts at `http://127.0.0.1:3141/`. You can check its status under **Tools → AnkiMCP Server Settings...**

<img src="install-ankimcp-addon.png" width="582" alt="Anki's Install Add-on dialog with the AnkiMCP add-on code 124672614 entered in the Code field." />

### Step 2: Add the server to your client

Each client points at the same address: `http://127.0.0.1:3141/`. Pick your client below.

**Cursor.** Create or edit `~/.cursor/mcp.json` (macOS/Linux) or `%USERPROFILE%\.cursor\mcp.json` (Windows). Add the server with its `url`:

```json
{
  "mcpServers": {
    "anki-mcp": {
      "url": "http://127.0.0.1:3141/"
    }
  }
}
```

If the file already exists, add only the `anki-mcp` entry inside the existing `mcpServers` block.

**Cline.** In VS Code, open Cline, go to the **MCP Servers** panel, and use the **Remote Servers** tab. Enter a name and the URL `http://127.0.0.1:3141/`, then pick **Streamable HTTP**. To edit the file directly, set `type` to `streamableHttp`:

```json
{
  "mcpServers": {
    "anki-mcp": {
      "url": "http://127.0.0.1:3141/",
      "type": "streamableHttp"
    }
  }
}
```

**Zed.** Open Zed's `settings.json` and add the server under `context_servers` (not `mcpServers`):

```json
{
  "context_servers": {
    "anki-mcp": {
      "url": "http://127.0.0.1:3141/"
    }
  }
}
```

If your settings already have a `context_servers` block, add only the `anki-mcp` entry inside it.

<img src="cursor-mcp-json-http.png" width="416" alt="Cursor's mcp.json open in the editor with an AnkiMCP HTTP server entry pointing at localhost port 3141." />

### Step 3: Restart your client and verify

Quit your client fully, then open it again. With Anki open, ask your assistant: **"List my Anki decks."** If it names your decks, the connection works.

Keep Anki open. The server only reaches your cards while the Anki app is running.

### Fix common problems

**The assistant can't reach Anki.**
Make sure Anki is open. Check the server status under **Tools → AnkiMCP Server Settings...** The server runs at `http://127.0.0.1:3141/`.

**The server doesn't appear in my client.**
Check that your config uses the right key: `mcpServers` for Cursor and Cline, but `context_servers` for Zed. Then restart your client.

**The connection fails or times out.**
Open [http://127.0.0.1:3141/](http://127.0.0.1:3141/) in your browser to confirm the add-on is running. If it isn't, restart Anki. Another app may also be using port 3141.

{{< /tab >}}

{{< tab name="CLI (STDIO)" >}}

**Install the AnkiMCP CLI with npm, add the AnkiConnect add-on to Anki, then paste one config snippet into your client. The client launches the server over STDIO and talks to Anki on your machine.**

Use this path only if your client needs **STDIO**, the local transport where your client runs the server as a subprocess and talks to it over standard input and output.

### What you need

- **Node.js 22.12.0 or newer**. Get it from [nodejs.org](https://nodejs.org/). Check your version with `node --version`.
- The **AnkiConnect add-on** for Anki, code `2055492159`. You'll add it below. It lets the server reach your cards.
- **Anki open** on the same computer. The server only reaches your cards while Anki is running.
- A **client that supports STDIO**: [Cursor](https://www.cursor.com/), [Cline](https://github.com/cline/cline), [Zed](https://zed.dev/), or another.

**Time:** about 5 minutes.

### Step 1: Install AnkiConnect in Anki

AnkiConnect is the add-on that lets the server talk to your collection.

1. Open Anki.
2. Go to **Tools → Add-ons → Get Add-ons...**
3. Enter this code: `2055492159`
4. Click **OK**, then restart Anki.

To confirm it works, open [http://localhost:8765](http://localhost:8765) in your browser. You should see the plain text `AnkiConnect`.

<img src="install-ankiconnect-addon.png" width="585" alt="Anki's Install Add-on dialog with the AnkiConnect add-on code 2055492159 entered in the Code field." />

### Step 2: Install the AnkiMCP CLI

You have two ways to run the server. Pick one.

**Option A: npx (no install).** The config in Step 3 runs the server on demand. You don't install anything now.

**Option B: Global install.** Install the `ankimcp` command once:

```bash
npm install -g @ankimcp/anki-mcp-server
```

### Step 3: Add the server to your client's config

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

- **Cursor**: `~/.cursor/mcp.json` (macOS/Linux) or `%USERPROFILE%\.cursor\mcp.json` (Windows). Create or edit the file, paste the snippet, and save. If the file already exists, add only the `anki-mcp` entry inside the existing `mcpServers` block.
- **Cline**: open the Cline extension in VS Code and use its settings UI to add the MCP server. You can also create or edit `cline_mcp_settings.json` directly.
- **Zed**: open Zed's `settings.json`. Zed uses the key `context_servers` (not `mcpServers`). Inside it, keep the same `command` and `args` fields.

<img src="cursor-mcp-json-stdio.png" width="410" alt="Cursor's mcp.json open in the editor with an AnkiMCP STDIO server entry running the npx @ankimcp/anki-mcp-server command." />

### Step 4: Restart your client

Quit your MCP client fully, then open it again. The client loads the new server at startup.

Keep Anki open. The server only reaches your cards while the Anki app is running.

### Check it worked

With Anki open, ask your assistant: **"List my Anki decks."** If it names your decks, the connection works.

### Fix common problems

**My client can't find the server, or I see "command not found: npx".**
Install Node.js 22.12.0 or newer from [nodejs.org](https://nodejs.org/). npx ships with Node.js. Then restart your client.

**I see an `ERR_REQUIRE_ESM` error.**
Your Node.js is too old. The server needs version 22.12.0 or newer. Run `node --version` to check, then update Node.js.

**The assistant can't reach Anki.**
Make sure Anki is open and AnkiConnect is installed. Open [http://localhost:8765](http://localhost:8765) in your browser. You should see `AnkiConnect`. If not, reinstall the AnkiConnect add-on with code `2055492159` and restart Anki.

**The server doesn't appear in my client.**
Check that your config JSON is valid: no trailing commas, matching quotes and braces. Then restart your client after any change.

<!-- VERIFY: Windows + Cline "spawn npx ENOENT" workaround (command "cmd", args ["/c", "npx", ...]) was in the old doc but is not in the repo README; confirm it's still needed -->

{{< /tab >}}

{{< /tabs >}}

## Common questions

**Which should I use, the add-on or the CLI?**
Use the **add-on** (HTTP). It's the simplest to install and the most capable, and it needs no Node.js or AnkiConnect. Choose the **CLI** (STDIO) only if your client needs STDIO.

**Do I need both?**
No. Pick one. The add-on talks to Anki directly; the CLI talks through the AnkiConnect add-on.

**Does either one work without Anki open?**
No. Both need the Anki desktop app open and running. They act on your real collection, so Anki has to be there.

**Does my client support remote HTTP servers?**
Cursor, Cline, and Zed all do. If your client supports only STDIO, use the CLI tab instead.

## Next steps

- New to the difference between the two paths? See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).
- Use Claude too? See [Connect Claude to Anki](/docs/how-to/connect-claude/#claude-desktop) for web, desktop, and Claude Code.
- Want your assistant to reach Anki from another device? That uses the managed [tunnel](/docs/concepts/remote-vs-local/), which has [free and paid tiers](/pricing/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
