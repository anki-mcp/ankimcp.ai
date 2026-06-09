---
title: "How to Use AI Prompts to Generate Anki Flashcards"
linkTitle: "AI prompts for flashcards"
description: "Use AnkiMCP's built-in AI prompts to turn your notes into well-formed Anki flashcards and run guided spaced-repetition review sessions with Claude."
keywords:
  - anki ai prompt
  - prompt for anki flashcards
  - anki prompt
  - ai prompt for anki cards
  - ai flashcard prompt
  - anki ai assistant
weight: 4
sitemap_priority: 0.8
aliases:
  - /docs/prompts/
---

**Attach a built-in AnkiMCP prompt in Claude, then ask it to make cards — and Claude builds well-formed flashcards using proven rules.**

AnkiMCP ships with ready-made prompts that coach the AI on how to write good cards and run reviews. You attach one, say what you want, and Claude does the rest. This guide shows you the two built-in prompts, how to attach them, and one prompt you can copy.

## What you need

- **Claude connected to Anki.** Finish [Connect Claude to Anki](/docs/how-to/connect-claude-to-anki/) first.
- **Anki open**, with at least one deck of notes.

**Time:** about 2 minutes.

## What are built-in prompts?

A prompt is a set of expert instructions you hand to the AI. It tells Claude *how* to do a task before you ask. AnkiMCP includes two, so you get consistent, high-quality help every time.

## The built-in prompts

These ship inside the AnkiMCP server. Both are grounded in the project repo.

| Prompt | What it does |
|---|---|
| `twenty_rules` | Coaches the AI to write effective cards using Dr. Piotr Wozniak's "Twenty Rules of Formulating Knowledge." Keeps cards simple, atomic, and clear. Best for turning notes or textbooks into cards. |
| `anki_review` | Guides a spaced-repetition review session: sync, show one card at a time, wait for your answer, then rate it (Again, Hard, Good, Easy). Best for daily study. |

Prompts can change between releases. For the latest list, see the [AnkiMCP repo](https://github.com/ankimcp/anki-mcp-server).

## Step 1: Attach a prompt

In Claude Desktop, prompts attach the same way as files.

1. Click the **attachment button (+)** in the message box.
2. Choose **Add from Anki MCP Server**.
3. Pick **Twenty rules** or **Anki review** from the list.

The prompt's instructions attach to your chat. Claude now knows the rules to follow.

<!-- screenshot: Claude Desktop attachment menu showing "Twenty rules" and "Anki review" prompts -->

## Step 2: Ask for what you want

Type your request in plain language. Claude follows the attached prompt for the rest of the chat.

For cards, attach `twenty_rules` and try:

```text
Make 10 Anki flashcards from these notes, one idea per card.
Use my "Biology" deck. [paste your notes]
```

For review, attach `anki_review` and say:

```text
Let's review my Spanish deck.
```

Claude shows one card, waits for your answer, reveals it, and asks you to rate it.

<!-- screenshot: Claude creating flashcards in a deck after the twenty_rules prompt is attached -->

## Check it worked

Open Anki and look at your deck. With `twenty_rules`, you should see new, short, single-idea cards instead of long paragraphs. With `anki_review`, Claude should present cards one at a time and ask you to rate each one — not dump all the answers at once.

## Fix common problems

**I don't see any prompts in the attachment menu.**
The AnkiMCP server isn't connected. Open Claude Desktop, confirm the AnkiMCP extension is installed, and restart Claude. See [Connect Claude to Anki](/docs/how-to/connect-claude-to-anki/).

**Claude made cards but ignored the rules.**
Re-attach the `twenty_rules` prompt and ask again. The prompt only guides chats where it's attached, so start a fresh request with it on.

**Can I write my own prompt instead?**
Yes. You can type any instruction in the chat. The built-in prompts just save you from writing the rules yourself.

**Which prompt should I use to make cards?**
Use `twenty_rules`. It's built for creating well-formed flashcards. Use `anki_review` only for studying existing cards.

## Next steps

- New here? Start with [Connect Claude to Anki](/docs/how-to/connect-claude-to-anki/).
- Want to study, not just build? Re-read the `anki_review` flow above.
- Read the source of the card rules: [Twenty Rules of Formulating Knowledge](https://www.supermemo.com/en/blog/twenty-rules-of-formulating-knowledge).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
