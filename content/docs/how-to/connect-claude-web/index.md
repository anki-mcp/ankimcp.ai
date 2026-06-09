---
title: "How to Connect Anki to Claude on the Web, Desktop, and Mobile"
linkTitle: "Connect Claude Web to Anki"
description: "Connect Anki to Claude on the web with the AnkiMCP add-on tunnel, so Claude reaches your decks everywhere: web, desktop app, and phone."
keywords:
  - claude web anki
  - claude.ai anki
  - anki claude mobile
  - anki on phone
  - anki claude everywhere
  - claude anki connector
weight: 1
sitemap_priority: 0.8
---

**Set it up once and Claude reaches your Anki on every device. Install the AnkiMCP add-on, turn on its built-in tunnel, and add the tunnel address to claude.ai. After that, Claude can read your decks and build cards from the web, the desktop app, and your phone.**

The AnkiMCP add-on runs inside Anki and gives your collection a secure web address. You add that address to claude.ai once. Because the connector is tied to your Claude account, it then works everywhere you sign in to Claude.

## What you need

- **Anki 25.07 or later**, open on your computer. Get it from [apps.ankiweb.net](https://apps.ankiweb.net/).
- The **AnkiMCP add-on** for Anki, code `124672614`. You'll install it below.
- An **AnkiMCP account**. The tunnel is a paid subscription. You sign in the first time you connect it.
- A **Claude account** at [claude.ai](https://claude.ai). Custom connectors work on Free, Pro, Max, Team, and Enterprise plans. On Free, you get one custom connector. This is a beta Claude feature.

**Time:** about 5 minutes.

## Why claude.ai needs the tunnel

Claude on the web runs in Anthropic's cloud, not on your computer. It can't see Anki on your machine on its own. The **tunnel** gives your local Anki a secure public web address that Claude can reach. Anki stays on your computer; the tunnel only relays messages to it.

## Step 1: Install the AnkiMCP add-on

The add-on starts a small server inside Anki. It launches on its own every time you open Anki.

1. Open Anki.
2. Go to **Tools → Add-ons → Get Add-ons...**
3. Enter this code: `124672614`
4. Click **OK**, then restart Anki.

<!-- screenshot: Anki "Install Add-on" dialog with the code 124672614 entered -->

## Step 2: Connect the tunnel and sign in

Now turn on the tunnel so your Anki gets a public web address.

1. Go to **Tools → AnkiMCP Server Settings...**
2. Click **Connect Tunnel**.
3. A login dialog shows a one-time code. Click **Open Browser** and enter that code on the page that opens.
4. Approve the sign-in. The add-on saves your login, so you won't repeat this each time.

<!-- screenshot: AnkiMCP Server Settings dialog with the "Connect Tunnel" button and one-time code -->

## Step 3: Copy your public tunnel URL

Once connected, the settings dialog shows your public tunnel address. It looks like a normal web link:

```text
https://tunnel.ankimcp.ai/<your-tunnel-id>
```

Copy that full URL. You'll paste it into claude.ai next.

<!-- screenshot: AnkiMCP Server Settings showing the connected tunnel URL -->

## Step 4: Add the connector in claude.ai

Open [claude.ai](https://claude.ai) in your browser and add the tunnel as a custom connector.

1. Go to **Settings → Connectors**.
2. Click **Add custom connector**.
3. Paste your tunnel URL, then save.

For the exact menu path, see Anthropic's [custom connectors guide](https://support.claude.com/en/articles/11175166-getting-started-with-custom-connectors-using-remote-mcp).

<!-- VERIFY: exact claude.ai custom-connector URL from the add-on tunnel -->

<!-- screenshot: claude.ai "Add custom connector" dialog with the tunnel URL pasted -->

## It works everywhere

You added the connector to your Claude account, not to one app. So it follows you across every place you sign in to Claude:

- **Claude on the web** at claude.ai.
- The **Claude desktop app** on Mac and Windows.
- **Claude mobile** on iOS and Android. Mobile connector support is **in beta**.

After you sign in on a new device, the connector syncs to it. You don't repeat the setup.

One rule stays the same everywhere: **Anki must stay open** on your computer. The tunnel relays to your local Anki. It is not a cloud copy of your cards.

## Check it worked

Open Claude on your phone, keep Anki open on your computer, and ask: **"List my Anki decks."**

If Claude names your real decks, the connector works on every device.

## Fix common problems

**Does this work on my phone?**
Yes. Once the connector is on your Claude account, it appears in the Claude mobile app after you sign in. Mobile connector support is in beta, so expect a few rough edges.

**Is it free?**
The add-on is free. The tunnel is a paid subscription, because it gives your Anki a secure web address that claude.ai can reach.

**Does my computer have to stay on?**
Yes. The tunnel relays to the Anki app on your machine. Keep your computer on and Anki open while you study. If Anki is closed, Claude sees no cards.

## Next steps

- New to local vs. remote? Read [Remote vs local access](/docs/concepts/remote-vs-local/) to understand when you need the tunnel.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
