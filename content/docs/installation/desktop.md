---
title: Desktop Installation
weight: 1
---

This guide is for **Claude Desktop** users. If you use ChatGPT or Claude.ai, see the [Web Installation Guide](../web) instead.

## What You Need

Install these three things first:

1. **Anki Desktop** - Your flashcard app
   Download: [apps.ankiweb.net](https://apps.ankiweb.net/)

2. **AnkiConnect Plugin** - Lets other apps talk to Anki
   Download: [ankiweb.net/shared/info/2055492159](https://ankiweb.net/shared/info/2055492159)

3. **Claude Desktop** - The AI assistant
   Download: [claude.ai/download](https://claude.ai/download)

## Installation Steps

### Step 1: Download the Extension

1. Go to [GitHub Releases](https://github.com/anki-mcp-organization/anki-mcp-desktop/releases)
2. Download the latest `.mcpb` file
   (It looks like: `anki-mcp-desktop-0.3.0.mcpb`)

### Step 2: Install in Claude Desktop

1. Open Claude Desktop
2. Click **Settings** (gear icon)
3. Go to **Extensions** tab
4. Drag and drop the `.mcpb` file into the window

Done! The extension is now installed.

## Configuration (Optional)

The default settings work for most people. You only need to configure if your AnkiConnect runs on a different port or computer.

**To change settings:**

1. In Claude Desktop: **Settings → Extensions**
2. Find "Anki MCP Server" in the list
3. Click **Configure**
4. Update the AnkiConnect URL if needed
   (Default: `http://localhost:8765`)

## Try It Out

1. **Start Anki Desktop** - Must be running
2. **Open Claude Desktop**
3. **Ask Claude**: "Show me my Anki decks"

If it works, Claude will show your decks!

## What Claude Can Do

Once connected, Claude can:

- Show your decks and their stats
- Review cards with you (asks question, shows answer, rates your performance)
- Create new flashcards from what you're learning
- Search for specific cards or topics
- Update existing cards
- Help explain concepts on your cards

## Troubleshooting

**Claude says it can't connect:**
- Make sure Anki Desktop is running
- Check that AnkiConnect is installed (Tools → Add-ons in Anki)
- Restart both Anki and Claude Desktop

**Still not working?**
See [Getting Help](../getting-help) for support options.

## Next Steps

- Try asking Claude to review a deck with you
- Have Claude create flashcards from text you're studying
- Ask Claude to explain difficult concepts on your cards

Happy studying! 📚
