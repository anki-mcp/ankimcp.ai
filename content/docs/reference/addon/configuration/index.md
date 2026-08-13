---
title: "AnkiMCP Add-on Configuration Reference: Every Setting Explained"
linkTitle: "Configuration"
description: "Every configuration key for the AnkiMCP Anki add-on: type, default and what it does, plus the disabled_tools syntax and a complete JSON example."
keywords:
  - AnkiMCP configuration
  - Anki MCP settings
  - disabled_tools
  - enabled_destructive_tools
  - http_port 3141
  - Anki add-on config
  - AnkiMCP config.json
weight: 2
sitemap_priority: 0.7
---

**Every setting the AnkiMCP add-on has, what it defaults to, and what changing it does.** The add-on works with no configuration at all — everything here is optional. Come to this page when you want to change a port, hide some tools, or turn on logging.

{{< callout type="info" >}}
**This documents the Anki add-on**, the version that runs inside the Anki desktop app. The **AnkiMCP CLI** is a separate product configured its own way, documented separately — nothing on this page applies to it. See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/) if you're unsure which you have.
{{< /callout >}}

## Where to edit it

In Anki: **Tools → Add-ons → AnkiMCP Server → Config**. That opens the JSON below. Anki stores your changes separately from the shipped defaults, so an add-on update won't wipe them.

Some settings take effect immediately; the ones that need an Anki restart say so.

## Complete example

Every key, at its default value:

```json
{
  "http_enabled": true,
  "http_port": 3141,
  "http_host": "127.0.0.1",
  "http_path": "",
  "http_api_key": "",
  "http_allowed_hosts": [],
  "http_allowed_origins": [],
  "cors_origins": [],
  "cors_expose_headers": ["mcp-protocol-version"],
  "disabled_tools": [],
  "enabled_destructive_tools": [],
  "max_notes_per_batch": 100,
  "tunnel_server_url": "wss://tunnel.ankimcp.ai",
  "tunnel_client_id": "ankimcp-cli",
  "media_import_dir": "",
  "media_allowed_types": [],
  "media_allowed_hosts": [],
  "show_settings_menu_item": true,
  "show_toolbar_indicator": true,
  "show_sync_tooltip": true,
  "log_to_file": false
}
```

You don't need to include every key. Anything you leave out uses its default, and unknown keys are ignored.

## All keys at a glance

| Key | Type | Default |
|---|---|---|
| [`http_enabled`](#http_enabled) | boolean | `true` |
| [`http_port`](#http_port) | integer | `3141` |
| [`http_host`](#http_host) | string | `"127.0.0.1"` |
| [`http_path`](#http_path) | string | `""` |
| [`http_api_key`](#http_api_key) | string | `""` |
| [`http_allowed_hosts`](#http_allowed_hosts) | array of strings | `[]` |
| [`http_allowed_origins`](#http_allowed_origins) | array of strings | `[]` |
| [`cors_origins`](#cors_origins) | array of strings | `[]` |
| [`cors_expose_headers`](#cors_expose_headers) | array of strings | `["mcp-protocol-version"]` |
| [`disabled_tools`](#disabled_tools) | array of strings | `[]` |
| [`enabled_destructive_tools`](#enabled_destructive_tools) | array of strings | `[]` |
| [`max_notes_per_batch`](#max_notes_per_batch) | integer | `100` |
| [`tunnel_server_url`](#tunnel_server_url) | string | `"wss://tunnel.ankimcp.ai"` |
| [`tunnel_client_id`](#tunnel_client_id) | string | `"ankimcp-cli"` |
| [`media_import_dir`](#media_import_dir) | string | `""` |
| [`media_allowed_types`](#media_allowed_types) | array of strings | `[]` |
| [`media_allowed_hosts`](#media_allowed_hosts) | array of strings | `[]` |
| [`show_settings_menu_item`](#show_settings_menu_item) | boolean | `true` |
| [`show_toolbar_indicator`](#show_toolbar_indicator) | boolean | `true` |
| [`show_sync_tooltip`](#show_sync_tooltip) | boolean | `true` |
| [`log_to_file`](#log_to_file) | boolean | `false` |

## HTTP server

The add-on runs a small web server on your own machine. This is what local AI clients connect to.

### `http_enabled`

`boolean` — default `true`

Whether the local HTTP server runs at all. Set to `false` and only the tunnel transport is available. Useful if you connect exclusively through the managed tunnel and would rather nothing listened locally.

### `http_port`

`integer` — default `3141`

The port the local HTTP server listens on. Must be between 1 and 65535. Change it if something else on your machine already uses 3141 — and remember to update the address in your AI client to match.

### `http_host`

`string` — default `"127.0.0.1"`

The address the server binds to. `127.0.0.1` means your machine only, which is the safe default. Binding to `0.0.0.0` exposes it to your network and requires extra setup before requests are accepted — see [remote access security](/docs/concepts/remote-access-security/).

### `http_path`

`string` — default `""` (server at the root)

Serves the MCP endpoint under a custom path. With `"my-secret-path"`, the server answers at `http://localhost:3141/my-secret-path/` instead of `/`.

{{< callout type="warning" >}}
A custom path on its own is **not** enough to expose the add-on through a tunnel or reverse proxy. You also have to allowlist the host — otherwise requests are rejected with `421` (non-loopback `Host`) or `403` (non-loopback `Origin`). See [remote access security](/docs/concepts/remote-access-security/).
{{< /callout >}}

## Security and access

These keys control who is allowed to reach the server and what media it will import. **They're explained in full on [Remote access security](/docs/concepts/remote-access-security/)** — the short versions here are for looking up a name and a default.

### `http_api_key`

`string` — default `""` (authentication off)

A shared key for the HTTP transport. When it's non-empty, every HTTP request must carry a matching `Authorization: Bearer <key>` header. Affects the HTTP transport only; the tunnel does its own OAuth login. → [Full explanation](/docs/concepts/remote-access-security/)

### `http_allowed_hosts`

`array of strings` — default `[]`

Extra `Host` header values accepted on top of the built-in loopback allowlist (`127.0.0.1`, `localhost`, `[::1]`). Needed when a tunnel or proxy rewrites the `Host`, e.g. `["myapp.ngrok.io"]`. → [Full explanation](/docs/concepts/remote-access-security/)

### `http_allowed_origins`

`array of strings` — default `[]`

Extra `Origin` header values accepted on top of the loopback allowlist, e.g. `["https://myapp.example"]`. Browser clients need this as well as `http_allowed_hosts`. → [Full explanation](/docs/concepts/remote-access-security/)

### `cors_origins`

`array of strings` — default `[]` (CORS disabled)

Origins allowed to make cross-origin browser requests, e.g. `["http://localhost:5173"]`. `["*"]` allows everything and is not recommended. → [Full explanation](/docs/concepts/remote-access-security/)

### `cors_expose_headers`

`array of strings` — default `["mcp-protocol-version"]`

Which response headers browser JavaScript is allowed to read. → [Full explanation](/docs/concepts/remote-access-security/)

### `media_import_dir`

`string` — default `""` (no restriction)

Restricts file-path media imports to this directory tree, e.g. `"/Users/me/anki-media"`. Empty means any directory is allowed. → [Full explanation](/docs/concepts/remote-access-security/)

### `media_allowed_types`

`array of strings` — default `[]`

Extra MIME types accepted for media import, beyond the built-in image/audio/video, e.g. `["application/pdf"]`. → [Full explanation](/docs/concepts/remote-access-security/)

### `media_allowed_hosts`

`array of strings` — default `[]`

Hosts or IPs allowed to bypass private-network blocking when importing media from a URL, e.g. `["192.168.1.50", "my-nas.local"]`. → [Full explanation](/docs/concepts/remote-access-security/)

## Tool filtering

### `disabled_tools`

`array of strings` — default `[]`

Hides specific tools or actions from AI clients. Two reasons to use it: fewer tools means fewer tokens spent describing them on every request, and you may simply not want an assistant able to do certain things.

```json
{
  "disabled_tools": [
    "sync",
    "card_management:bury",
    "card_management:unbury"
  ]
}
```

The syntax has exactly two forms:

| Entry | Effect |
|---|---|
| `"tool_name"` | Disables the entire tool. `"sync"` removes the sync tool. |
| `"tool_name:action"` | Disables one action inside a [multi-action tool](../tools/#multi-action-tools). `"card_management:bury"` removes only burying; the rest of `card_management` stays. |

Disabled entries are stripped from the MCP schema completely — AI clients never see them, so a client cannot call them by mistake. Typos in tool or action names produce console warnings rather than silently doing nothing.

See the [tool reference](../tools/) for the full list of valid names.

### `enabled_destructive_tools`

`array of strings` — default `[]`

The opt-in allowlist for **destructive** tools — high-risk operations that are **hidden from AI clients by default**. Until you list one here, it isn't in the MCP schema at all, so even a misbehaving client can't reach it. This is enforced by the add-on, not by the client.

```json
{
  "enabled_destructive_tools": [
    "change_note_type",
    "model_fields:remove"
  ]
}
```

Currently there are exactly two destructive entries:

| Entry | What opting in allows |
|---|---|
| `change_note_type` | Moving notes to a different note type, rewriting every selected note's field layout. |
| `model_fields:remove` | Permanently deleting a field and its content on every note of that note type. |

Rules:

- `"tool_name"` opts in a whole destructive tool.
- `"tool_name:action"` opts in a destructive action. **A whole-tool entry does not implicitly opt in its destructive actions** — list them separately.
- `disabled_tools` still applies on top. An opted-in tool can still be disabled.
- Entries that match nothing, or that match a tool or action which isn't destructive, produce console warnings.

## Batch limits

### `max_notes_per_batch`

`integer` — default `100`

The ceiling on how many notes a single batch call may touch. Applies to `add_notes`, `update_notes` and `change_note_type`. Raise it for bigger imports; lower it if you'd rather your assistant work in smaller, more reviewable chunks.

## Tunnel

Settings for the managed remote connection. Most people never change these — the settings dialog handles the tunnel for you.

### `tunnel_server_url`

`string` — default `"wss://tunnel.ankimcp.ai"`

The WebSocket address of the tunnel relay the add-on connects to for remote access.

### `tunnel_client_id`

`string` — default `"ankimcp-cli"`

The OAuth client identifier the add-on presents when signing in to the tunnel.

## Interface

### `show_settings_menu_item`

`boolean` — default `true`

Shows the *AnkiMCP Server Settings…* entry in Anki's **Tools** menu. Set to `false` to hide it. Takes effect after an Anki restart.

{{< callout type="warning" >}}
Hide the menu item **and** the toolbar indicator and there's no in-app way left to open the settings dialog. You can still edit the JSON via *Tools → Add-ons → AnkiMCP Server → Config*.
{{< /callout >}}

### `show_toolbar_indicator`

`boolean` — default `true`

Shows the persistent `● AnkiMCP` item in Anki's top toolbar, which reports tunnel connection state — grey for off, amber for connecting, green for connected. Clicking it opens the settings dialog. Set to `false` to hide it. Takes effect after an Anki restart.

### `show_sync_tooltip`

`boolean` — default `true`

When an AI client triggers a sync, the add-on shows a brief non-modal tooltip as the sync starts and finishes (`AnkiMCP: syncing…`, `AnkiMCP: sync complete`). It's the only visual cue for these otherwise-silent background syncs. Set to `false` to suppress it.

## Diagnostics

### `log_to_file`

`boolean` — default `false`

Writes a rotating diagnostic log to the add-on's `user_files/ankimcp.log` (about 1 MB per file, 3 backups kept). **Off by default.** Takes effect after an Anki restart.

When enabled, the add-on records a startup snapshot — add-on, Anki, Qt and Python versions, plus where shared libraries like `pydantic`, `mcp` and `protobuf` were actually loaded from. That last part is the key data for diagnosing conflicts between add-ons.

Secrets are **redacted** before anything reaches disk: the `http_api_key`, OAuth tokens, and any `Bearer` token.

The settings dialog (*Tools → AnkiMCP Server Settings…*) has an **Open log folder** button and a **Copy diagnostics** button, the latter giving you the same snapshot formatted for pasting into a [forum post](https://forum.ankimcp.ai/).

## Related

- [Tool reference](../tools/) — every valid tool and action name for `disabled_tools`.
- [Remote access security](/docs/concepts/remote-access-security/) — the full story on hosts, origins, API keys, CORS and media.
- [Troubleshooting](/docs/how-to/troubleshooting/) — when something isn't connecting.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects.*
