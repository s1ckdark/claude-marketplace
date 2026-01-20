---
name: stash
description: Stash your work to the knowledge crib (alias for /save)
arguments:
  - name: type
    description: "Work type: bugfix, feature, refactor, analysis"
    required: false
    type: string
  - name: title
    description: Document title (auto-generated if not provided)
    required: false
    type: string
  - name: tags
    description: Comma-separated tags for categorization
    required: false
    type: string
  - name: namespace
    description: Project namespace for organization
    required: false
    type: string
---

# /stash - Slang alias for /save

This is the street version of `/save`. Same functionality, different vibe.

**See `/save` for full documentation.**

Quick examples:
```bash
/stash                           # Auto-detect everything
/stash --type bugfix --tags "auth"  # Specify details
```
