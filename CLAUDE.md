# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo static site for documenting the Anki MCP Desktop project, hosted at `ankimcp.ai`. The site uses the Hextra theme via Hugo Modules and will be deployed to GitHub Pages (initially, later self-hosted).

**Important**: "Anki" is a registered trademark of Anki Universal. This is an independent community project NOT affiliated with Anki Universal. Always include trademark disclaimers when adding content.

## Technology Stack

- **Hugo** (extended version required) - Static site generator
- **Hextra theme** - Installed as Hugo Module (NOT git submodule)
- **Go** - Required for Hugo Modules functionality
- **GitHub Actions** - Automated deployment to GitHub Pages

## Development Commands

### Local Development
```bash
# Start development server with drafts
hugo server --buildDrafts

# Start development server (published content only)
hugo server

# Build site for production
hugo --minify

# Clean Hugo module cache (if issues)
hugo mod clean
```

### Module Management
```bash
# Update Hextra theme to latest version
hugo mod get -u github.com/imfing/hextra

# Tidy module dependencies
hugo mod tidy

# Initialize module (only needed once)
hugo mod init github.com/anki-mcp-organization/ankimcp.ai
```

### Content Creation
```bash
# Create new content page
hugo new content/docs/your-page.md

# Create new blog post
hugo new content/blog/your-post.md
```

## Architecture

### Module-Based Theme
This site uses **Hugo Modules** (not git submodules) to manage the Hextra theme. The theme is declared in `hugo.yaml` under `module.imports` and downloaded to Go's module cache on first build.

**Why Modules?**
- Cleaner dependency management
- Easy updates with `hugo mod get -u`
- Recommended by Hextra documentation
- Avoids git submodule complexity

### Configuration Strategy
Start with minimal `hugo.yaml` config and add features incrementally. Test after each addition. Hextra provides sensible defaults - only override what's necessary.

### Content Structure
```
content/
├── _index.md              # Homepage
├── docs/                  # Documentation section
│   ├── _index.md
│   ├── getting-started/
│   ├── tools-reference/
│   └── development/
└── blog/                  # Blog posts (optional)
    └── _index.md
```

## Deployment

### GitHub Pages
- Automated via GitHub Actions workflow (`.github/workflows/`)
- Builds on push to `main` branch
- Publishes to `gh-pages` branch
- Custom domain configured via DNS

### DNS (Porkbun)
- A records point to GitHub Pages IPs
- CNAME for www subdomain
- HTTPS enabled via GitHub Pages

## Content Guidelines

### Target Audience
- **Primary**: End-users (non-developers) wanting to install and use Anki MCP
- **Secondary**: Developers contributing to the project

### Writing Style
- Non-technical, beginner-friendly for getting started guides
- Link to GitHub for in-depth developer documentation
- Keep explanations simple and visual where possible

### Trademark Compliance
Always include disclaimers when referencing Anki:
- Footer: "Anki® is a registered trademark of Anki Universal. This is an independent community project not affiliated with Anki Universal."
- Prominent placement on homepage

## Common Issues

### Theme Styling Not Working
1. Verify Hugo extended version: `hugo version`
2. Check module is installed: `hugo mod graph`
3. Clear module cache: `hugo mod clean`
4. Rebuild: `hugo server`

### Module Not Found
```bash
hugo mod get github.com/imfing/hextra
hugo mod tidy
```

### Go Not Available
Hugo Modules requires Go installed. Install from https://go.dev/

## File Organization

- `/content/` - All markdown content (docs, blog posts, pages)
- `/static/` - Static assets (images, downloads, etc.)
- `/layouts/` - Custom layout overrides (only if needed)
- `/assets/` - Custom CSS/JS (only if needed)
- `hugo.yaml` - Main site configuration
- `.claude-draft/` - Planning documents (excluded from git)
- `go.mod`, `go.sum` - Hugo module dependencies (auto-generated)

## Testing Before Deployment

1. Run `hugo server --buildDrafts` locally
2. Verify all pages render correctly
3. Check mobile responsiveness
4. Test search functionality
5. Verify all links work
6. Build with `hugo --minify` to catch errors
