---
title: "How to Add Audio to Anki Cards with AI"
linkTitle: "Add audio to cards"
description: "Add audio to your Anki cards with AI. Tell Claude where the sound file is, and AnkiMCP stores it and embeds it into your flashcards for you."
keywords:
  - anki audio flashcards
  - add audio to anki cards
  - anki flashcards with audio
  - anki text to speech
  - anki voice
  - does anki support audio flashcards
weight: 8
sitemap_priority: 0.8
aliases:
  - /docs/audio-flashcards/
---

**Add audio to an Anki card by telling your AI where the sound file is, then letting AnkiMCP store it and embed it for you.**

AnkiMCP doesn't make voice audio itself. Instead, you point your AI to an audio file, and AnkiMCP saves it into your Anki collection and adds it to a card. This guide shows the real workflow, the methods that work, and the limits.

## What you need

- **Your AI connected to Anki.** Do the [Connect Claude to Anki](/docs/how-to/connect-claude/) guide first.
- **Anki open** on the same computer.
- **An audio file** you want on a card. This can be a file on your computer, a public URL, or a file made by a separate audio MCP server (see below).

**Time:** about 5 minutes.

## How audio gets onto a card

AnkiMCP uses the **`storeMediaFile`** tool to save your audio into Anki's media folder. It then writes Anki's sound tag into a card field, like `[sound:hello.mp3]`. That tag tells Anki to show a play button.

You can give the AI the audio in three ways:

1. **A file on your computer.** Tell the AI the file path. This is the fastest method.
2. **A public URL.** The AI downloads the file and stores it. No extra tools needed.
3. **A file from a TTS (text-to-speech) MCP server.** A separate server makes the voice audio, then AnkiMCP stores it.

Avoid pasting raw audio data. File paths and URLs are faster and use far fewer tokens.

## Step 1: Get your audio ready

Have the audio file in hand. Either:

- Save a sound file on your computer, and note its full path (like `/Users/you/hola.mp3`), or
- Find a public link to a pronunciation clip, or
- Use a separate **audio-generating MCP server** to make the voice. One example is the [ElevenLabs MCP server](https://github.com/elevenlabs/elevenlabs-mcp). It makes the audio file; AnkiMCP then stores it.

<!-- screenshot: an audio file selected in a file browser, showing its full path -->

## Step 2: Ask your AI to add the audio

Open your AI and make a plain request. Be clear about the file and the card.

For a new card:

> Create a card in my "Spanish" deck. Front: the audio file at /Users/you/hola.mp3. Back: "Hello".

For an existing card:

> Add the audio file at /Users/you/hola.mp3 to the front of the note I have selected in Anki.

The AI stores the file with `storeMediaFile`, then writes the `[sound:hola.mp3]` tag into the field.

<!-- screenshot: chat where the AI confirms it stored the audio file and added it to a card -->

## Step 3: Open Anki and study

Open your deck in Anki and start a review. The card with audio shows a **play button**. Click it to hear the sound.

## Check it worked

Find the card in Anki's **Browse** window. The field should contain a sound tag like `[sound:hola.mp3]`, and the card preview should show a play button. If you hear the audio, it worked.

## Supported audio types

AnkiMCP accepts common audio files. **MP3** is the safest and most common choice, and it plays on every Anki platform.

<!-- VERIFY: confirm the full list of audio formats Anki supports (e.g. mp3, ogg, wav) -->

The file path and URL methods only accept media files (audio, images, video). Other file types are blocked for safety.

## Fix common problems (mini-FAQ)

**Does AnkiMCP do text-to-speech?**
No. AnkiMCP doesn't make voice audio. It stores and embeds audio files you provide. To turn text into speech, pair it with a separate TTS MCP server, then let AnkiMCP store the result.

**Does Anki support audio flashcards?**
Yes. Anki plays audio with its `[sound:filename.mp3]` tag. AnkiMCP writes that tag for you, so you don't have to edit fields by hand.

**The AI says it added the audio, but the card didn't change.**
Updates fail silently if the note is open in Anki's Browse window. Close the browser, or pick a different note, then ask the AI to try again.

**I don't hear anything when I click play.**
Make sure the file is a real audio file and the name in the `[sound:...]` tag matches the stored file exactly. In Anki, run **Tools → Check Media** to find missing files.

## Next steps

- [Add images to your cards](/docs/how-to/add-images-to-cards/) using the same media tools.
- [Write better prompts for Anki](/docs/how-to/anki-ai-prompts/) so the AI makes the cards you want.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
