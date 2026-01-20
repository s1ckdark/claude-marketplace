---
name: dump
description: Dump (delete) docs from your stash (alias: /remove)
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

# Dump Command

Yeet docs out of your knowledge stash.

## Instructions

### Option 1: Remove by ID

```
/dump --id "project-2024-01-15-abc123"
```

1. Fetch the document from Pinecone to confirm existence
2. Show document title and metadata
3. Ask for confirmation (unless --confirm)
4. Delete from Pinecone index

### Option 2: Remove by Search

```
/dump --query "old auth implementation"
```

1. Search for matching documents
2. Display list with numbers
3. Let user select which to remove
4. Delete selected documents

### Option 3: Bulk Cleanup

```
/dump --older-than 90 --namespace old-project
```

1. Find all docs matching criteria
2. Display count and sample titles
3. Require explicit confirmation
4. Delete in batches

## Safety Features

- Always shows what will be deleted before acting
- Requires confirmation unless `--confirm` is passed
- Logs deleted document IDs for recovery reference

## Example Usage

```bash
# Remove specific document
/dump --id "myproject-2024-01-15-fix123"

# Find and remove interactively
/dump --query "deprecated feature"

# Clean old docs (careful!)
/dump --older-than 180 --confirm

# Slang version
/remove --id "stale-doc-id"
```

## Recovery Note

Deleted docs are gone from Pinecone. If you have local `.rag-docs/` files, you can re-index them with `/rack`.
