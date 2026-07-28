---
title: "Hosted Anki — Run Anki in the Cloud"
linkTitle: "Hosted Anki"
description: "Hosted Anki gives you a full Anki running in the cloud on AnkiMCP's servers: reach it from your AI assistant or a browser remote desktop, with sleep, wake, and sync explained."
keywords:
  - hosted anki
  - anki in the cloud
  - anki online without desktop
  - run anki in cloud
  - anki remote desktop
weight: 4
sitemap_priority: 0.8
aliases:
  - /docs/concepts/anki-on-premise/
---

{{< callout type="warning" >}}
**This feature is experimental.** Before you start using it, **back up your Anki collection**: export your decks as `.apkg` files, or sync everything to AnkiWeb first. Data loss is unlikely, but it is possible while the feature matures.
{{< /callout >}}

**Hosted Anki gives you a real Anki desktop app running in the cloud on AnkiMCP's servers — your Anki, hosted for you. Your AI assistant can reach it any time, from anywhere, without your computer being on.**

## What it is

Your hosted Anki is the same Anki you know — the full desktop app, not a copy or an emulation — running on our servers with the AnkiMCP add-ons already installed. You reach it in two ways:

| Access                  | How                                                             |
| ----------------------- | --------------------------------------------------------------- |
| **Your AI assistant**   | Through MCP, the same way it talks to a local Anki               |
| **Remote desktop**      | A VNC viewer in your browser — you see and use the real Anki app |

Hosted Anki is part of the [**Pro plan ($15/month)**](/pricing/).

## Sleep and wake

To save resources, your hosted Anki **goes to sleep after 1 hour of inactivity**. Activity means: using the dashboard, interacting with the remote desktop, or your AI assistant calling your Anki.

Waking up works two ways:

- **Automatically** — the next AI request wakes it. The first request after sleep takes roughly **30–60 seconds** while Anki boots; the request waits for it. If it times out, just retry in a minute.
- **Manually** — press **Start** on the dashboard.

Sleep is safe. Your collection lives on persistent storage — nothing is lost when your hosted Anki sleeps.

## Cloud and local Anki together

You can have a hosted Anki **and** run a local Anki with the tunnel on the same account. The rule is simple: **while your cloud Anki is running, it always receives your AI's requests** — even if your local Anki is connected at the same time. The dashboard shows a warning banner whenever this is the case.

To send requests to your local Anki instead, **stop the cloud Anki** (or let it fall asleep on its own). The power toggle on the dashboard is the switch:

| Cloud Anki state              | Who answers your AI                                            |
| ----------------------------- | -------------------------------------------------------------- |
| Running                       | The cloud Anki — always                                        |
| Asleep, local Anki connected  | Your local Anki                                                |
| Asleep, no local Anki         | The cloud Anki wakes up and answers                            |
| Stopped by you                | Your local Anki if connected; otherwise the request is refused |

Note the difference between the last two rows: a hosted Anki that fell **asleep** on its own wakes automatically on the next AI request. One you **stopped** with the power toggle stays off until you press Start — an AI request will not turn it back on.

## AnkiWeb sync

The platform **never stores your AnkiWeb password**. To sync your hosted Anki with AnkiWeb, open the remote desktop and log in to AnkiWeb inside Anki yourself — exactly as you would on your own computer.

Your login survives restarts and sleep. It is wiped only when you delete your hosted Anki.

## Deleting your hosted Anki

Deleting your hosted Anki is **permanent**: the hosted device and all data stored on it are destroyed. This is why the backup advice at the top of this page matters.

Your AnkiWeb account is untouched — anything you synced to AnkiWeb stays there.

{{< callout type="info" >}}
Hosted Anki is evolving. If something doesn't work as described here, or you have ideas for it, tell us on the [community forum](https://forum.ankimcp.ai/).
{{< /callout >}}

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
