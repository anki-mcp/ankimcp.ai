# justfile — command runner for the ankimcp.ai Hugo site.
# Run `just` (no args) to list all recipes. Requires `just` (brew install just).

# Default: list available recipes
default:
    @just --list

# Kill any stale hugo processes (avoids zombie servers / port conflicts)
kill:
    -killall hugo

# Dev server: drafts on, fast render off (kills stale hugo first)
dev: kill
    hugo server --buildDrafts --disableFastRender

# Prod-preview server: minified, production environment (kills stale hugo first)
prod: kill
    hugo server --minify --buildDrafts --disableFastRender --environment production

# One-shot production build — the CLAUDE.md verification gate
build:
    hugo --minify

# Hugo Modules: update the Hextra theme and tidy dependencies
update:
    hugo mod get -u github.com/imfing/hextra
    hugo mod tidy

# Hugo Modules: clear the module cache
clean:
    hugo mod clean
