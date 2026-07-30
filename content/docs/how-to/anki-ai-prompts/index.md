---
title: "How to Use AI Prompts to Generate Anki Flashcards"
linkTitle: "AI prompts for flashcards"
description: "Proven AI prompts that turn notes into well-formed Anki flashcards — plus AnkiMCP's built-in prompts for one-click card creation and guided review."
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

AnkiMCP ships with ready-made prompts that coach the AI on how to write good cards and run reviews. You attach one, say what you want, and Claude does the rest. This guide shows you the two built-in prompts, how to attach them, and [copy-paste prompts that work in any AI](#copy-paste-prompts-that-work-in-any-ai).

## What you need

- **Claude connected to Anki.** Finish [Connect Claude to Anki](/docs/how-to/connect-claude/) first.
- **Anki open**, with at least one deck of notes.

**Time:** about 2 minutes.

## What are built-in prompts?

A prompt is a set of expert instructions you hand to the AI. It tells Claude *how* to do a task before you ask. AnkiMCP includes two, so you get consistent, high-quality help every time.

## The built-in prompts

Both come built into AnkiMCP.

| Prompt | What it does |
|---|---|
| `twenty_rules` | Coaches the AI to write effective cards using Dr. Piotr Wozniak's "Twenty Rules of Formulating Knowledge." Keeps cards simple, atomic, and clear. Best for turning notes or textbooks into cards. |
| `anki_review` | Guides a spaced-repetition review session: sync, show one card at a time, wait for your answer, then rate it (Again, Hard, Good, Easy). Best for daily study. |

Prompts can change between releases. For the latest list, see the [AnkiMCP repo](https://github.com/ankimcp/anki-mcp-server).

## Step 1: Attach a prompt

In Claude, prompts attach the same way as files.

1. Click the **attachment button (+)** in the message box.
2. Open **Connectors**, then choose **Add from [your connector's name]** — the menu item shows whatever name you gave your AnkiMCP connector.
3. Pick a prompt from the list. In the menu, they appear with friendlier names: `twenty_rules` shows as **Twenty rules**, and `anki_review` shows as **Review session**.

The prompt's instructions attach to your chat. Claude now knows the rules to follow.

{{< callout type="info" >}}
**Using a client without an attachment menu?** Copy the prompt text into the chat instead — the [copy-paste prompts below](#copy-paste-prompts-that-work-in-any-ai) work anywhere.
{{< /callout >}}

<img src="claude-prompts-menu.png" width="700" alt="Claude's attachment menu with the AnkiMCP connector enabled: the Add from AnkiMCP.ai submenu lists prompts including Review session and Twenty rules." />

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

<img src="claude-creating-cards.png" width="740" alt="Claude with the twenty_rules prompt attached creating a Pharmacology deck: the reply confirms 9 cloze notes making 10 cards, with the first cards listed as short single-fact cloze deletions." />

## Check it worked

Open Anki and look at your deck. With `twenty_rules`, you should see new, short, single-idea cards instead of long paragraphs. With `anki_review`, Claude should present cards one at a time and ask you to rate each one — not dump all the answers at once.

## Copy-paste prompts that work in any AI

You don't need the built-in prompts to get good cards. The prompts below work in any chatbot — Claude, ChatGPT, Gemini, or another. With AnkiMCP connected, the AI can add the cards to Anki for you. Without it, ask the AI to write the cards as text, then paste them into Anki yourself.

**Create flashcards from your notes:**

```text
Turn the notes below into flashcards for Anki. One idea per card.
Keep each question short and specific, and each answer to a single
fact. Add the cards to my "[deck name]" deck.

[paste your notes]
```

**Make cloze (fill-in-the-blank) cards:**

```text
Turn the text below into Anki cloze cards. Blank out only one key
term per card, and keep the surrounding sentence short. Add them
to my "[deck name]" deck.

[paste your text]
```

**Review me like a tutor:**

```text
Quiz me on [topic] like a friendly tutor. Ask one question at a
time and wait for my answer. Tell me if I'm right, and explain
briefly if I'm wrong. Start easy and get harder.
```

**Language learning — translate and make a card:**

```text
I'm learning [language]. For the word or phrase "[word]", give me
the translation, one short example sentence, and a note on
pronunciation. Then make an Anki card with [language] on the front
and the rest on the back, in my "[deck name]" deck.
```

## Fix common problems

**I don't see any prompts in the attachment menu.**
The AnkiMCP server isn't connected. Open Claude Desktop, confirm the AnkiMCP extension is installed, and restart Claude. See [Connect Claude to Anki](/docs/how-to/connect-claude/#claude-desktop).

**Claude made cards but ignored the rules.**
Re-attach the `twenty_rules` prompt and ask again. The prompt only guides chats where it's attached, so start a fresh request with it on.

## Common questions

**Can I write my own prompt instead?**
Yes. You can type any instruction in the chat. The built-in prompts just save you from writing the rules yourself.

**Which prompt should I use to make cards?**
Use `twenty_rules`. It's built for creating well-formed flashcards. Use `anki_review` only for studying existing cards.

## Next steps

- New here? Start with [Connect Claude to Anki](/docs/how-to/connect-claude/).
- Want to study, not just build? Re-read the `anki_review` flow above.
- Read the source of the card rules: [Twenty Rules of Formulating Knowledge](https://www.supermemo.com/en/blog/twenty-rules-of-formulating-knowledge).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
