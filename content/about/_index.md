---
title: "About AnkiMCP - AI-Powered Flashcard Management"
description: "Learn about AnkiMCP, the open-source project that connects AI assistants like Claude and ChatGPT to your Anki flashcards for smarter studying."
keywords: ["anki mcp", "about", "ai flashcards", "model context protocol", "open source"]
sitemap_priority: 0.7
---

## About AnkiMCP

AnkiMCP is an independent, open-source project that connects AI assistants like **Claude** and **ChatGPT** to your Anki flashcards. Ask the AI to build cards from what you're reading, search your card collection, or review with you in plain language — instead of formatting cards by hand. It's built on [MCP](/docs/concepts/what-is-mcp/), the open standard that lets AI assistants work with other apps.

It comes in two parts: an **[add-on](https://ankiweb.net/shared/info/124672614)** that runs inside Anki, and a **[command-line program (CLI)](https://github.com/ankimcp/anki-mcp-server)** that runs on its own. Most people should use the add-on; the CLI exists for developer tools that need a direct connection. For the differences and which to pick, see [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).

You can use it **locally**, with an AI app on the same computer as Anki, or **remotely**, letting a web or mobile AI reach your Anki through a secure connection that we run for you (the "tunnel"). See [Remote vs local access](/docs/concepts/remote-vs-local/) to choose the right setup. New here? The [Get started](/docs/get-started/) guide walks you through your first connection.

### Current Status

AnkiMCP is **open source** and **actively developed**, with new releases shipping regularly. The core features are stable and used in daily study, and the project keeps growing through community feedback and contributions.

### Created By

**[Anatoly](https://anatoly.dev)**
[LinkedIn](https://www.linkedin.com/in/anatolyt/) | [Personal Site](https://anatoly.dev)

I'm a software developer, a student, and a daily Anki user who got tired of manually formatting flashcards. When Anthropic released the Model Context Protocol (MCP), I immediately saw the potential to connect AI assistants directly to Anki. What started as a personal tool to speed up my own studying has grown into a project used by learners worldwide.

This project is actively maintained and developed with assistance from [Claude Code](https://claude.ai/code), Anthropic's AI coding assistant. Every feature is tested in my own daily study routine before release.

**Why I Built This**: I use Anki for programming, language learning, and technical concepts. Creating well-formatted cards was taking hours every week. Now, with AnkiMCP, I can create cards instantly while reading documentation, watching lectures, or having conversations with AI. This tool saves me hours weekly and makes studying more engaging.

### Project Vision

My goal is to make spaced repetition — reviewing material at growing intervals, right before you would forget it — more accessible and more powerful by connecting it with AI assistants like Claude, so anyone can build and keep their knowledge.

### Legal Notice

**Anki® is a registered trademark of Ankitects Pty Ltd.** This project is an independent community effort and is NOT affiliated with, endorsed by, or officially connected to Ankitects or the official Anki ecosystem.

### Community & Support

Need help or want to share feedback?

- **[Community Forum](https://forum.ankimcp.ai/)** - Questions, ideas, and feedback
- **[Email](mailto:support@ankimcp.ai)** - Write to us

### Contributing

The source code and issue trackers are on GitHub: the [CLI server](https://github.com/ankimcp/anki-mcp-server) and the [Anki add-on](https://github.com/ankimcp/anki-mcp-server-addon).

### Credits

This website is built with [Hextra](https://imfing.github.io/hextra/), a modern, fast, and flexible Hugo theme.

{{< newsletter >}}
