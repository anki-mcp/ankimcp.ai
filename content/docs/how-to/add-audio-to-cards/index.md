---
title: "How to Add Audio to Anki Cards (Manually or with AI)"
linkTitle: "Add audio to cards"
description: "Two ways to add audio to Anki cards: attach or record sound in Anki's editor, or let AI store the audio file and build the flashcard for you."
keywords:
  - anki audio flashcards
  - add audio to anki cards
  - anki flashcards with audio
  - anki voice
  - does anki support audio flashcards
weight: 6
sitemap_priority: 0.8
aliases:
  - /docs/audio-flashcards/
---

**To add audio to an Anki card, attach the sound file in Anki's editor — or record it there directly. With AI connected, you can instead tell your AI where the sound file is, and it stores and embeds the audio for you.**

This guide shows both: the standard Anki way for a card or two, and the AI way when you want audio cards built for you.

## The standard Anki way (no add-on needed)

For a single card, plain Anki already does this well:

1. In Anki, click **Add** (or open a card in **Browse**).
2. Click into the field where the sound should go.
3. Click the **paperclip icon** in the editor toolbar and pick your audio file — or click the **microphone icon** to record yourself directly.
4. Save the card. Anki copies the audio into your collection and shows a play button on the card.

<img src="anki-editor-toolbar.png" width="740" alt="Anki's Add note window with the editor toolbar along the top; the paperclip icon attaches audio files and the microphone icon records audio directly." />

That's the whole manual flow. The AI way below helps when you make many audio cards, or want the audio fetched from a link.

## Adding audio with AI

Whatever the audio comes from — a file you already have, a link, or a voice generated for you — you point your AI to it, and AnkiMCP saves it into your Anki collection and adds it to a card. The rest of this guide shows that workflow, the methods that work, and the limits.

## What you need

- **Your AI connected to Anki.** Do the [Connect Claude to Anki](/docs/how-to/connect-claude/) guide first.
- **Anki open** on the same computer.
- **An audio file** you want on a card. This can be a file on your computer, a public URL, a voice made by [Anki Studio's text to speech](/docs/anki-studio/text-to-speech/), or a file made by a separate audio MCP server (see below).

**Time:** about 5 minutes.

## How audio gets onto a card

AnkiMCP saves your audio file into Anki's media folder. It then writes Anki's sound tag into a card field, like `[sound:hello.mp3]`. That tag tells Anki to show a play button.

You can give the AI the audio in three ways:

1. **A file on your computer.** Tell the AI the file path. This is the fastest method.
2. **A public URL.** The AI downloads the file and stores it. No extra tools needed.
3. **Generated audio.** [Anki Studio's text to speech](/docs/anki-studio/text-to-speech/) makes the voice for you and saves the mp3 in your media library. A separate TTS (text-to-speech) MCP server works too.

Avoid pasting raw audio data. File paths and URLs are faster and use far fewer tokens.

## Step 1: Get your audio ready

Prepare the audio file first, in one of three ways:

- **Save a sound file on your computer** and note its full path — like `/Users/you/hola.mp3` on a Mac, or `C:\Users\you\hola.mp3` on Windows. Not sure how to copy a path? See the tip in [Add images to your cards](/docs/how-to/add-images-to-cards/#by-file-on-your-computer).
- **Find a public link** to a pronunciation clip.
- **Ask [Anki Studio](/docs/anki-studio/text-to-speech/) to make the voice.** It turns your text into an mp3 and saves it in your media library, ready to put on a card. An alternative is a separate audio-generating MCP server, such as the [ElevenLabs MCP server](https://github.com/elevenlabs/elevenlabs-mcp).

<img src="finder-hola-mp3.png" width="700" alt="Finder with hola.mp3 selected in Downloads; the path bar at the bottom shows the full path anatoly, Downloads, hola.mp3." />

## Step 2: Ask your AI to add the audio

Open your AI and make a plain request. Be clear about the file and the card.

For a new card:

> Create a card in my "Spanish" deck. Front: the audio file at /Users/you/hola.mp3. Back: "Hello".

For an existing card, describe the card by its content:

> Add the audio file at /Users/you/hola.mp3 to the front of my card about "hola".

(On Windows, the path looks like `C:\Users\you\hola.mp3`.)

One thing to know before you update an existing card: **close Anki's Browse window first.** If the note is open in Browse while the AI updates it, the change may not be saved, and you won't see an error.

The AI stores the file in Anki's media folder, then writes the `[sound:hola.mp3]` tag into the field.

<img src="chat-add-audio.png" width="740" alt="A chat where the user asks for a Spanish deck card with the audio file at /Users/anatoly/Downloads/hola.mp3 on the front and Hello on the back; Claude confirms it stored hola.mp3 and added the sound tag to the card." />

## Step 3: Open Anki and study

Open your deck in Anki and start a review. The card with audio shows a **play button**. Click it to hear the sound.

## Check it worked

Find the card in Anki's **Browse** window. The field should contain a sound tag like `[sound:hola.mp3]`, and the card preview should show a play button. If you hear the audio, it worked.

## Supported audio types

AnkiMCP accepts common audio files. **MP3** is the safest and most common choice, and it plays on every Anki platform. If you route audio through your Studio [media library](/docs/anki-studio/media-library/), it accepts MP3 and WAV.

The file path and URL methods only accept media files (audio, images, video). Other file types are blocked for safety.

## Fix common problems

**The AI says it added the audio, but the card didn't change.**
Updates fail silently if the note is open in Anki's Browse window. Close Anki's Browse window, or pick a different note, then ask the AI to try again.

**I don't hear anything when I click play.**
Make sure the file is a real audio file and the name in the `[sound:...]` tag matches the stored file exactly. In Anki, run **Tools → Check Media** to find missing files.

## Common questions

**Does AnkiMCP do text-to-speech?**
Yes, through [Anki Studio](/docs/anki-studio/text-to-speech/). Ask your AI for the audio, and Studio makes the mp3 and saves it in your media library. AnkiMCP then stores it in Anki and writes the sound tag. A separate TTS MCP server still works if you prefer one.

**Does Anki support audio flashcards?**
Yes. Anki plays audio with its `[sound:filename.mp3]` tag. AnkiMCP writes that tag for you, so you don't have to edit fields by hand.

## Next steps

- [Text to speech](/docs/anki-studio/text-to-speech/) — let Anki Studio generate the voice audio for you.
- [Add images to your cards](/docs/how-to/add-images-to-cards/) using the same media tools.
- [Write better prompts for Anki](/docs/how-to/anki-ai-prompts/) so the AI makes the cards you want.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
