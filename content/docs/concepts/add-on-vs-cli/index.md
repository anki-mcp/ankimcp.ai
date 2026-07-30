---
title: "AnkiMCP Add-on vs CLI: Which Way to Connect Anki to AI?"
linkTitle: "Add-on vs CLI"
description: "AnkiMCP offers two official ways to connect Anki to an AI assistant: the add-on and the CLI. Here's how they differ and which one to pick."
keywords:
  - AnkiMCP add-on
  - Anki MCP CLI
  - connect Anki to AI
  - AnkiConnect
  - Anki MCP server
  - MCP transport
weight: 4
sitemap_priority: 0.8
---

**AnkiMCP gives you two official ways to connect Anki to an AI assistant: an add-on that runs inside Anki, and a CLI (command-line interface) — a program you start by typing a command instead of clicking an icon. Both are built by the same author. For most people, start with the add-on. It's the simplest to install and the most capable.**

This page explains both paths and helps you choose. You need no technical background. The two are complementary, not rivals.

## The short version

The **add-on** installs like any other Anki add-on and starts on its own. **It's the easiest to set up and can do the most with Anki.**

The **CLI** is a separate program you run yourself. You only need it for **STDIO**, the direct connection that some coding tools require. Whichever you choose, Anki must be open and running.

## What is the add-on?

The add-on is a small program written in **Python** that runs **inside the Anki desktop app**. You install it the way you install any Anki add-on, and it starts automatically.

It reaches your cards through Anki's own built-in tools directly. There's nothing else to install — no extra software and no other add-on.

The add-on is also the **more capable** of the two. Because it lives inside Anki, it can reach deep parts the other path can't. That includes **FSRS scheduling** (Anki's modern review-timing system) and the review scheduler itself. It also shares extra information with the AI, like your study stats.

It connects over **HTTP** (the normal web connection), on your computer only, and over the **managed tunnel** for remote access.

## What is the CLI?

The CLI is a standalone **MCP server** written in **Node.js** that runs as a **separate program**, outside of Anki. MCP, the Model Context Protocol, is the open standard that lets AI assistants connect to outside apps.

The CLI reaches Anki through **[AnkiConnect](https://ankiweb.net/shared/info/2055492159)**, a separate Anki add-on (made by others) that you must install first. So this path has two pieces to set up: Node.js and AnkiConnect. Anki still has to be open the whole time.

What the CLI adds is **STDIO**, a direct pipe between two programs on the same computer — no network involved. Many coding tools prefer it. The CLI also supports **HTTP** (local) and the **managed tunnel** (remote).

## How the two compare

Here's a side-by-side look at the main differences.

| | Add-on | CLI |
|---|---|---|
| **Setup** | Install like any Anki add-on; auto-starts | Install Node.js and AnkiConnect, then run it |
| **How it reaches Anki** | Anki's built-in tools, directly | Through the AnkiConnect add-on |
| **Connection type** | **HTTP** (local) + **managed tunnel** (remote) | STDIO + **HTTP** (local) + **managed tunnel** (remote) |
| **What it can do** | More: FSRS scheduling, review scheduler, extra resources | Slightly less; a few niche tools the add-on doesn't have yet |

Both need **Anki open and running**. Neither works on its own without Anki.

## Which should you choose?

**Use the add-on.** It's the simplest to install, has access to more of Anki's features, and is the right choice for almost everyone.

Only choose the **CLI** if you need **STDIO** — the direct program-to-program connection that some coding tools like Cursor or Cline require. It also covers the occasional tool that isn't in the add-on yet.

If you don't need STDIO, the add-on is the answer.

## Connecting remotely

Want your AI assistant to reach Anki from another device or service? Both paths can connect through the same secure managed **tunnel**, using an OAuth login (you sign in to grant access). This managed tunnel has [free and paid tiers](/pricing/), so you skip the manual network setup yourself.

<!-- TODO: link to dedicated remote/tunnel page when it exists -->

Ready to set it up? Follow the step-by-step guide for your AI assistant: [Claude on the web](/docs/how-to/connect-claude/#claude-web), [Claude Desktop](/docs/how-to/connect-claude/#claude-desktop), [Claude Code](/docs/how-to/connect-claude/#claude-code), or [other MCP clients](/docs/how-to/connect-mcp-clients/).

If you're a developer who wants to read the source or contribute, the code lives in the [anki-mcp-server repository on GitHub](https://github.com/ankimcp/anki-mcp-server), with the add-on in its own companion repository.

## Common questions

**Do I need both the add-on and the CLI?**
No. Pick one. Use the add-on unless you need STDIO, the connection some coding tools require.

**Does either one work without Anki open?**
No. Both need the Anki desktop app open and running. They act on your real collection, so Anki has to be there.

**Why is the add-on both easier and more capable?**
Because it runs inside Anki, it skips the extra add-on and reaches deeper tools, like FSRS scheduling, that an outside program can't.

**What's the difference between AnkiConnect and the AnkiMCP add-on?**
AnkiConnect is a separate, well-known Anki add-on that the CLI relies on. The AnkiMCP add-on doesn't need it; it talks to Anki directly.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
