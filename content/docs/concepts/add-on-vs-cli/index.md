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

**AnkiMCP gives you two official ways to connect Anki to an AI assistant: an add-on that runs inside Anki, and a CLI that runs as a separate program. Both are built by the same author. For most people, start with the add-on. It's the simplest to install and the most capable.**

This page explains both paths and helps you choose. You need no technical background. The two are complementary, not rivals.

## The short version

The **add-on** installs like any other Anki add-on and starts on its own. It's the easiest setup and reaches the most of Anki.

The **CLI** is a separate program you run yourself. Pick it when you connect through coding tools, or you already use Node.js. Whichever you choose, Anki must be open and running.

## What is the add-on?

The add-on is a small program written in **Python** that runs **inside the Anki desktop app**. You install it the way you install any Anki add-on, and it starts automatically.

It reaches your cards through Anki's own built-in tools directly. There's nothing else to install. No Node.js, and no extra plugin.

The add-on is also the **more capable** of the two. Because it lives inside Anki, it can reach deep parts the other path can't. That includes **FSRS scheduling** (Anki's modern review-timing system) and the review scheduler itself. It also exposes extra **resources**, like your stats, your collection schema, and query help.

It connects over **HTTP** (a standard web connection) and the managed tunnel. One caveat: it has no read-only mode yet, so it can change your collection.

## What is the CLI?

The CLI is a standalone **MCP server** written in **Node.js** that runs as a **separate program**, outside of Anki. MCP, the Model Context Protocol, is the open standard that lets AI assistants connect to outside apps.

The CLI reaches Anki through **AnkiConnect**, a separate Anki plugin you must install first. So this path has two pieces to set up: Node.js and AnkiConnect. Anki still has to be open the whole time.

What the CLI adds is **STDIO**, a direct, no-open-port connection that many coding tools prefer. It also supports HTTP and the managed tunnel. On top of that, it has a **read-only mode** and a few extra tools for Anki's window. It's slightly more mature.

## How the two compare

Here's a side-by-side look at the main differences.

| | Add-on | CLI |
|---|---|---|
| **Setup** | Install like any Anki add-on; auto-starts | Install Node.js and AnkiConnect, then run it |
| **How it reaches Anki** | Anki's built-in tools, directly | Through the AnkiConnect plugin |
| **Connection type** | HTTP + managed tunnel | STDIO + HTTP + managed tunnel |
| **What it can do** | More: FSRS scheduling, review scheduler, extra resources | Read-only mode, a few extra window tools |
| **Maturity** | Newer; no read-only mode yet | Slightly more mature |

Both need **Anki open and running**. Neither works on its own without Anki.

## Which should you choose?

For most people, **start with the add-on**. It's the simplest to install and reaches the most of Anki, so it's the best default for most people.

Pick the **CLI** when one of these is true:

- You connect through a **coding tool** like Cursor or Cline that prefers **STDIO**.
- You're already set up with **Node.js** and comfortable running a separate program.
- You need a **read-only mode** today, so the AI can't change your cards.

You don't have to pick one forever. They're complementary, and the same author maintains both.

## Connecting remotely

Want your AI assistant to reach Anki from another device or service? Both paths can connect through the same secure managed **tunnel**, using an OAuth login (you sign in to grant access). This managed tunnel is a subscription-based service, so you skip the manual network setup yourself.

<!-- TODO: link to dedicated remote/tunnel page when it exists -->

For setup steps, configuration, and developer details, see the [anki-mcp-server repository on GitHub](https://github.com/ankimcp/anki-mcp-server). The add-on lives in its own companion repository under the same project.

## Common questions

**Do I need both the add-on and the CLI?**
No. Pick one. The add-on suits most people. Choose the CLI if you need STDIO, a read-only mode, or you already run Node.js.

**Does either one work without Anki open?**
No. Both need the Anki desktop app open and running. They act on your real collection, so Anki has to be there.

**Why is the add-on both easier and more capable?**
Because it runs inside Anki, it skips the extra plugin and reaches deeper tools, like FSRS scheduling, that an outside program can't.

**What's the difference between AnkiConnect and the AnkiMCP add-on?**
AnkiConnect is a separate, well-known Anki plugin that the CLI relies on. The AnkiMCP add-on doesn't need it; it talks to Anki directly.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
