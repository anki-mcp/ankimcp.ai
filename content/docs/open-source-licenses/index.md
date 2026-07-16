---
title: "Open-Source Licenses and Source Availability"
linkTitle: "Open-source licenses"
description: "The open-source software behind AnkiMCP — Anki, KasmVNC, and more — with each component's license and where to download the complete source code for each part."
keywords:
  - ankimcp license
  - anki mcp open source
  - anki agpl
  - kasmvnc license
  - ankimcp source code
weight: 10
sitemap_priority: 0.5
---

**AnkiMCP is built on open-source software. This page credits those projects, lists their licenses, and shows you where to get the source code.**

We are grateful to the maintainers of every project below. Without them, AnkiMCP would not exist.

## The hosted Anki service

Each hosted instance runs the real Anki desktop app — unmodified, from the official release — with two AnkiMCP add-ons loaded into it. Anki is licensed under the AGPL-3.0-or-later. Because you interact with this combination over the network, its complete source code is available:

| Component                    | License           | Source                                                                                                                    |
| ---------------------------- | ----------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Anki desktop (aqt, currently 26.5)**  | AGPL-3.0-or-later | [github.com/ankitects/anki](https://github.com/ankitects/anki) (also published on [PyPI as `aqt`](https://pypi.org/project/aqt/)) |
| **AnkiMCP add-on**           | AGPL-3.0-or-later | [github.com/ankimcp/anki-mcp-server-addon](https://github.com/ankimcp/anki-mcp-server-addon)                               |
| **CI Buddy add-on**          | AGPL-3.0-or-later | [github.com/ankimcp/anki-ci-buddy](https://github.com/ankimcp/anki-ci-buddy)                                               |
| **headless-anki base image** | AGPL-3.0          | [github.com/ankimcp/headless-anki](https://github.com/ankimcp/headless-anki)                                               |

## The remote desktop (VNC) viewer

The remote desktop viewer in your browser is the Kasm noVNC web client, shipped unmodified. Its source lives at [github.com/kasmtech/noVNC](https://github.com/kasmtech/noVNC) and it combines a few licenses:

| Part                       | License        |
| -------------------------- | -------------- |
| **JavaScript client code** | MPL-2.0        |
| **HTML and CSS**           | BSD-2-Clause   |
| **Orbitron font**          | SIL OFL 1.1    |
| **pako (compression)**     | MIT            |

On the server side, the viewer connects to the KasmVNC server (GPL-2.0, [github.com/kasmtech/KasmVNC](https://github.com/kasmtech/KasmVNC)) running inside your hosted instance.

## Inside the hosted instance

More open-source software runs on our servers to power each hosted instance. We want to acknowledge it too:

| Component        | License                        | Project                                                          |
| ---------------- | ------------------------------ | ---------------------------------------------------------------- |
| **KasmVNC server** | GPL-2.0                      | [github.com/kasmtech/KasmVNC](https://github.com/kasmtech/KasmVNC) |
| **rclone**       | MIT                            | [rclone.org](https://rclone.org/)                                |
| **TeX Live**     | Various free software licenses | [tug.org/texlive](https://tug.org/texlive/)                      |
| **Openbox**      | GPL-2.0                        | [openbox.org](https://openbox.org/)                               |
| **Debian**       | Various free software licenses | [debian.org](https://www.debian.org/)                            |
| **gVisor**       | Apache-2.0                     | [gvisor.dev](https://gvisor.dev/)                                |

## The web dashboard

The AnkiMCP dashboard is built with open-source libraries too. Almost all of them use the MIT, Apache-2.0, BSD, or ISC license — among them React, Radix UI, TanStack Table, KaTeX, wavesurfer.js, and Lucide icons.

Two components deserve a specific mention:

- **@breezystack/lamejs** ([LGPL-3.0](https://www.gnu.org/licenses/lgpl-3.0.html)) — encodes MP3 audio directly in your browser. Source: [github.com/gideonstele/lamejs](https://github.com/gideonstele/lamejs)
- **Material Design Icons font** (Apache-2.0) — the community-maintained icon font by Pictogrammers, used in parts of the interface.

## Getting the source

AnkiMCP's own open-source code is public on GitHub:

- **[CLI server](https://github.com/ankimcp/anki-mcp-server)** (MIT) — the command-line MCP server you can run yourself
- **[AnkiMCP add-on](https://github.com/ankimcp/anki-mcp-server-addon)** (AGPL-3.0-or-later) — the add-on that runs inside Anki
- **[CI Buddy add-on](https://github.com/ankimcp/anki-ci-buddy)** (AGPL-3.0-or-later) — the helper add-on used in hosted instances
- **[headless-anki](https://github.com/ankimcp/headless-anki)** (AGPL-3.0) — the base image for hosted Anki instances

The hosted platform itself — the dashboard, tunnel service, and account system — is AnkiMCP's own service code. The open-source components of AnkiMCP are the repositories linked above.

{{< callout type="info" >}}
Want the exact source code for a specific hosted version? Email [support@ankimcp.ai](mailto:support@ankimcp.ai) or ask on the [community forum](https://forum.ankimcp.ai/), and we'll point you to it.
{{< /callout >}}

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
