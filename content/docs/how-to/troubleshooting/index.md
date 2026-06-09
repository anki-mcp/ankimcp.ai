---
title: "AnkiMCP Troubleshooting: Fix Common Problems"
linkTitle: "Troubleshooting"
description: "Fix common AnkiMCP problems: Anki not open, AnkiConnect missing, your AI client not connecting, and note updates that fail silently."
keywords:
  - ankimcp troubleshooting
  - anki mcp not working
  - anki mcp connection
  - anki mcp not connecting
  - fix anki mcp
weight: 9
sitemap_priority: 0.7
aliases:
  - /docs/known-issues/
  - /docs/known-issues/viewing-notes-blocks-updates/
---

**Most AnkiMCP problems come from Anki being closed, the AnkiConnect plugin not running, or your AI client needing a restart.**

This page lists the common problems and their fixes. Find your symptom, apply the fix, then try your AI assistant again. Each fix takes a minute or two.

## Your AI can't see your decks

**Symptom:** You ask your AI to list your decks, and it finds nothing or reports an error.

Make sure Anki is open. AnkiMCP only reaches your cards while the Anki app is running. Open Anki, then ask again. If it still fails, restart your AI client so it reconnects.

## AnkiConnect is missing or not running

**Symptom:** Your AI can't connect at all, even with Anki open.

AnkiMCP talks to Anki through the **AnkiConnect** plugin. Check it's running: open [http://localhost:8765](http://localhost:8765) in your browser. You should see the plain text `AnkiConnect`.

If you don't see it, install the plugin. In Anki, go to **Tools → Add-ons → Get Add-ons...**, enter the code `2055492159`, click **OK**, then restart Anki.

## Your AI client connects but stays empty

**Symptom:** The connection looks fine, but your AI returns no cards or decks.

Confirm the AnkiConnect address is `http://localhost:8765`. This is the default and is correct for most setups. After checking it, restart both Anki and your AI client. They reconnect at startup.

## Note updates fail silently

**Symptom:** You ask your AI to edit a note. It reports "done," but the note doesn't change. No error appears.

This happens when the note is open in Anki's **Browse** window. The AnkiConnect API can't update a note you're viewing there. This is an upstream AnkiConnect limitation, not an AnkiMCP bug.

**Fix:** Before you ask your AI to edit a note, deselect or close it in Anki:

1. Close Anki's Browse window, **or** press **Escape** to deselect the note, **or** click a different note.
2. Ask your AI to make the update.
3. Open Browse again to confirm the change saved.

The [AnkiConnect documentation](https://git.sr.ht/~foosoft/anki-connect#codeupdatenotefieldscode) states it plainly: "You must not be viewing the note that you are updating on your Anki browser, otherwise the fields will not update." See [AnkiConnect issue #82](https://github.com/FooSoft/anki-connect/issues/82) for the original report.

We can't auto-fix this. AnkiConnect gives no way to detect a viewed note, deselect it for you, or return an error when the update is blocked. For now, deselecting the note yourself is the reliable solution.

## Still stuck?

If none of these fixes work, you have two options:

- Read the [Getting Help](/docs/getting-help/) guide for more support.
- Report it on [GitHub issues](https://github.com/ankimcp/anki-mcp-server/issues).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
