# codecrib

> Your knowledge stash for Claude Code - Stash work, grab past solutions, rack up your codebase docs

[![Plugin](https://img.shields.io/badge/Claude_Code-Plugin-blue.svg)](https://github.com/s1ckdark/claude-crib)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## Installation

```bash
# Add marketplace
/plugin marketplace add s1ckdark/claude-crib

# Install plugin
/plugin install codecrib@claude-crib --scope project
```

## Setup

### Vector DB Options

| Option | Pros | Setup |
|--------|------|-------|
| **Pinecone** (default) | Zero maintenance, scalable | `PINECONE_API_KEY` env var |
| **Chroma** (local) | Free, privacy | Docker required |
| **MongoDB Atlas** | Familiar, rich queries | `MONGODB_URI` env var |

### Pinecone Setup (Recommended)

Claude Code has Pinecone MCP built-in.

1. Get API key from [Pinecone](https://pinecone.io)
2. Add to `~/.claude/settings.json`:
   ```json
   {
     "env": {
       "PINECONE_API_KEY": "your-api-key"
     }
   }
   ```
3. Create index: `/pinecone quickstart` or via console

## Commands

All commands have both **normal** and **slang** versions:

| Normal | Slang | Description |
|--------|-------|-------------|
| `/save` | `/stash` | Stash your work to the knowledge crib |
| `/search` | `/grab` | Grab docs from your stash |
| `/index` | `/rack` | Rack up local docs into the stash |
| `/analyze` | `/scope` | Scope out the codebase |
| `/remove` | `/dump` | Dump docs from your stash |
| `/list` | `/check` | Check what's in your stash |

### `/save` or `/stash` - Stash Your Work

```bash
/stash --type bugfix --tags "auth,session" --title "Session timeout fix"
/save   # auto-detect everything
```

**Args:**
- `--type`: Work type (bugfix, feature, refactor, analysis)
- `--title`: Document title (auto-generated if omitted)
- `--tags`: Tags (comma-separated)
- `--namespace`: Project namespace

### `/search` or `/grab` - Grab Past Solutions

```bash
/grab "session timeout error"
/search "authentication" --type bugfix --limit 3
```

### `/index` or `/rack` - Bulk Index Docs

```bash
/rack
/index --path ./docs/knowledge --namespace my-project
```

### `/analyze` or `/scope` - Scope the Codebase

```bash
/scope
/analyze --depth 5 --top 30
```

### `/check` or `/list` - See Your Stash

```bash
/check --namespace my-project
/list --stats
```

### `/dump` or `/remove` - Clean Up

```bash
/dump --id "doc-id-123"
/remove --older-than 90 --confirm
```

## Project Structure

```
claude-crib/
├── plugins/
│   └── codecrib/
│       ├── .claude-plugin/
│       │   └── plugin.json
│       ├── commands/           # Slash commands (normal + slang)
│       │   ├── save.md / stash.md
│       │   ├── search.md / grab.md
│       │   ├── index.md / rack.md
│       │   ├── analyze.md / scope.md
│       │   ├── remove.md / dump.md
│       │   └── list.md / check.md
│       ├── agents/
│       │   ├── documenter.md
│       │   └── codebase-analyzer.md
│       ├── skills/
│       │   ├── save/, search/, index/, analyze/
│       ├── hooks/
│       │   └── auto-document.md
│       └── templates/
│           ├── bugfix.md, feature.md
│           ├── refactor.md, analysis.md
└── README.md
```

## Token Savings

| Scenario | Before | After |
|----------|--------|-------|
| Same bug recurs | Full code re-analysis | Instant grab from stash |
| Architecture Q | Explore from scratch | Reuse saved analysis |
| Repeated patterns | Write from scratch | Use templates |

## License

MIT
