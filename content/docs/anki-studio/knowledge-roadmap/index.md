---
title: "The Knowledge Roadmap: See What You Actually Know"
linkTitle: "Knowledge Roadmap"
description: "Turn your Anki deck from a black box into a living map: see what you've mastered, what's decaying, and what to learn next — built with your AI."
keywords:
  - anki roadmap
  - knowledge map
  - anki progress visualization
  - learning roadmap
  - anki deck overview
  - spaced repetition progress
  - AI learning map
weight: 2
draft: true
---

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🚧 SCAFFOLD — NOT A FINISHED ARTICLE. Written 2026-07-06 while the feature was being built, to capture the core idea while fresh. Every section below needs completion, screenshots, and a pass for accuracy against the shipped product (the feature AND this site are both under heavy change right now). Frontmatter has <code>draft: true</code> — remove it only after the review. Delete this box when done.</div>

**Your Anki deck knows more about your learning than you do — the roadmap finally lets you see it.** It's a visual map of a subject, connected to your real deck: every node shows how much of that topic you've mastered, how many cards back it, and what's due today.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: hero shot — a real roadmap with a mapped deck: spine of main topics, subtopics with progress bars, status chips (Learning / Reviewing / Mastered), due counts. Ideally a short GIF of "Sync Anki stats" updating the numbers live.</div>

## The deck was a black box. Now it isn't.

<!-- TODO: polish wording; this is the CORE SECTION of the article — keep the emphasis -->

Anki has an old, quiet problem: **a deck is write-only memory.** You pour cards in, and the only interface back is the daily grind of reviews. After six months you have two thousand cards — and no way to *see* what you know. Which areas are solid? Which are quietly decaying? Where are the gaps? The deck can't tell you. You created it, and then it became a black box.

The roadmap inverts that. It makes the structure of your knowledge **visible** — where you're strong, what's decaying, what's next. And the moment you can see that, you stop just *doing reviews* and start **steering**: which subtopic to push this week, where to add cards, what to ask your AI to build out next.

The map stops being a picture of your learning. **It becomes the instrument of it.**

That's also why it matters more than a dashboard. For someone months in, the roadmap isn't a *view* of their process — it *is* their process. The cards would survive losing it; the practice wouldn't. It's the same reason losing a paper notebook hurts more than losing the textbook: the textbook is replaceable, the accumulated structure of your own understanding is not.

## What a roadmap is

<!-- TODO: expand; keep plain-language. Mention: tree of nodes (main topics on a spine, subtopics as leaves, groups, links to other roadmaps); built node by node; rendered live in the dashboard. -->

A roadmap is a tree of topics:

- **Main topics** form the spine — the backbone of the subject.
- **Subtopics** branch off — the concrete things you study.
- **Groups** collect related subtopics into one box.
- **Link nodes** connect one roadmap to another, so maps compose.

You can build it by hand in the dashboard, or — the interesting part — **your AI builds it with you** over MCP: it reads your deck, proposes a structure, and creates the map node by node.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: the editor — right-click context menu (attach main / subnode / metanode) and the node details panel side by side.</div>

## How the map connects to your real deck

<!-- TODO: verify terminology against final UI copy. -->

The connection is two simple bindings:

- The **root node** is mapped to an **Anki deck** (pick it from your decks — subdecks included).
- Each **subtopic** is mapped to one or more **note tags** from that deck.

That's it. Press **Sync Anki stats** (or let your AI call it) and every mapped node gets its numbers from your actual collection:

| Metric | Meaning |
|---|---|
| **Progress** | % of the node's cards that are *mature* — review cards with an interval of 21+ days (Anki's own definition of "you know this") |
| **Cards** | how many cards back this node (suspended/buried excluded) |
| **Due today** | how many of them are waiting for review right now |

<!-- TODO: short paragraph on WHY mature ratio was chosen as the "% mastered" definition (works without FSRS, universal vocabulary, community standard); mention FSRS retrievability as a possible future upgrade. Link to the power-of-anki page. -->

New cards count as not-yet-mastered, so a fresh deck starts near 0% and the map fills with color as you actually learn. Nothing is self-reported: the numbers come from your review history, not from what you *feel* you know.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: node details panel showing deck binding (root) and the tag picker (subnode) with real tags from a deck.</div>

## Built together with your AI

<!-- TODO: expand with a real conversation example (like the how-to pages do): "map my Spanish deck" → AI lists decks, creates the roadmap, binds tags, syncs stats. List the MCP tools briefly or link to a reference page. -->

The roadmap lives on the AnkiMCP studio MCP endpoint, so any connected AI (Claude, ChatGPT, …) can:

- create a roadmap and grow it node by node,
- bind the root to your deck and subtopics to your tags,
- sync the stats and read back where you stand,
- and use that to *plan with you* — "your weakest area is X, let's add cards there."

Everything the AI does appears in your dashboard **live** — you watch the map grow while you talk.

## What you need

<!-- TODO: verify against final requirements + pricing at publish time. -->

- An AnkiMCP account (the roadmap is part of the dashboard).
- Anki running with the **AnkiMCP add-on** for stats sync. **Add-on only for now:** the CLI connection can't serve deck statistics — see [Add-on vs CLI](/docs/concepts/add-on-vs-cli/).
- Free tier includes one roadmap; paid removes the limit.

## FAQ

<!-- TODO: fill after launch feedback. Candidates: -->
<!-- - What happens to my map if I rename/delete the deck? -->
<!-- - Do my cards leave my machine? (No — only aggregate stats travel.) -->
<!-- - Can I export a roadmap? -->
<!-- - Does it work without FSRS? (Yes — mature ratio is FSRS-independent.) -->
<!-- - Can two roadmaps share a deck? -->
