---
name: grab
description: Grab docs from your stash (alias for /search)
arguments:
  - name: query
    description: Search query describing what you're looking for
    required: true
    type: string
  - name: limit
    description: Maximum number of results (default 5)
    required: false
    type: number
  - name: type
    description: Filter by work type (bugfix, feature, refactor, analysis)
    required: false
    type: string
  - name: namespace
    description: Search within specific project namespace
    required: false
    type: string
  - name: tags
    description: Filter by tags (comma-separated)
    required: false
    type: string
---

# /grab - Slang alias for /search

This is the street version of `/search`. Same functionality, different vibe.

**See `/search` for full documentation.**

Quick examples:
```bash
/grab "auth timeout"               # Search the stash
/grab "error handling" --type bugfix --limit 3
```
