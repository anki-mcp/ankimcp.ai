---
title: "The Sandbox: Build Cards Together With Your AI"
linkTitle: "Sandbox"
description: "A shared workbench where you and your AI draft Anki cards side by side — the AI writes, you polish live in the dashboard, and only approved cards get pushed to your real deck."
keywords:
  - anki card sandbox
  - AI anki cards
  - anki card preview
  - anki card template editor
  - ankimcp sandbox
  - co-edit anki cards
weight: 3
draft: true
---

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🚧 SCAFFOLD — NOT A FINISHED ARTICLE. Written 2026-07-10 while the feature was being built, to capture the concepts while fresh. Placeholder-level on purpose: a dedicated writing pass will expand it. The support matrix below IS meant to be kept accurate. Frontmatter has <code>draft: true</code> — remove it only after the review. Delete this box when done.</div>

**The sandbox is where cards are made — together.** Your AI drafts a card, you see it render instantly in the dashboard exactly as Anki will show it, you fix a word or restyle it, the AI picks up your changes and continues. Nothing touches your real deck until you say so.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: hero shot — the sandbox split view: live card preview on the left (a real rendered card, ideally RTL + math), the editor tabs (HTML / CSS / JS / Template) on the right, card chips with + Add card on top. Ideally a short GIF: AI adds a card over MCP and it appears live.</div>

## The idea in one paragraph

Making good Anki cards with an AI has an awkward gap: the AI writes HTML it can't see, and you see cards you didn't write. The sandbox closes the gap with one shared, live workspace. Both of you are editing the same draft session at the same time: the AI works through MCP tools, you work in the dashboard, and every change shows up on the other side within a second. The preview isn't an imitation — it renders your note type's real styling, templates and scripts the same way Anki itself does.

<!-- TODO: expand — the "both hands on the same card" story; maybe a 3-step comic: AI drafts → you polish → AI pushes. -->

## What's in a sandbox

One sandbox per account, and it holds **one note type at a time**:

- **The template** — the note type's styling (CSS), scripts (JS) and card layout, usually fetched by your AI straight from your Anki.
- **Draft cards** — up to 20 at once. Each card is just its field values; all cards share the template.

You can also start from nothing: the editors are always there, and typing into them creates a fresh sandbox on the spot.

## Drafts, not storage

The sandbox is a workbench, not a deck. Finished cards get pushed to your real Anki by the AI (using the same connection it always had), then cleared from the sandbox. Untouched drafts expire by themselves after 24 hours. **Clear sandbox** wipes the whole thing — template, styles, scripts, drafts — when you want a clean bench.

<!-- TODO: screenshot — the Clear sandbox confirmation; the card chips row with add/remove. -->

## What the preview supports today

The preview aims to render cards exactly as Anki does, but not every Anki template feature is implemented yet. What gets built next from this matrix will be prioritized by user feedback.

| Anki feature | Sandbox today |
|---|---|
| `{{Field}}` substitution | ✅ |
| `{{FrontSide}}` on the answer side | ✅ |
| Question / answer side preview | ✅ |
| Note type CSS | ✅ |
| Template `<script>` JS (hints, toggles) | ✅ |
| Shared session JS | ✅ |
| MathJax math (`\(…\)`, `\[…\]`, `<anki-mathjax>`) | ✅ |
| Images by URL (media library) | ✅ |
| Audio `[sound:…]` | ⚠️ plays for URL references only |
| Images by bare Anki filename | ❌ |
| Conditional sections `{{#Field}}` / `{{^Field}}` / `{{/Field}}` | ❌ |
| Field filters (`{{hint:…}}`, `{{text:…}}`, `{{furigana:…}}`, …) | ❌ |
| Cloze deletions `{{c1::…}}` | ❌ |
| Special fields (`{{Tags}}`, `{{Deck}}`, `{{Type}}`, `{{Card}}`) | ❌ |
| Type-in answers (`{{type:Field}}`) | ❌ |
| Multiple card templates per note type (e.g. Basic + reversed) | ❌ one template per sandbox |
| Full LaTeX (`[latex]…[/latex]`, `[$]…[$]`, packages, TikZ) | ❌ |
| Night mode preview | ❌ |
| Text-to-speech (`{{tts …}}`) | ❌ |
| Image occlusion | ❌ |

<!-- TODO (dedicated pass): how the live sync works in plain words; the manual-first flow (start without an AI); what "session" means vs this page's "sandbox" wording; troubleshooting (preview blank, session cleared). -->
