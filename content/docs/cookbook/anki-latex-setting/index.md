---
title: "Anki's LaTeX Setting: Now in Preferences → Review"
linkTitle: "Enable LaTeX images"
description: "Anki 25.09.2 moved the 'Generate LaTeX images' setting to Preferences → Review. Find it, enable it safely, and know when to use MathJax instead."
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

**The "Generate LaTeX images" setting in Anki 25.09.2 is located in Preferences → Review tab.** This security checkbox, disabled by default since version 24.06, requires explicit user action before Anki will generate LaTeX images—a fundamental shift from older versions where LaTeX generation happened automatically.

## Exact location and access path

To find the setting in Anki 25.09.2:

**Windows/Linux:** Tools menu → Preferences → Review tab → "Generate LaTeX images" checkbox

**macOS:** Anki menu → Preferences → Review tab → "Generate LaTeX images" checkbox

The Preferences screen in version 25.09.2 organizes settings into five main tabs (Appearance, Review, Editing, Syncing, Backups). The LaTeX setting sits within the **Review tab** alongside scheduler options like "Next day starts at" and review behavior settings like "Show remaining card count."

<!-- screenshot: Anki Preferences → Review tab with the "Generate LaTeX images" checkbox highlighted -->

According to the GitHub commit notes (PR #3218, commit 06f7aa393), the setting was specifically "shifted to review settings" when implemented. This placement decision reflects that LaTeX generation primarily affects the review experience rather than the editing process, even though users typically encounter the need for it when creating cards.

## What changed in recent versions and why

Anki introduced this setting in **version 24.06 (June 2024)** as a critical security measure. Before this update, LaTeX image generation happened automatically with attempted command restrictions. The development team discovered these restrictions weren't comprehensive enough to prevent malicious code execution.

LaTeX code can contain commands that read or write files anywhere on your computer. A malicious shared deck author could theoretically include LaTeX code that accesses sensitive data. Rather than maintaining an incomplete blocklist of dangerous commands, Anki's developers implemented an opt-in model: **the setting is unchecked (disabled) by default**, and users must consciously enable it after understanding the risks.

This change affects only the traditional `[latex][/latex]` tags and their shortcuts `[$]...[/$]` and `[$$]...[/$$]`. MathJax rendering (using `\(` and `\)` delimiters) works without any settings changes since MathJax processes math in the browser without executing system commands.

## Step-by-step instructions for enabling LaTeX in Anki 25.09.2

**Prerequisites:** Before enabling the setting, ensure you have the required software installed:
- LaTeX distribution (MiKTeX for Windows, MacTeX/BasicTeX for macOS, texlive for Linux)
- dvipng package (handles PNG generation)
- Optional: dvisvgm package (enables scalable SVG images)

**Configuration process:**

1. Open Anki 25.09.2
2. Navigate to Preferences:
   - Windows/Linux: Click Tools → Preferences
   - macOS: Click Anki → Preferences
3. Click the **Review** tab (second tab from left)
4. Locate the "Generate LaTeX images" checkbox in the review section
5. Check the box to enable LaTeX generation
6. Click OK to save
7. Restart Anki to ensure the setting takes effect
8. Test with a simple expression: Create a card with `[latex]\sum_{k=1}^{\infty}\frac{1}{k}[/latex]`
9. Preview the card—if configured correctly, you'll see a rendered mathematical image

**Security consideration:** Anki's official manual strongly recommends **not enabling this option if you use shared decks** or plan to import them in the future, as you're potentially giving shared deck authors access to your computer. Enable it only if you exclusively create your own LaTeX content or completely trust your deck sources.

## Alternative approaches if the preference isn't visible

If you cannot find the "Generate LaTeX images" setting in your Preferences → Review tab, several scenarios might explain this:

**Running an older version:** Versions before 24.06 don't have this setting because LaTeX generation was always enabled. Update to Anki 25.09.2 or later to access modern security controls.

**Add-on conflicts:** Some add-ons modify the preferences interface. Try starting Anki while holding Shift (disables add-ons temporarily) to see if the setting appears.

**Use MathJax instead:** For most mathematical typesetting needs, MathJax provides an excellent alternative that requires no settings changes, works on all platforms including mobile, and has no security risks. Simply use `\(...\)` for inline math or `\[...\]` for display math instead of the `[latex]` tags. MathJax has been built into Anki since version 2.1 and handles standard mathematical notation comprehensively.

**Edit LaTeX build process add-on:** For advanced users needing custom LaTeX compilation pipelines, the "Edit LaTeX build process" add-on (ID: 937148547) allows specification of custom paths to LaTeX executables and modification of compilation parameters. This proves useful when LaTeX is installed in non-standard locations or when using alternative TeX engines like XeTeX or LuaTeX.

**Direct media folder approach:** If you have pre-generated LaTeX images (perhaps from an older Anki installation or shared deck), you can place them directly in your collection.media folder. Images must follow Anki's naming convention: `latex-[hash].png` or `latex-[hash].svg`. Anki will display these images even with LaTeX generation disabled, which is precisely how shared decks work—authors generate all images before sharing.

## Configuring note types for optimal LaTeX rendering

Beyond enabling the preference, you can customize LaTeX behavior through note type options:

1. Go to Tools → Manage Note Types
2. Select your note type
3. Click Options
4. You'll see configurable Header and Footer fields containing the LaTeX document preamble and closing

The **Header** defines packages and document setup. The default includes `amsmath` and `amssymb` for mathematical symbols, but you can add packages like `chemfig` for chemistry, `tikz` for diagrams, or `musicography` for musical notation.

The **"Create scalable images with dvisvgm"** checkbox, when enabled, generates SVG images instead of PNG. SVGs scale perfectly across different screen sizes and typically produce smaller file sizes. However, older mobile clients (AnkiDroid versions before 2.9) don't support SVG, so check your mobile app version before enabling this option.

## Troubleshooting common LaTeX generation issues

**"Error executing latex. Have you installed latex and dvipng?"** indicates missing or incorrectly configured LaTeX installation. Verify installation by opening a terminal/command prompt and running `latex --version` and `dvipng --version`. Both should return version information. On Windows, you may need to run Anki as Administrator once to allow MiKTeX to fetch packages automatically. On macOS, ensure `/Library/TeX/texbin` is in your PATH.

**LaTeX code works in TeX editors but fails in Anki** typically results from delimiter placement errors. LaTeX tags must appear **inside field content**, not in card templates. Using `[latex]{{Front}}[/latex]` in your template won't work; instead, the field content itself must contain `[latex]...[/latex]`.

**Images not updating after code changes** requires running Tools → Check Media. This forces Anki to regenerate all LaTeX images. Delete any problematic images from your collection.media folder (they follow the pattern `latex-*.png` or `latex-*.svg`) before running Check Media to ensure complete regeneration.

**Cloze deletion conflicts** occur when closing braces touch. Add a space before the closing bracket so `[/$]` and `}}` don't collide.

Avoid:

```text
{{c1::[$]\frac{1}{2}[/$]}}
```

Use instead (note the space before the closing bracket):

```text
{{c1::[$]\frac{1}{2} [/$]}}
```

## Conclusion

Anki 25.09.2 places the LaTeX image generation control squarely in user hands through the Preferences → Review → "Generate LaTeX images" checkbox. This security-first approach, introduced in mid-2024, protects users from potentially malicious code while maintaining full LaTeX functionality for those who need it. The setting's disabled-by-default status represents a philosophical shift: LaTeX generation is now an explicit choice rather than an automatic feature, reflecting modern software's emphasis on user security and informed consent. For most users, MathJax provides sufficient mathematical typesetting without requiring any configuration, while the LaTeX option remains available for specialized needs like chemical formulas, complex diagrams, or scenarios where pre-rendered images offer performance advantages.

---

*Disclaimer: "Anki" is a registered trademark of Ankitects Pty Ltd. AnkiMCP is an independent, community-built project and is **not** affiliated with, endorsed by, or sponsored by Ankitects.*
