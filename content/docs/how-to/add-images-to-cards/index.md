---
title: "How to Add Images to Anki Cards with AI"
linkTitle: "Add images to cards"
description: "Add images to your Anki cards with AI. Give Claude a web link or a file on your computer, and it builds the picture flashcard for you."
keywords:
  - how to add image to anki card
  - add images to anki cards
  - anki image flashcards
  - anki picture flashcards
  - anki flashcards with images
weight: 7
sitemap_priority: 0.8
aliases:
  - /docs/image-flashcards/
---

**Ask the AI to add an image to your Anki card, and it does the work for you. Give it a web link or point it at a file on your computer.**

You don't paste pictures or edit HTML by hand. You tell the AI where the image is, in plain words. It downloads the image, adds it to Anki, and puts it on the card. This makes picture flashcards fast to build.

## What you need

- **The AI already connected to Anki.** If you haven't done this yet, see [Connect Claude to Anki](/docs/how-to/connect-claude-desktop/).
- **Anki open** on your computer.
- **An image**, either a web link or a file saved on your computer.

## Ways to give the AI an image

There are two fast ways to add an image. Both let the AI fetch the picture itself, so you skip slow uploads.

### By web link (URL)

Best for an image that's already online. Copy the link to the image, then paste it into your message.

Example request:

> Create a card in my Geography deck. Front: a photo of the Eiffel Tower from this link — https://example.com/eiffel.jpg. Back: "The Eiffel Tower, Paris."

The AI downloads the image and builds the card with the picture on the front.

### By file on your computer

Best for screenshots, photos, or downloads saved on your machine. Tell the AI the file's full path.

Example request:

> Add the image at /Users/me/Desktop/cell-diagram.png to the front of my Biology card about cell parts.

The AI reads the file, adds it to Anki, and puts it on the card.

<!-- screenshot: a chat message asking the AI to add a local image to a card, with the AI confirming -->

### One slow way to avoid

You can paste an image straight into the chat. Avoid this. The AI has to turn the picture into a huge block of text first, which is slow and can fail on large images. Instead, save the image to your computer, then use the file method above.

## Add an image to a card you already have

You can also add a picture to an existing card. Tell the AI which card and where the image is.

Example request:

> Find my card about mitochondria and add this diagram to the front: /Users/me/Downloads/mito.png

The AI finds the card and updates it with the image.

One thing to know: **close Anki's Browse window first.** If a card is open in Browse while the AI updates it, the change can silently fail. Switch to a different note or close Browse, then ask again.

## Check it worked

Open the deck in Anki and look at the card. The image should show on the front or back, wherever you asked for it.

If you sync to AnkiWeb, sync now so the picture reaches your other devices.

## Fix common problems

**The image didn't appear on my card.**
The card was likely open in Anki's Browse window during the update. Close Browse or switch to another note, then ask the AI to try again.

**The AI says it can't read my file.**
Give the full path, not just the file name. On a Mac it looks like `/Users/you/Desktop/image.png`. Only image, audio, and video files are allowed — other file types are blocked for safety.

**The web link didn't work.**
Make sure the link points straight to the image file (it usually ends in `.jpg` or `.png`), not to a web page that shows the image. Right-click the image and copy the image address.

<!-- VERIFY: which image file extensions (PNG, JPG, GIF, WebP, etc.) the file-path import accepts — README says "image MIME types" but does not list extensions -->

**The image looks too big or breaks the card.**
Resize or shrink the image before you add it, then ask the AI to add the smaller file.

## Next steps

- New here? Start with [Connect Claude to Anki](/docs/how-to/connect-claude-desktop/).
- Want better cards faster? See [Anki AI prompts](/docs/how-to/anki-ai-prompts/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
