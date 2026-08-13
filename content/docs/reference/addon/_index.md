---
title: "Anki Add-on Reference"
linkTitle: "Anki add-on"
description: "Reference for the AnkiMCP Anki add-on: every MCP tool your AI assistant can call, and every configuration key you can change, with types and defaults."
keywords:
  - AnkiMCP add-on reference
  - Anki MCP tools
  - AnkiMCP configuration
  - Anki add-on settings
  - MCP tools list
weight: 1
sitemap_priority: 0.7
---

**This section documents the AnkiMCP add-on — the version that installs inside the Anki desktop app and starts on its own.** It's a lookup section, not a tutorial: exact names, exact defaults, exact behaviour.

The **AnkiMCP CLI** is a separate product with its own tools and its own settings, documented separately. Nothing on these pages describes the CLI. If you're not sure which one you have, see [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).

## Pages in this section

- **[Tools](tools/)** — every tool, resource and prompt the add-on exposes to your AI assistant, grouped by area, with the destructive opt-in ones flagged.
- **[Configuration](configuration/)** — every configuration key, its type, its default, and what it changes.

## Where to find these settings

Open Anki, then go to **Tools → Add-ons → AnkiMCP Server → Config** to edit the JSON directly, or **Tools → AnkiMCP Server Settings…** for the dialog.

## If you're just getting started

These pages assume you already have the add-on installed and connected. If you don't:

- [Get started](/docs/get-started/) — install the add-on and make your first cards.
- [Connect AI to Anki](/docs/how-to/) — recipes for Claude, ChatGPT and other MCP clients.
- [Remote access security](/docs/concepts/remote-access-security/) — what changes when you expose the add-on beyond your own machine.

The add-on's source code lives in the [anki-mcp-server-addon repository](https://github.com/ankimcp/anki-mcp-server-addon) on GitHub.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects.*
