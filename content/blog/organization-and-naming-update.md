---
title: "Important Update: New Organization and Package Names"
date: 2025-11-10
author: "Anatoly"
author_link: "https://anatoly.dev"
description: "Anki MCP is moving to a new GitHub organization and npm package name that better reflects the project's scope and future direction."
keywords: ["anki mcp update", "naming change", "ankimcp organization", "package migration"]
sitemap_priority: 0.6
---

We're making an important organizational change to better reflect the project's scope and future direction. Anki MCP is moving to a new GitHub organization and npm package name.

## What's Changing

### GitHub Organization & Repository
- **Old**: `github.com/anki-mcp/anki-mcp-desktop`
- **New**: `github.com/ankimcp/anki-mcp-server`

### NPM Package
- **Old**: `anki-mcp-http` (deprecated, maintained for backward compatibility)
- **New**: `@ankimcp/anki-mcp-server`

### Why the Change?

The original naming was chosen early in the project when the scope was narrower. As the project evolved to support multiple modes (Desktop, STDIO, and Web), the names no longer accurately reflected what Anki MCP had become:

1. **"anki-mcp" organization** → **"ankimcp"** - Cleaner, more memorable, and matches our domain (ankimcp.ai)

2. **"anki-mcp-desktop" repository** → **"anki-mcp-server"** - The project is an MCP server that works across different environments, not just desktop

3. **"anki-mcp-http" package** → **"@ankimcp/anki-mcp-server"** - The package does more than HTTP (supports STDIO too), and the scoped name is more professional and avoids npm namespace conflicts

## What You Need to Do

### For Claude Desktop Users (.mcpb file)

**Nothing!** Your existing installation will continue to work. When you're ready to update:

1. Download the latest release from the [new GitHub repository](https://github.com/ankimcp/anki-mcp-server/releases/latest)
2. Drag and drop the `.mcpb` file into Claude Desktop
3. The extension will be replaced automatically

### For STDIO Users (Cursor, Cline, etc.)

Update your MCP configuration file to use the new package name:

**Old configuration:**
```json
{
  "mcpServers": {
    "anki-mcp": {
      "command": "npx",
      "args": ["-y", "anki-mcp-http", "--stdio"]
    }
  }
}
```

**New configuration:**
```json
{
  "mcpServers": {
    "anki-mcp": {
      "command": "npx",
      "args": ["-y", "@ankimcp/anki-mcp-server", "--stdio"]
    }
  }
}
```

Then restart your MCP client.

### For Web Mode Users (ChatGPT, Claude.ai)

Update your command to use the new package name:

**Old:**
```bash
npx anki-mcp-http --ngrok
```

**New:**
```bash
npx @ankimcp/anki-mcp-server --ngrok
```

## Backward Compatibility

We understand changes like this can be disruptive, so we're maintaining backward compatibility:

- **The old npm package will remain available** for a transition period
- Your existing installations will continue to work
- All GitHub issues, discussions, and stars have been preserved
- Historical documentation and blog posts have been updated to reflect the new naming

We'll monitor downloads of the old package and remove it only when usage has dropped to near zero, ensuring everyone has time to migrate.

## Updated Links

All project resources now use the new naming:

- **GitHub Repository**: [github.com/ankimcp/anki-mcp-server](https://github.com/ankimcp/anki-mcp-server)
- **NPM Package**: [@ankimcp/anki-mcp-server](https://www.npmjs.com/package/@ankimcp/anki-mcp-server)
- **Community Forum**: [forum.ankimcp.ai](https://forum.ankimcp.ai/)
- **Issues**: [github.com/ankimcp/anki-mcp-server/issues](https://github.com/ankimcp/anki-mcp-server/issues)

## Questions?

If you have any questions or encounter issues with the migration:

- [Community Forum](https://forum.ankimcp.ai/) - Ask questions and share tips
- [Email Support](mailto:support@ankimcp.ai) - Direct support

These changes are part of the ongoing effort to maintain a well-organized project.

---

{{< newsletter >}}
