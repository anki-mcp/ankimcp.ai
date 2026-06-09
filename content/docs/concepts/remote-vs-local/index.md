---
title: "Remote vs Local Access: Connecting Anki to Your AI"
linkTitle: "Remote vs Local"
description: "Choosing between local and remote access for AnkiMCP. Local is free and private; remote reaches Anki from another device or a web-based AI."
keywords:
  - remote Anki access
  - AnkiMCP tunnel
  - connect Anki from anywhere
  - local vs remote MCP
  - Anki AI remote access
  - ChatGPT Anki tunnel
weight: 5
sitemap_priority: 0.8
---

**If your AI assistant and Anki run on the same computer, local access is all you need. It's free, private, and needs no setup. Choose remote only when you must reach Anki from another device, or from a web-based AI that can't see your computer.**

This page explains both ways to connect, so you can pick the right one. You need no technical background.

## The short version

**Local** means your AI and Anki sit on the same machine and talk over a private internal address. It's free and nothing leaves your computer.

**Remote** is a managed tunnel that gives your local Anki a secure web address. Use it when the AI lives on another device or website. Either way, Anki must be open.

## What "local" means

**Local** means your AI assistant and Anki run on the **same computer**. They talk to each other over **localhost**, your machine's private internal address that never reaches the internet.

Local access is **free**. You need **no account and no login**. Nothing leaves your computer, because the connection stays bound to your machine.

This works with desktop AI apps like **Claude Desktop** and coding tools like **Cursor** or **Cline**, as long as they run on that same computer.

## What "remote" means

**Remote** uses a **managed tunnel**: a secure web address that points to your local Anki. It lets an AI on another device reach your cards.

It also reaches **web-based assistants** like the **ChatGPT website** or **claude.ai**. These run in your browser, not on your computer, so they can't see localhost on their own.

To connect the tunnel, you **sign in** once. You choose which AI clients to authorize, and you're responsible for anyone you share the tunnel address with. The tunnel is a **subscription-based** service. Both the add-on and the CLI support it.

## How local and remote compare

Here's a side-by-side look at the main differences.

| | Local | Remote |
|---|---|---|
| **Where AI + Anki run** | Same computer | Different devices, or a web AI |
| **Cost** | Free | Subscription-based |
| **Login needed** | None | One-time sign-in |
| **Who can reach it** | Only your machine | Clients you authorize |
| **Your data** | Never leaves your computer | Relayed through the tunnel, encrypted |

## Which do you need?

Start with **local**. If your AI assistant and Anki are on the same computer, local does everything, for free, with nothing to set up.

Choose **remote** when one of these is true:

- You want to reach Anki from **another device**, like your phone or a second laptop.
- You use a **web-based AI** like the ChatGPT website or claude.ai that can't see your computer.

Remote adds reach. The cost is a subscription and relaying your data through the service.

## Is your data private?

With **local**, nothing leaves your machine, so there's nothing to relay and nothing to worry about.

With the **tunnel**, your data passes through ankimcp.ai's server in real time. It's **encrypted while it travels** and is **never stored, logged, or read** as content. The service is a pass-through, not a place your cards are kept. For the full detail, see [the privacy policy](/privacy/).

If you want the AI to view but not change your cards, the CLI offers a **read-only mode** (the add-on doesn't have this yet). See the [anki-mcp-server repository on GitHub](https://github.com/ankimcp/anki-mcp-server) for setup.

## Either way, Anki must stay open

The tunnel only relays to the Anki on your computer. It is not a cloud copy of your collection. So with both local and remote, **Anki must be open and running** on your machine.

## Common questions

**Do my cards live on a server with remote access?**
No. Your collection stays on your computer. The tunnel relays to your local Anki in real time; it never holds a copy of your cards.

**Can I use the ChatGPT website or claude.ai with local access?**
No. Web-based assistants run in your browser, not on your computer, so they can't see localhost. Use the remote tunnel for those.

**Is local access really free?**
Yes. Local needs no account and no login, and nothing leaves your machine. Only the remote tunnel is subscription-based.

**Does remote work if Anki is closed?**
No. The tunnel relays to your local Anki, so Anki must be open on your computer for either local or remote to work.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
