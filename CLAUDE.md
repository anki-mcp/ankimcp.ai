# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Hugo static site for documenting the Anki MCP Desktop project, hosted at `ankimcp.ai`. The actual MCP server code lives at https://github.com/ankimcp/anki-mcp-server.

**Important**: "Anki" is a registered trademark of Ankitects Pty Ltd. This is an independent community project NOT affiliated with Ankitects. Always include trademark disclaimers when adding content.

### Content Sections
Top-level sections under `content/`:
- `docs/` — Product documentation (installation, features, FAQ, known issues)
- `blog/` — Release announcements and articles
- `about/`, `privacy/`, `terms/` — Static pages (legal pages include SaaS cloud + Discourse community terms)

### No Test Suite
This is a pure content repo. There is no test runner, no linter config, no CI verification beyond a successful Hugo build. Verification = `hugo --minify` succeeding + manual browser check via `hugo server`.

## Technology Stack

- **Hugo** v0.151.0 extended (production) - Static site generator
- **Hextra theme** v0.12.1 - Installed as Hugo Module (NOT git submodule)
- **Go** - Required for Hugo Modules. CI uses 1.21; `go.mod` declares 1.24.4 (local dev)
- **GitHub Actions** - Deploys to GitHub Pages on push to `main` (`.github/workflows/hugo.yml`). The workflow's `submodules: recursive` checkout option is vestigial — the theme is a Hugo Module, not a submodule — but it's harmless.
- **Umami Analytics** - Self-hosted at analytics.anatoly.dev
- **MailerLite** - Newsletter integration (Form ID: `ZGJ6BF`, account: `1854759`)

## Development Commands

```bash
# Local development
hugo server --buildDrafts     # Include draft content
hugo server                   # Published content only
hugo --minify                 # Build for production

# Module management
hugo mod get -u github.com/imfing/hextra  # Update theme
hugo mod tidy                              # Clean dependencies
hugo mod clean                             # Clear cache if issues

# Content creation
hugo new content/docs/your-page.md        # New docs page
hugo new content/blog/your-post.md        # New blog post
```

## Architecture Notes

### Hextra Theme CSS Convention
The Hextra theme uses `hx:` prefixed Tailwind utility classes (e.g., `hx:mt-6`, `hx:dark:text-gray-100`). All custom layouts use this prefix. Custom CSS overrides live in `assets/css/custom.css` and use `!important` to override theme defaults.

### MailerLite Form ID Coupling
The form ID `ZGJ6BF` appears in **three places** that must stay in sync:
- `content/_index.md` — hero button `onclick="ml('show', 'ZGJ6BF', true)"`
- `layouts/partials/footer.html` — footer newsletter link
- `layouts/shortcodes/newsletter.html` — embedded form shortcode

The MailerLite universal script is loaded in `layouts/partials/custom/head-end.html`.

### Trademark Disclaimer
The Anki trademark text lives in `i18n/en.yaml` as the `copyright` key (used by the footer). It's NOT in any layout file directly.

### Custom Sitemap
`layouts/_default/sitemap.xml` overrides Hugo's default sitemap with:
- Per-section priority: homepage=1.0, docs sections=0.8, docs pages=0.7, blog=0.6, other=0.5
- Frontmatter overrides: `sitemap_priority`, `sitemap_changefreq`, `sitemap_exclude`

### Reference Directories (gitignored)
- `SEO/` — Keyword strategy, competitor analysis, schema markup docs (reference only)
- `.claude-draft/` — Planning docs, deployment guides, TODOs

## Critical Configuration

### ⚠️ JS Minification MUST Stay Disabled
- `minify.disableJS: true` in hugo.yaml is **REQUIRED**
- JS minification breaks MailerLite newsletter popup
- Never enable under any circumstances

### Banner System
- Uses key-based dismissal (`params.banner.key` in hugo.yaml)
- Stores dismissal state in localStorage
- **Always change key** when updating message (current key is `naming-update-2025`; use any unique slug, e.g. `release-v0.7.0` or `naming-update-2026`)
- This forces banner to reappear for users who dismissed previous version

### Custom Layouts
Key overrides in `/layouts/`:
- `partials/custom/head-end.html` — Canonical URLs, MailerLite script, Schema.org structured data (SoftwareApplication, WebSite, BlogPosting, Organization), preconnect hints
- `blog/single.html` — Custom blog layout with breadcrumb, author attribution, tags (E-E-A-T SEO)
- `partials/footer.html` — Adds Newsletter/Email/Community Forum links; keeps Hextra's `displayPoweredBy`/copyright logic (driven by `params.footer` in hugo.yaml)
- `shortcodes/newsletter.html` — Inline newsletter embed
- `_default/sitemap.xml` — Custom sitemap with per-section priorities

## Release Process

When announcing new versions:
1. Create blog post: `content/blog/vX.Y.Z-feature-name-release.md`
2. Update banner in `hugo.yaml`:
   - Change `params.banner.key` to new version
   - Update message and links
3. **Update Schema.org** in `layouts/partials/custom/head-end.html`:
   - Update `softwareVersion` field
   - Update `releaseNotes` URL to new blog post

## Content Standards

### Frontmatter Requirements
Required:
- `title` - Page title
- `description` - Meta description (150-160 chars ideal)

Recommended:
- `keywords` - SEO keywords array
- `sitemap_priority` - 0.0-1.0 (Homepage: 1.0, Important docs: 0.8, Blog: 0.6)
- `weight` - Navigation order (lower = first)

Blog-specific:
- `author` - Defaults to "Anatoly"
- `author_link` - Defaults to https://anatoly.dev
- `date` - Publication date

### Writing Guidelines
- **Primary audience**: Non-technical end users
- Keep explanations simple and visual
- Link to GitHub for developer documentation
- Include Anki trademark disclaimer on homepage and footer

## Verification

Repo-specific checks that can't be caught by the build alone:
1. `hugo --minify` — catches template/module errors. Must pass.
2. MailerLite popup — click the footer "Newsletter" link or hero CTA; the `ZGJ6BF` form should open. If it silently fails, check that `minify.disableJS` is still `true` in `hugo.yaml` (see Critical Configuration).
3. Structured data — after changing `layouts/partials/custom/head-end.html`, paste a built page URL into [Google's Rich Results Test](https://search.google.com/test/rich-results).
4. Banner dismissal — after bumping `params.banner.key`, clear localStorage (or use incognito) to confirm the banner reappears.

## Troubleshooting

### Port Already in Use
```bash
killall hugo               # Kill existing processes
hugo server -p 1314        # Or use different port
```

### Module Issues
```bash
hugo mod clean             # Clear cache
hugo mod tidy             # Clean dependencies
hugo mod get -u           # Re-fetch modules
```

### Theme Not Working
1. Verify Hugo extended: `hugo version`
2. Check module: `hugo mod graph`
3. Clear and rebuild: `hugo mod clean && hugo server`