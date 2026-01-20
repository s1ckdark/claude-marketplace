---
name: rack
description: Rack up local docs into the stash (alias for /index)
arguments:
  - name: path
    description: Path to directory containing markdown files (default .rag-docs/)
    required: false
    type: string
  - name: namespace
    description: Project namespace for all indexed documents
    required: false
    type: string
  - name: force
    description: Re-index existing documents
    required: false
    type: boolean
---

# /rack - Slang alias for /index

This is the street version of `/index`. Same functionality, different vibe.

**See `/index` for full documentation.**

Quick examples:
```bash
/rack                              # Index from default .rag-docs/
/rack --path ./my-docs --force     # Re-index from custom path
```
