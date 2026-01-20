# claude-crib 🏠

> **Where Claude Code comes to crash.**
>
> A curated collection of plugins, skills, and workflows that make Claude Code feel like home.

---

## What's This?

Your personal plugin crib for [Claude Code](https://claude.ai/claude-code).

Think of it as your toolbox, your cheat codes, your secret sauce — all the stuff that turns Claude from "helpful assistant" into "coding partner who actually gets it."

## The Lineup

### 📦 [codecrib](./plugins/codecrib/)
> *Your knowledge stash for Claude Code*

RAG-powered memory that never forgets. Stash your wins, grab past solutions, never solve the same bug twice.

```bash
/stash --type bugfix --title "That auth bug that took 3 hours"
/grab "session timeout"  # boom, instant recall
```

**Features:**
- 💾 Save work context to vector DB (Pinecone built-in)
- 🔍 Semantic search through your history
- 📊 Auto-analyze codebases
- 🏷️ Tag, organize, never lose track

---

## Quick Start

```bash
# Add the crib
/plugin marketplace add s1ckdark/claude-crib

# Install what you need
/plugin install codecrib@claude-crib --scope project
```

## Philosophy

**Less searching. More shipping.**

Every plugin here exists because we got tired of:
- Re-explaining the same context
- Losing that perfect solution from 3 months ago
- Starting from scratch every session

This is the fix.

---

## Coming Soon

- **claude-snippets** — Code templates that actually match your style
- **claude-flows** — Workflow automation for repetitive tasks
- **claude-collab** — Team knowledge sharing

---

## Contributing

Got a plugin idea? A workflow that changed your life?

PRs welcome. Keep it useful, keep it vibes.

## License

MIT — Do whatever. Credit appreciated but not required.

---

<p align="center">
  <i>Built with Claude, for Claude users.</i><br>
  <i>Claude로 만들고, Claude 유저를 위해.</i>
</p>
