---
title: "How to Connect ChatGPT (and Web AI) to Anki"
linkTitle: "Connect ChatGPT to Anki"
description: "Connect ChatGPT, Claude.ai, or any web AI to Anki with the AnkiMCP managed tunnel for secure remote access to your flashcards."
keywords:
  - chatgpt anki
  - connect chatgpt to anki
  - anki chatgpt
  - anki ai remote access
  - claude anki
  - anki mcp tunnel
weight: 4
sitemap_priority: 0.8
aliases:
  - /docs/installation/web/
---

**Connect a web-based AI like ChatGPT or Claude.ai to Anki using the AnkiMCP tunnel, so the AI can read your decks and build cards from your browser.**

Web AIs run in the cloud, so they can't see Anki on your computer. The AnkiMCP **tunnel** fixes this. It gives your local Anki a secure public web address that a browser AI can reach. You start a small server, sign in, and paste the address into your AI.

## What you need

- A **web-based AI that supports MCP connectors**, such as ChatGPT or [Claude.ai](https://claude.ai). It must let you add a custom MCP server.
- **Anki** installed and open on your computer. Get it from [apps.ankiweb.net](https://apps.ankiweb.net/).
- The **AnkiConnect plugin** in Anki. See [Connect Claude to Anki](/docs/how-to/connect-claude-desktop/) for the one-minute install (code `2055492159`).
- **Node.js** to run the server. Get it from [nodejs.org](https://nodejs.org/).
- An **AnkiMCP account**. The managed tunnel is a paid subscription. You sign in the first time you start it.

**Time:** about 5 minutes.

## Why a tunnel?

A browser AI runs on a remote server, not on your machine. It has no way to reach `localhost`, where Anki lives. The tunnel relays messages between the AI and your local Anki over a secure, signed-in connection. Your cards never leave your control, and the link is private to your account.

## Step 1: Start the tunnel

Open your terminal and run this command:

```bash
npx @ankimcp/anki-mcp-server --tunnel
```

The server starts and connects to the managed AnkiMCP tunnel. Keep this terminal window open while you study. If you closed it, the link would break.

<!-- screenshot: terminal showing the --tunnel command and the startup banner -->

## Step 2: Sign in when your browser opens

The first run opens your browser to an approval page. The sign-in code is already in the link, so you only need to approve it.

After you approve, the terminal continues. Your login is saved, so you won't repeat this each time.

You can also sign in ahead of time with `npx @ankimcp/anki-mcp-server --login`.

<!-- screenshot: browser approval page for the AnkiMCP device login -->

## Step 3: Copy the public tunnel URL

Once connected, the terminal prints your public tunnel address. It looks like a normal `https://` web link.

Copy that full URL. You'll paste it into your AI in the next step.

<!-- screenshot: terminal banner highlighting the public tunnel URL -->

## Step 4: Add the URL to your web AI

Open your AI's settings and add a custom MCP connector. Paste the tunnel URL you copied, then save.

For **Claude.ai**, go to **Settings → Connectors → Add custom connector** and paste the URL. See Anthropic's [custom connectors guide](https://support.claude.com/en/articles/11175166-getting-started-with-custom-connectors-using-remote-mcp) for the exact path.

For **ChatGPT and other web AIs**, open your provider's MCP connector or custom integration settings and paste the same URL. Check your provider's documentation for the exact menu.

<!-- VERIFY: confirm ChatGPT website MCP connector support + exact steps -->

<!-- screenshot: a web AI's "Add custom connector" dialog with the tunnel URL pasted -->

## Check it worked

Keep Anki open, then ask your AI: **"List my Anki decks."**

If it names your real decks, the tunnel works. You can now ask it to make cards, search your collection, or review with you.

## Fix common problems

**My AI can't connect.**
Make sure the terminal with `--tunnel` is still running and Anki is open. The tunnel only relays to Anki while both are running. Restart the server if the terminal was closed.

**The AI connects but sees no decks.**
Anki itself may be closed, or AnkiConnect isn't installed. Open Anki and confirm AnkiConnect at [http://localhost:8765](http://localhost:8765) (you should see the word `AnkiConnect`).

**Sign-in didn't open my browser.**
The terminal prints a backup link and code. Open the link and enter the code to approve.

**Do I have to pay?**
The managed tunnel is a paid subscription. The local desktop path for Claude Desktop is separate. See [Connect Claude to Anki](/docs/how-to/connect-claude-desktop/).

## Next steps

- New to local vs. remote? Read [Remote vs local access](/docs/concepts/remote-vs-local/) to choose the right path.
- Use Claude Desktop instead? The [Connect Claude to Anki](/docs/how-to/connect-claude-desktop/) guide skips the tunnel entirely.
- Prefer to run your own tunnel? The [ngrok option](https://github.com/ankimcp/anki-mcp-server#ngrok-unauthenticated-alternative) on GitHub is an unauthenticated alternative for advanced users.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
