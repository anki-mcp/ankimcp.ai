---
title: "AnkiMCP Add-on Tool Reference: Every MCP Tool, Resource and Prompt"
linkTitle: "Tools"
description: "Every MCP tool, resource and prompt the AnkiMCP Anki add-on exposes to your AI assistant, grouped by area, including the destructive opt-in ones."
keywords:
  - Anki MCP tools
  - AnkiMCP tool reference
  - MCP tools list
  - Anki AI tools
  - card_management
  - destructive tools
  - AnkiMCP add-on
weight: 1
sitemap_priority: 0.7
---

**This page lists everything the AnkiMCP add-on offers your AI assistant: the tools it can call, the read-only resources it can look up, and the ready-made prompts it can start from.** You don't need to memorise any of it — your assistant discovers these automatically. This page is here for when you want to check exactly what exists, or decide what to switch off.

{{< callout type="info" >}}
**This documents the Anki add-on**, the version that runs inside the Anki desktop app. The **AnkiMCP CLI** is a separate product with its own tool list, documented separately — nothing on this page describes it. See [Add-on vs CLI](/docs/concepts/add-on-vs-cli/) if you're unsure which you have.
{{< /callout >}}

## At a glance

| | Count |
|---|---|
| Tools | **42** |
| ...of which are multi-action tools | 4 (`card_management`, `tag_management`, `filtered_deck`, `model_fields`), 24 actions between them |
| ...of which are destructive and hidden by default | 1 whole tool + 1 action |
| Resources | **7** |
| Prompts | **2** |

Documented against add-on **v0.27.0**. Any tool or action can be switched off with [`disabled_tools`](../configuration/#disabled_tools), and the destructive ones stay hidden until you list them in [`enabled_destructive_tools`](../configuration/#enabled_destructive_tools).

## Destructive tools (hidden by default)

Two things are classified as **destructive** — high-risk operations that rewrite or delete data across many notes at once. The add-on **removes them from the tool list entirely** unless you opt in. Your AI assistant cannot see them, so it cannot call them by accident.

| Entry | Type | Why it's destructive |
|---|---|---|
| `change_note_type` | Whole tool | Rewrites every selected note's field layout. |
| `model_fields:remove` | Single action | Permanently deletes a field and its content on **every** note of that note type. |

To expose either one, add it to `enabled_destructive_tools` — see the [configuration reference](../configuration/#enabled_destructive_tools). Opting in a whole tool does **not** implicitly opt in its destructive actions; list `tool:action` separately.

## Essential tools

The main working set. These are the tools your assistant reaches for most.

### Decks and search

| Tool | What it does |
|---|---|
| `list_decks` | List all decks. Returns `deck_id`, `name`, `is_filtered`; `include_stats=true` adds per-deck counts. |
| `create_deck` | Create a new empty deck. Supports `parent::child` nesting, up to 2 levels. Won't overwrite an existing deck. |
| `find_notes` | Search for notes using Anki's search syntax. `include_first_field=true` adds a `noteLabels` array (`noteId`, `firstField`, `truncated`, `fullLength`) so you can search and label in one call. |
| `notes_info` | Get detailed information about specific notes — fields, tags, note type, CSS. `excerpt_chars` caps every field value at that many characters and marks it `truncated`/`fullLength`, a cheap way to survey many notes. |
| `sync` | Synchronise the collection with AnkiWeb. Asynchronous job: `sync()` starts one, `sync(job_id)` polls its status, `sync(job_id, resolve=...)` resolves a full-sync conflict. |

### Notes

| Tool | What it does |
|---|---|
| `add_note` | Add a single note to a deck. |
| `add_notes` | Batch-add up to `max_notes_per_batch` notes (default 100) sharing one deck and note type. Uses Anki's native batch API for atomic undo. Partial success — one failure doesn't sink the rest. |
| `update_note_fields` | Update the fields of an existing note. Two modes: full replace, or patch via `old_str`/`new_str` (find-and-replace within a field; must match exactly once or nothing is written). |
| `update_notes` | Batch-update fields on many notes in one atomic undo step. Validates every entry first; partial success, up to `max_notes_per_batch`. |
| `delete_notes` | Delete notes by ID, removing all their cards. Requires `confirmDeletion=true` as a safeguard; `dry_run=true` previews what would go. |

### Cards, review and stats

| Tool | What it does |
|---|---|
| `get_due_cards` | Get the next card due for review, in true scheduler order. `skip_images`/`skip_audio` support voice-mode review. |
| `present_card` | Get a card's content for review — question first, then the answer with `show_answer=true`. |
| `rate_card` | Rate a card after review (Again / Hard / Good / Easy) and update its scheduling. |
| `cards_stats` | Bulk per-card scheduling stats for a deck and its subdecks: type, queue, interval, tags, due-today. Paginated (max 1000 per page), FSRS-independent, compact payload for analytics. |

### Note types (models)

| Tool | What it does |
|---|---|
| `model_names` | List all available note types, plus `commonTypes` shortcuts (basic, basicReversed, cloze). |
| `model_field_names` | Get the field names and descriptions for one note type. |
| `create_model` | Create a new note type. |
| `model_styling` | Read the CSS for a note type. `include_latex=true` also returns the LaTeX preamble (`latex_pre`, `latex_post`, `latex_svg`). |
| `update_model_styling` | Update that CSS — full replace, or patch via `old_str`/`new_str` (must match exactly once). Can also write the LaTeX preamble. |
| `model_templates` | Read the Front/Back HTML templates for each card type in a note type. |
| `update_model_templates` | Update template HTML — full replace, or patch via `old_str`/`new_str`. Rejects unknown keys (case-sensitive) and unknown template names up front and applies all edits atomically; a failed call leaves the note type unchanged. |
| `change_note_type` | Move existing notes to a different note type, remapping fields by name (`{old field: new field or null}`). **Destructive — hidden unless opted in.** Two-step flow: `dry_run=true` returns the resolved plan (mapping, dropped fields, cards removed), then the same call with `dry_run=false` **and** `confirm=true` applies it. All notes must share one source note type. |

### Media

| Tool | What it does |
|---|---|
| `store_media_file` | Store an image, audio or other media file via base64 data, a local file path, or a URL. File paths are checked against a media-type allowlist; URLs are checked for SSRF. |
| `get_media_files_names` | List media files matching a pattern, e.g. `*.mp3`. |
| `delete_media_file` | Move a media file to Anki's trash — recoverable via Anki's Check Media dialog until the trash is emptied. |

## Multi-action tools

Four tools bundle several related operations behind one `action` parameter. That keeps the tool list short, which keeps your assistant's token usage down. Each action can be switched off individually with `"tool:action"` in `disabled_tools`.

### `card_management` — 9 actions

Manage card organisation.

| Action | What it does |
|---|---|
| `reposition` | Set the position of new cards in the learning queue. |
| `change_deck` | Move cards between decks. |
| `bury` | Hide cards until tomorrow. |
| `unbury` | Un-hide buried cards. |
| `suspend` | Exclude cards from review indefinitely. |
| `unsuspend` | Return suspended cards to review. |
| `set_flag` | Set a colour flag, 0–7 (0 clears it). |
| `set_due_date` | Reschedule cards using Anki's days DSL. |
| `forget_cards` | Reset cards to new. |

### `tag_management` — 6 actions

Manage tags on notes.

| Action | What it does |
|---|---|
| `add_tags` | Bulk-add tags to notes. |
| `remove_tags` | Bulk-remove tags from notes. |
| `replace_tags` | Swap one tag for another. |
| `get_tags` | List all tags, or scope to a deck with the optional `deck` parameter — the distinct tags on notes that have a card in that deck, subdecks included. |
| `clear_unused_tags` | Remove orphaned tags no longer used by any note. |
| `batch_tags` | Apply several add/remove operations in one call, with partial success. |

### `filtered_deck` — 5 actions

Filtered (cram) deck lifecycle.

| Action | What it does |
|---|---|
| `create_or_update` | Create a filtered deck, or modify an existing one's search terms, limits and order. |
| `rebuild` | Repopulate a filtered deck from its search terms. |
| `empty` | Return all cards to their home decks, leaving the deck in place. |
| `delete` | Delete the filtered deck (cards return to their home decks). |
| `get_info` | Inspect decks by ID: search terms, limits, order, reschedule setting and card count. Non-filtered decks come back with `is_filtered=false`; unknown IDs are skipped and counted in `not_found`. Max 50 deck IDs per call. |

### `model_fields` — 4 actions

Manage the fields on an existing note type.

| Action | What it does |
|---|---|
| `add` | Add a field, optionally at a 0-based index. |
| `rename` | Rename a field, preserving its content. Card templates are **not** updated automatically — you have to fix references yourself. |
| `reposition` | Reorder fields. |
| `remove` | Delete a field and its content on every note of that type. **Destructive — hidden unless opted in** via `enabled_destructive_tools`. |

**One-way full sync warning:** `add`, `remove` and `reposition` change field ordinals and force a one-way full sync; a pure `rename` does not. Every result carries `will_force_full_sync`, reflecting the collection's actual (sticky, collection-wide) state after the write.

## FSRS tools

FSRS is Anki's modern scheduling algorithm. These four tools read and tune it.

| Tool | What it does |
|---|---|
| `get_fsrs_params` | Get FSRS scheduler parameters for deck presets. With an empty `deck_name`, returns every preset and the decks using it. |
| `set_fsrs_params` | Update FSRS parameters on a preset: weights, desired retention (0.70–0.99), max interval. Returns an old/new diff for each changed field. |
| `get_card_memory_state` | Get FSRS memory state — stability, difficulty, retrievability — for one or more cards. Requires FSRS to be enabled; `recompute=True` recalculates from review history. |
| `optimize_fsrs_params` | Run Anki's built-in FSRS optimizer over your review history. `apply_results=False` (the default) is a dry run that shows what it would change. |

## GUI tools

These drive Anki's own windows — useful when you want to *see* something happen on screen, rather than have it done silently in the background.

| Tool | What it does |
|---|---|
| `gui_browse` | Open the card browser with a search query. Returns the matching card IDs. |
| `gui_add_cards` | Open the Add Cards dialog (it does not pre-fill fields). |
| `gui_edit_note` | Open the note editor for a specific note ID. |
| `gui_current_card` | Get the card currently on screen in the reviewer: question and answer HTML, fields, note and card IDs, deck, note type, and the interval behind each answer button. |
| `gui_show_question` | Show the question side of the card on screen. |
| `gui_show_answer` | Flip the card on screen to its answer side. |
| `gui_select_card` | Select a specific card in an already-open card browser. |
| `gui_deck_browser` | Navigate to the deck browser. |
| `gui_undo` | Undo the last operation in Anki. |

## Resources

Resources are read-only lookups. Your assistant fetches them by URI instead of calling a tool.

| Resource | URI | What it returns |
|---|---|---|
| `system_info` | `anki://system-info` | Anki version, current profile, scheduler info. |
| `query_syntax` | `anki://query-syntax` | Anki's search query syntax reference. |
| `schema` | `anki://schema` | The Anki data model: entities, fields, relationships, key concepts. |
| `stats_today` | `anki://stats/today` | Today's study statistics — cards studied, time spent, ratings breakdown. |
| `stats_forecast` | `anki://stats/forecast` | 30-day review forecast of expected due cards per day. |
| `stats_collection` | `anki://stats/collection` | Overall collection statistics: total notes, cards, state breakdown. |
| `fsrs_config` | `anki://fsrs/config` | FSRS status, version, preset count and parameter overview. |

## Prompts

Prompts are ready-made workflows. In most AI clients they appear as something you pick from a menu rather than type out.

| Prompt | What it does |
|---|---|
| `review_session` | Runs a structured review session — presents cards, collects your answers, suggests ratings. Interactive, quick, or voice mode. |
| `twenty_rules` | Applies Dr Piotr Woźniak's twenty rules of formulating knowledge, so the cards your assistant writes are actually good cards. |

## Turning tools off

Every tool and every action can be hidden from your AI client. Reasons you might: fewer tools means fewer tokens per request, and some people simply don't want an assistant able to delete notes.

```json
{
  "disabled_tools": [
    "sync",
    "card_management:bury",
    "card_management:unbury"
  ]
}
```

`"tool_name"` disables the whole tool; `"tool_name:action"` disables one action inside a multi-action tool. Disabled entries are stripped from the MCP schema entirely, so clients never see them. Full syntax and the opt-in list for destructive tools are on the [configuration reference](../configuration/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
