---
title: Web Installation
weight: 2
---

This guide is for **web-based AI assistants** like ChatGPT, Claude.ai, Gemini, or any AI that works in a browser. If you use Claude Desktop, see the [Desktop Installation Guide](../desktop) instead.

## How It Works

You'll run a small server on your computer. Your AI assistant connects to it over the internet. Think of it like opening a door for your AI to talk to Anki.

```
Your Computer                    The Internet               AI Assistant
┌──────────────┐                                           ┌────────────┐
│ Anki Desktop │ ←→ ankimcp server ←→ ngrok tunnel ←→      │ ChatGPT    │
└──────────────┘                                           │ Claude.ai  │
                                                           └────────────┘
```

## What You Need

1. **Anki Desktop** - Your flashcard app
   Download: [apps.ankiweb.net](https://apps.ankiweb.net/)

2. **AnkiConnect Plugin** - Lets other apps talk to Anki
   Download: [ankiweb.net/shared/info/2055492159](https://ankiweb.net/shared/info/2055492159)

3. **Node.js** - To run the server
   Download: [nodejs.org](https://nodejs.org/) (version 20 or newer)

4. **ngrok** - Creates a secure tunnel to your computer
   Download: [ngrok.com](https://ngrok.com)

## Installation Steps

### Step 1: Start the Server

**Option A: Quick Start (No Installation)**

Open your terminal and run:

```bash
npx anki-mcp-http
```

**Option B: Install Globally (Shorter Command)**

If you plan to use this often, install it once:

```bash
npm install -g anki-mcp-http
```

Then you can run it with the shorter command:

```bash
ankimcp
```

**Either way**, you'll see:
```
🚀 Server running on: http://127.0.0.1:3000
🔌 AnkiConnect URL: http://localhost:8765
```

**Leave this terminal window open** - the server needs to stay running.

### Step 2: Create a Tunnel

Open a **second** terminal window and run:

```bash
ngrok http 3000
```

You'll see something like:
```
Forwarding  https://abc123.ngrok.io → http://localhost:3000
```

Copy the URL (the part that says `https://abc123.ngrok.io`) - you'll need it next.

**Keep this terminal window open too.**

### Step 3: Connect Your AI

Now connect your AI assistant to the server.

**For Claude.ai:**

In Claude's web interface, go to Settings → Connectors → Add custom connector, then paste your ngrok URL (the `https://abc123.ngrok.io` from Step 2).

Full tutorial: [Getting Started with Custom Connectors](https://support.claude.com/en/articles/11175166-getting-started-with-custom-connectors-using-remote-mcp)

**For ChatGPT and other AI assistants:**

Check your AI provider's documentation to see if they support custom MCP servers or external tool integration, and follow their connection instructions.

## Try It Out

Once connected, ask your AI:

**"Show me my Anki decks"**

If it works, you'll see your decks! 🎉

## What Your AI Can Do

Once connected, your AI can:

- Show your decks and their stats
- Review cards with you
- Create new flashcards
- Search your cards
- Update existing cards
- Help explain concepts

## Server Options

You can customize the server:

```bash
# Use a different port
npx anki-mcp-http --port 8080

# Allow connections from other computers on your network
npx anki-mcp-http --host 0.0.0.0

# Connect to AnkiConnect on another computer
npx anki-mcp-http --anki-connect http://192.168.1.100:8765
```

## Troubleshooting

**AI says it can't connect:**
- Make sure both terminal windows are still open (server + ngrok)
- Check that Anki Desktop is running
- Try the ngrok URL in your browser - you should see a response

**Server won't start:**
- Make sure Node.js is installed: `node --version`
- Should show v20 or higher

**ngrok tunnel closes:**
- ngrok free accounts have time limits
- Just restart ngrok and give your AI the new URL

**Still not working?**
See [Getting Help](../getting-help) for support options.

## Security Note

The ngrok URL is public (anyone with the link can access it). Only share it with trusted AI assistants. When you're done studying, you can close both terminal windows to stop the server.

## Next Steps

- Try asking your AI to review a deck with you
- Have it create flashcards from articles or notes
- Ask it to explain difficult concepts on your cards

Happy studying! 📚
