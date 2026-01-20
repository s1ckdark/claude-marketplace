---
name: list
description: List docs in your stash (alias for /check)
arguments:
  - name: namespace
    description: Only show docs from this namespace
    required: false
    type: string
  - name: type
    description: Filter by work type (bugfix, feature, refactor, analysis)
    required: false
    type: string
  - name: limit
    description: Max docs to show (default 20)
    required: false
    type: number
  - name: stats
    description: Show stats summary instead of listing docs
    required: false
    type: boolean
---

# /list - Alias for /check

The formal version of `/check`. Same functionality.

**See `/check` for full documentation.**

Quick examples:
```bash
/list --namespace my-project
/list --stats
```
