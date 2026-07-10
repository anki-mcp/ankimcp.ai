---
title: "AnkiMCP Remote Access Security: Tunnels, ngrok & DNS Rebinding"
linkTitle: "Remote Access Security"
description: "AnkiMCP's local server is safe by default. Expose it through a tunnel, ngrok, or a proxy? Here's the DNS-rebinding attack to know and how to stay safe."
keywords:
  - AnkiMCP security
  - AnkiMCP remote access
  - AnkiMCP tunnel
  - ngrok
  - DNS rebinding
  - MCP server security
  - http_allowed_hosts
weight: 6
sitemap_priority: 0.8
---

**AnkiMCP is secure by default. If you connect locally or use the managed tunnel, there is nothing to do here. This page is only for people who expose AnkiMCP their own way — for example with ngrok (a tool that gives a program on your computer a public web address) — and hit a blocked request.**

{{< callout type="info" >}}
**Most people can stop here.** Read on only if you put AnkiMCP behind your **own** tunnel, ngrok, or a reverse proxy (a server that forwards web traffic to another program) and a request gets blocked with a `421 Invalid Host header` error.
{{< /callout >}}

You need no security background to read this. The rest of the page explains the attack this protection guards against — called **DNS rebinding** — then shows exactly what to change when you must allow an outside name through.

## The short version

- AnkiMCP's local server listens at `127.0.0.1` (your own machine only).
- A browser trick called **DNS rebinding** can let a bad website talk to programs on your computer.
- AnkiMCP blocks it. It checks the **`Host`** and **`Origin`** of every request and accepts only local names.
- This is a **known, industry-wide problem** for local MCP servers. It is not unique to AnkiMCP.

## What is DNS rebinding?

DNS rebinding lets a website you visit trick your browser into talking to a server on *your* computer.

Here is how it works. You open a normal-looking page. Behind the scenes, the attacker's domain name suddenly "rebinds" to `127.0.0.1` — your own machine. Your browser still thinks it is talking to the website. But now it sends requests to programs on your computer. If a local program trusts whoever connects, the website can quietly control it.

It is an old trick. For years it has hit routers, smart-home devices, media servers, and crypto wallets. ([DNS rebinding, explained](https://github.blog/security/application-security/dns-rebinding-attacks-explained-the-lookup-is-coming-from-inside-the-house/).)

## Why it matters for MCP servers

An MCP server does more than hand out data. It exposes **tools** — actions an AI can call, like adding or deleting cards. So a rebinding attack on an unprotected MCP server is not only a privacy leak. The website could *run those tools*.

The whole MCP ecosystem knows this. The MCP spec says servers **MUST** check the `Origin` header to stop DNS rebinding ([MCP transport security](https://modelcontextprotocol.io/specification/2025-06-18/basic/transports)). The same gap has caused real fixes elsewhere. One was a critical bug in Anthropic's own MCP Inspector ([CVE-2025-49596](https://www.oligo.security/blog/critical-rce-vulnerability-in-anthropic-mcp-inspector-cve-2025-49596)). Others were DNS-rebinding fixes in the official MCP [Python SDK](https://github.com/modelcontextprotocol/python-sdk/security/advisories/GHSA-9h52-p55h-vw2f) and TypeScript SDK.

The good news: the defense is simple. The server checks the name each request claims to talk to. It rejects anything that is not local. A rebound website cannot fake that name, so it gets blocked.

## How AnkiMCP handles it

{{< callout type="info" >}}
Protection is **on by default**. You only need to act if you reach the server from *beyond* your own computer — through a tunnel, a reverse proxy, or another device on your network.
{{< /callout >}}

Here's what that looks like in the add-on:

<!-- TODO(cli-agent): Add a CLI tab here, mirroring the add-on tab.
     Cover: how the CLI's HTTP transport validates Host/Origin, the absent-Origin /
     Host-guard decision (Option 1 — lenient absent-Origin, Host is the real gate),
     any config flags/equivalents, backward-compatibility for non-loopback/tunnel use,
     STDIO note (no network surface, so not exposed to this attack at all),
     and the same "prefer the managed tunnel for remote access" steer.
     Keep the same plain-English voice and length as the add-on tab. -->

{{< tabs >}}

{{< tab name="Add-on" >}}
**Add-on**

Since **v0.21.0**, the add-on checks the `Host` and `Origin` of every HTTP request. It accepts only local names: `127.0.0.1`, `localhost`, and `[::1]`. It rejects anything else with a `421` (bad Host) or a `403` (bad Origin). A rebound website always arrives under another name, so it is blocked before it reaches a single tool.

**Connect only from your own computer? You are done — nothing changes.** Your AI client talks to `127.0.0.1` and passes the check.

{{< callout type="warning" >}}
**Backward-compatibility note.** Did you reach the add-on's HTTP server under a *non-local* name before? Those requests now fail with `421 Invalid Host header` until you allow that name. This happens if you:

- bind the server to `0.0.0.0` (make it reachable from other devices on your network), or
- put it behind a tunnel or reverse proxy (ngrok, Cloudflare, Nginx).
{{< /callout >}}

To allow an outside name, add it to your add-on config and restart Anki:

```json
{
  "http_allowed_hosts": ["myapp.ngrok-free.app"],
  "http_allowed_origins": ["https://myapp.example"]
}
```

- `http_allowed_hosts` — just the name, without `https://` (e.g. `myapp.ngrok-free.app`). You need this for every outside name.
- `http_allowed_origins` — the full origin, including the `https://` part (e.g. `https://myapp.example`). You need this only for browser-based clients.

For ngrok, you can skip the config. Let ngrok send a local `Host` instead:

```bash
ngrok http --host-header=rewrite 3141
```

**An optional second lock.** You can also require a shared secret on every request. Set `http_api_key`, and clients then send `Authorization: Bearer <key>`. It is empty (off) by default. It is an extra layer on top of the Host check, not a replacement.

**For remote access, prefer the managed tunnel.** It connects *outward* over an encrypted, signed-in link. So there is no open local port for a website to attack, and no allow-list to maintain. See [Remote vs local access](/docs/concepts/remote-vs-local/). Allow-listing an outside host is the advanced, do-it-yourself path. After that, securing the endpoint is on you.
{{< /tab >}}

{{< /tabs >}}

## Common questions

**Do I need to change anything?**
Only if you reach the server under a non-local name — a tunnel, a reverse proxy, or `0.0.0.0` for another device. Plain local use needs no change.

**What does a `421 Invalid Host header` error mean?**
The server rejected the name your request arrived under, because it is not on the allow-list. Add that name to `http_allowed_hosts` (see the Add-on tab), or use the managed tunnel.

**Is the managed tunnel affected?**
No. The tunnel connects *outward* and signs in with your account. It never opens a local port for a website to reach. So DNS rebinding does not apply to it.

**Does binding to `localhost` alone keep me safe?**
It helps, but it is not enough on its own. DNS rebinding targets `127.0.0.1` directly. So the server still has to check the `Host` and `Origin` name — which AnkiMCP does.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
