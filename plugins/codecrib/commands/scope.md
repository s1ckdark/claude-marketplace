---
name: scope
description: Scope out the codebase (alias for /analyze)
arguments:
  - name: path
    description: Root path to analyze (default: current directory)
    required: false
    type: string
  - name: depth
    description: Maximum directory depth to traverse (default: 4)
    required: false
    type: number
  - name: top
    description: Number of top-priority directories for deep analysis (default: 20)
    required: false
    type: number
  - name: namespace
    description: Project namespace for RAG indexing
    required: false
    type: string
---

# /scope - Slang alias for /analyze

This is the street version of `/analyze`. Same functionality, different vibe.

**See `/analyze` for full documentation.**

Quick examples:
```bash
/scope                             # Analyze current project
/scope --depth 5 --top 30          # Deep dive
```
