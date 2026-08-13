---
title: "AnkiMCP Troubleshooting: Fix Common Problems"
linkTitle: "Troubleshooting"
description: "Fix common AnkiMCP problems: Anki closed, the add-on or AnkiConnect not running, your AI client or remote tunnel not connecting, and note edits that don't save."
keywords:
  - ankimcp troubleshooting
  - anki mcp not working
  - anki mcp not connecting
  - anki mcp add-on not running
  - anki mcp tunnel not connecting
  - fix anki mcp
  - anki mcp pydantic_core download failed
weight: 7
sitemap_priority: 0.7
aliases:
  - /docs/known-issues/
  - /docs/known-issues/viewing-notes-blocks-updates/
---

**Most AnkiMCP problems have one of three causes: Anki is closed, the connection or add-on isn't running, or your AI client needs a restart.**

Find your symptom below, apply the fix, then try your AI assistant again. Most fixes take a minute or two. Some steps differ by how you connect, so each section tells you which path it applies to.

## Start with these quick checks

These two checks fix most problems, no matter how you connect.

1. **Make sure Anki is open.** AnkiMCP only reaches your cards while the Anki app is running. Open Anki, then ask your AI again.
2. **Restart your AI client.** Close and reopen it so it reconnects to AnkiMCP. Clients connect to AnkiMCP only when they start.

If your AI still can't reach your cards, keep reading.

## Your AI can't see your decks or won't connect

**Symptom:** You ask your AI to list your decks and it finds nothing, or it can't connect at all.

The fix depends on how you connect. Not sure which path you use? See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).

### If you use the AnkiMCP add-on

The add-on runs a server inside Anki. No AnkiConnect is involved on this path.

1. In Anki, open **Tools → AnkiMCP Server Settings...**
2. Confirm the server shows as running. It starts automatically when Anki opens.
3. If you don't see it, restart Anki, then check again.

### If you use the CLI or the Claude Desktop bundle

These paths reach Anki through the **AnkiConnect** add-on.

1. Open [http://localhost:8765](http://localhost:8765) in your browser. You should see the plain text `AnkiConnect`.
2. If you don't, install or reinstall AnkiConnect. In Anki, go to **Tools → Add-ons → Get Add-ons...**, enter the code `2055492159`, click **OK**, then restart Anki.
3. For the CLI, also confirm Node.js 22.12.0 or newer is installed.
4. For the CLI, check your config JSON for typos: no trailing commas, no mismatched braces.
5. Restart your AI client so it reconnects.

For setup help, see [Connect Claude](/docs/how-to/connect-claude/) or [Connect other MCP clients](/docs/how-to/connect-mcp-clients/).

## Using Claude on the web, ChatGPT, or another remote AI (tunnel)

**Symptom:** A remote AI like ChatGPT can't reach your cards, or the connection drops.

A remote AI reaches your computer through a **tunnel**. The tunnel only relays requests to Anki on your own machine, so a few things must stay true.

1. **Check the tunnel is connected.** Add-on: open **Tools → AnkiMCP Server Settings...** and confirm the tunnel shows connected. CLI: make sure the `--tunnel` terminal is still running (see the [CLI tunnel docs](https://github.com/ankimcp/anki-mcp-server#tunnel--recommended)).
2. **Keep your computer awake and Anki open.** If your computer sleeps or Anki closes, the tunnel has nothing to relay.
3. **Sign in again if the session expired.** Reconnect the tunnel to refresh it.

For full setup, see [Connect ChatGPT to Anki](/docs/how-to/connect-chatgpt-to-anki/).

**Advanced:** If you see `421 Invalid Host header` after setting a custom hostname for the add-on's HTTP server, see [Remote Access Security](/docs/concepts/remote-access-security/) to allow that name.

## Note edits succeed but the note doesn't change

**Symptom:** You ask your AI to edit a note. It reports "done," but the note doesn't change. No error appears.

This happens when the note is open in Anki's **Browse** window. You can't update a note while you're viewing or selecting it there. This is an **Anki Browse-window limitation**, not an AnkiMCP bug, and it affects both the add-on and AnkiConnect.

**Fix:** Before you ask your AI to edit a note, deselect or close it in Anki:

1. Close Anki's Browse window, **or** press **Escape** to deselect the note, **or** click a different note.
2. Ask your AI to make the update.
3. Open Browse again to confirm the change saved.

The [AnkiConnect documentation](https://git.sr.ht/~foosoft/anki-connect#codeupdatenotefieldscode) records the same rule: "You must not be viewing the note that you are updating on your Anki browser, otherwise the fields will not update." See [AnkiConnect issue #82](https://github.com/FooSoft/anki-connect/issues/82) for the original report. It applies to the add-on too, because the limit comes from Anki itself.

We can't auto-fix this. There's no reliable way to detect a viewed note, deselect it for you, or return an error when the update is blocked. For now, deselecting the note yourself is the dependable solution.

## The first time you start the add-on, it downloads something

**Symptom:** You install the AnkiMCP add-on, restart Anki, and a small **AnkiMCP Server - Setup** window appears saying it's downloading `pydantic_core`. Or that download fails and the server doesn't start.

{{< callout type="info" >}}
**This applies to the AnkiMCP add-on** — the version that installs inside Anki. It isn't about the CLI. Not sure which you use? See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).
{{< /callout >}}

<!-- TODO(cli-agent): If the CLI has a first-run/install-time equivalent
     (npm install, Node version mismatch, etc.), add it as a sibling entry
     below this one rather than editing this add-on prose. -->

**This is expected, and it happens once.** On first run the add-on downloads one component, `pydantic_core` (about 2 MB), from PyPI, the standard Python package index. It can't be shipped inside the add-on: `pydantic_core` is compiled separately for Windows, macOS, and Linux, and an Anki add-on is a single file that has to work on all of them. So the add-on fetches the one build that matches your computer and keeps it. Later launches download nothing and show no window.

You may occasionally see a second, equally brief download named `rpds`. Anki normally supplies that one itself, so it only appears if your Anki build doesn't.

**If the download fails**, the add-on shows an error and the server won't start. Fix the network path, then restart Anki — it retries automatically on every launch, so there's nothing to reinstall.

1. **Check you're online**, then restart Anki.
2. **On a work, school, or hospital network?** A proxy or firewall may block the package index. Ask for `pypi.org` and `files.pythonhosted.org` to be allowed, or start Anki once on an unfiltered connection — home Wi-Fi or a phone hotspot — so the one-time download can complete. After that, the blocked network is fine.
3. **VPN or antivirus in the way?** Turn it off briefly, restart Anki, and let the download finish.

## Still stuck?

If none of these fixes work, you have a few options:

- Read the [Getting Help](/docs/getting-help/) guide for more support.
- Ask in the [community forum](https://forum.ankimcp.ai/).
- Report it on [GitHub issues](https://github.com/ankimcp/anki-mcp-server/issues).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
