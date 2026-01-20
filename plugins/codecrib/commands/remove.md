---
name: remove
description: Remove docs from your stash (alias for /dump)
arguments:
  - name: id
    description: Document ID to remove
    required: false
    type: string
  - name: query
    description: Search query to find docs to remove (interactive selection)
    required: false
    type: string
  - name: namespace
    description: Only remove from this namespace
    required: false
    type: string
  - name: older-than
    description: Remove docs older than X days
    required: false
    type: number
  - name: confirm
    description: Skip confirmation prompt
    required: false
    type: boolean
---

# /remove - Alias for /dump

The formal version of `/dump`. Same functionality.

**See `/dump` for full documentation.**

Quick examples:
```bash
/remove --id "doc-id-123"
/remove --query "old stuff" --namespace legacy
```
