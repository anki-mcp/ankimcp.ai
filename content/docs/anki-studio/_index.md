---
title: "Anki Studio"
linkTitle: "Anki Studio"
description: "Anki Studio is AnkiMCP's cloud side: one MCP endpoint where your AI reaches a knowledge roadmap, a media library, text-to-speech voices, and a card sandbox."
keywords:
  - anki studio
  - ankimcp studio
  - anki cloud dashboard
  - anki knowledge roadmap
  - anki media library
  - anki card sandbox
weight: 3
sitemap_priority: 0.8
draft: false
---

Anki Studio is AnkiMCP's cloud side: features your AI reaches through a single **Studio MCP endpoint**, separate from the tunnel that connects it to the Anki on your computer.

The two connections do different jobs:

- **The tunnel reaches your local Anki** — your real decks and cards, on your machine. See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/) for the two ways to open it.
- **Studio reaches your account** — cloud features that live on AnkiMCP's servers.

Today, Studio gives your AI four things:

- **[Knowledge Roadmap](/docs/anki-studio/knowledge-roadmap/)** — a living map of a subject, wired to your real deck, that shows what you've mastered and what's decaying.
- **[Media Library](/docs/anki-studio/media-library/)** — cloud storage for the images and audio your cards use, so your AI can reach and reuse them.
- **[Sandbox](/docs/anki-studio/sandbox/)** — a shared workbench where you and your AI draft cards together and see them render live before anything reaches your deck.
- **[Text to Speech](/docs/anki-studio/text-to-speech/)** — natural neural voices that turn your text into card audio, saved straight into your media library.

You add Studio to your AI the same way you add the tunnel: add the **Studio MCP URL** — `https://studio.ankimcp.ai/mcp` — to Claude or ChatGPT as an additional MCP server (you'll also find it in your [dashboard](https://web.ankimcp.ai)). It's one global endpoint — the same URL for everyone — and your account decides what it can see.

More Studio features are on the way.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
