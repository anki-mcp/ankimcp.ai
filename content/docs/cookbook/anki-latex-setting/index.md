---
title: "How to Enable LaTeX in Anki (Generate LaTeX Images Setting)"
linkTitle: "Enable LaTeX images"
description: "Enable LaTeX in Anki: check 'Generate LaTeX images' in Preferences → Review. Setup steps, when to use MathJax instead, and fixes for common errors."
keywords:
  - anki latex
  - generate latex images
  - anki latex setting
  - enable latex anki
  - anki latex review tab
  - anki mathjax vs latex
weight: 2
sitemap_priority: 0.7
---

**To enable LaTeX in Anki, open Preferences, click the Review tab, and check the "Generate LaTeX images" box.** The box is off by default. Anki turned it off in version 24.06 for security reasons, and it stays off in Anki 25.09.2.

{{< callout type="info" >}}
**Most users do not need this setting.** For math on your cards, use MathJax instead: write `\(...\)` for inline math or `\[...\]` for display math. MathJax is built into Anki (since version 2.1), works on all platforms including mobile, needs no setup, and has no security risk. Enable LaTeX images only when you need full LaTeX packages, such as `chemfig` for chemistry or `tikz` for diagrams.
{{< /callout >}}

## What you need

- **Anki 24.06 or newer.** This guide uses Anki 25.09.2. Older versions do not have the checkbox — they always generated LaTeX images.
- **A LaTeX distribution:** [MiKTeX](https://miktex.org/) for Windows, [MacTeX or BasicTeX](https://tug.org/mactex/) for macOS, or [TeX Live](https://tug.org/texlive/) for Linux.
- **dvipng** — it converts the rendered math into the image Anki shows on the card.
- **Optional: dvisvgm** — lets Anki create scalable SVG images instead of PNG.

## Turn on the setting

1. Open Anki.
2. Open Preferences. Windows/Linux: **Tools → Preferences**. macOS: **Anki → Preferences**.
3. Click the **Review** tab. The checkbox sits near review settings like "Next day starts at" and "Show remaining card count."
4. Check **Generate LaTeX images**.
5. Click **OK**.
6. If the setting doesn't seem to apply, restart Anki.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: Anki Preferences → Review tab with the "Generate LaTeX images" checkbox highlighted</div>

**Security note:** Anki's manual recommends leaving this off if you use shared decks or plan to import them. LaTeX code can read or write files anywhere on your computer, so a malicious deck author could reach your data. Enable the setting only if you write all your own LaTeX content or fully trust your deck sources.

## Check it worked

1. Create a card with this in a field: `[latex]\sum_{k=1}^{\infty}\frac{1}{k}[/latex]`
2. Preview the card. You should see the formula as a rendered image.

<div style="background:#fef08a;border:3px solid #dc2626;color:#b91c1c;font-weight:bold;padding:.75rem;margin:1rem 0;border-radius:.5rem;">🖼️ INSERT-IMAGE-HERE: an Anki card preview showing the sum formula rendered as an image</div>

## Why the setting is off by default

Anki added this checkbox in version 24.06 (June 2024). Before that, Anki generated LaTeX images automatically and tried to block dangerous commands. The block list could not catch everything, so the developers switched to an opt-in model: the box stays unchecked until you turn it on yourself.

The setting only affects the `[latex]...[/latex]` tags and their shortcuts `[$]...[/$]` and `[$$]...[/$$]`. MathJax (`\(...\)`) keeps working either way, because it renders math in the browser and never runs system commands.

## Can't find the setting?

**Your Anki is older than 24.06.** Those versions have no checkbox because LaTeX generation was always on. Update to Anki 25.09.2 or later.

**An add-on changed the Preferences screen.** Hold **Shift** while starting Anki to disable add-ons for that session, then check Preferences again.

**You only need standard math.** Skip the setting and use MathJax: `\(...\)` for inline math, `\[...\]` for display math. No install, no configuration.

**LaTeX is installed in a non-standard place.** The "Edit LaTeX build process" add-on (ID: `937148547`) lets you set custom paths to your LaTeX executables and change the build commands. It also supports other TeX engines like XeTeX or LuaTeX.

**You already have the images.** If another Anki install generated the LaTeX images before, copy them into your collection.media folder. They must keep Anki's naming pattern: `latex-[hash].png` or `latex-[hash].svg`. Anki shows them even with the setting off — this is how shared decks work: the author generates all images before sharing.

## Customize LaTeX for your note type

1. Go to **Tools → Manage Note Types**.
2. Select your note type and click **Options**.
3. Edit the **Header** and **Footer** fields. The Header holds the LaTeX preamble. The default loads `amsmath` and `amssymb` for math symbols. Add packages here — for example `chemfig` for chemistry, `tikz` for diagrams, or `musicography` for musical notation.
4. Optional: check **Create scalable images with dvisvgm** to get SVG images instead of PNG. SVGs stay sharp at any size and are usually smaller files. Note: AnkiDroid versions before 2.9 cannot show SVG.

## Fix common problems

**"Error executing latex. Have you installed latex and dvipng?"**
Anki cannot find your LaTeX install. Open a terminal and run `latex --version` and `dvipng --version` — both should print a version number. On Windows, run Anki as Administrator once so MiKTeX can fetch missing packages. On macOS, make sure `/Library/TeX/texbin` is in your PATH.

**Your code works in a TeX editor but fails in Anki.**
Check where the `[latex]` tags are. They must be inside the field content, not in the card template. `[latex]{{Front}}[/latex]` in a template does not work — put the tags in the field itself.

**Images don't update after you change the code.**
Delete the old images from your collection.media folder (they are named `latex-*.png` or `latex-*.svg`), then run **Tools → Check Media**. Anki regenerates all LaTeX images.

**Cloze deletions break your LaTeX.**
This happens when closing braces touch. Add a space before the closing bracket so `[/$]` and `}}` don't collide.

Avoid:

```text
{{c1::[$]\frac{1}{2}[/$]}}
```

Use instead (note the space before the closing bracket):

```text
{{c1::[$]\frac{1}{2} [/$]}}
```

## Next steps

- Browse more recipes in the [Cookbook](/docs/cookbook/).
- Put pictures on your cards: [How to Add Images to Anki Cards](/docs/how-to/add-images-to-cards/).
- AnkiMCP acting up? See [Troubleshooting](/docs/how-to/troubleshooting/).

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects.*
