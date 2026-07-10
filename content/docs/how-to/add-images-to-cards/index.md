---
title: "How to Add Images to Anki Cards (Manually or with AI)"
linkTitle: "Add images to cards"
description: "Two ways to add images to Anki cards: paste them into Anki's editor, or let AI build the picture flashcards for you from a link or a file."
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

**To add an image to an Anki card, paste it into a field in Anki's editor, or use the editor's attach button. With AI connected, you can skip that: tell the AI where the image is, and it builds the card for you.**

This guide shows both: the standard Anki way for one or two cards, and the AI way when you want picture flashcards built for you.

## The standard Anki way (no add-on needed)

For a single card, plain Anki already does this well:

1. In Anki, click **Add** (or open a card in **Browse**).
2. Click into the field where the image should go.
3. Paste the image (**Ctrl+V** / **Cmd+V**), or click the **paperclip icon** in the editor toolbar and pick the image file.
4. Save the card. Anki copies the image into your collection automatically, so it syncs to your other devices.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: Anki's note editor with an image pasted into a field and the paperclip icon highlighted in the toolbar</div>

That's it. The AI way below is worth it when you make cards while reading or need images on many cards at once.

## Adding images with AI

With the AI way, you don't paste pictures or edit HTML by hand. You tell the AI where the image is, in plain words. It downloads the image, adds it to Anki, and puts it on the card. The rest of this guide shows how.

## What you need

- **The AI already connected to Anki.** If you haven't done this yet, see [Connect Claude to Anki](/docs/how-to/connect-claude/).
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

On Windows, the path looks like `C:\Users\me\Desktop\cell-diagram.png` instead.

{{< callout type="info" >}}
**How to copy a file's full path.** On **macOS**: right-click the file, hold the **Option** key, and choose **Copy ... as Pathname**. On **Windows**: right-click the file and choose **Copy as path** (on Windows 10, hold **Shift** while right-clicking). Then paste it into your message.
{{< /callout >}}

The AI reads the file, adds it to Anki, and puts it on the card.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: a chat message asking the AI to add a local image to a card, with the AI confirming</div>

### One slow way to avoid

You can paste an image straight into the chat. Avoid this. The AI has to turn the picture into a huge block of text first, which is slow and can fail on large images. Instead, save the image to your computer, then use the file method above.

## Add an image to a card you already have

You can also add a picture to an existing card. Tell the AI which card and where the image is.

Example request:

> Find my card about mitochondria and add this diagram to the front: /Users/me/Downloads/mito.png

(On Windows: `C:\Users\me\Downloads\mito.png`.)

The AI finds the card and updates it with the image.

One thing to know: **close Anki's Browse window first.** If a card is open in Browse while the AI updates it, the change may not be saved, and you won't see an error. Switch to a different note or close Browse, then ask again.

## Check it worked

Open the deck in Anki and look at the card. The image should show on the front or back, wherever you asked for it.

If you sync to AnkiWeb, sync now so the picture reaches your other devices.

## Fix common problems

**The image didn't appear on my card.**
The card was likely open in Anki's Browse window during the update. Close Browse or switch to another note, then ask the AI to try again.

**The AI says it can't read my file.**
Give the full path, not just the file name. On a Mac it looks like `/Users/you/Desktop/image.png`; on Windows, `C:\Users\you\Desktop\image.png`. Only image, audio, and video files are allowed — other file types are blocked for safety.

**The web link didn't work.**
Make sure the link points straight to the image file (it usually ends in `.jpg` or `.png`), not to a web page that shows the image. Right-click the image and copy the image address.

<!-- VERIFY: which image file extensions (PNG, JPG, GIF, WebP, etc.) the file-path import accepts — README says "image MIME types" but does not list extensions -->

**The image looks too big or breaks the card.**
Resize or shrink the image before you add it, then ask the AI to add the smaller file.

## Next steps

- New here? Start with [Connect Claude to Anki](/docs/how-to/connect-claude/).
- Want better cards faster? See [Anki AI prompts](/docs/how-to/anki-ai-prompts/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects. MCP is an open standard originated by Anthropic; AnkiMCP is likewise not affiliated with or endorsed by Anthropic.*
