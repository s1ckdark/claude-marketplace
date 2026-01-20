---
name: index
description: Rack up local docs into the knowledge stash. Use when the user wants to index, rack, import, or bulk upload existing documentation. Alias: /rack
---

# Index / Rack

Rack up your local docs into the vector database.

## Usage

```
/index                   # or /rack
/rack --path ./docs/knowledge
/index --namespace my-project --force
```

## Parameters

- `path`: Path to directory containing markdown files (default .rag-docs/)
- `namespace`: Project namespace for all indexed documents
- `force`: Re-index existing documents

## Instructions

1. **Locate documents**:
   - Default path: `.rag-docs/` in current project
   - Scan for all `.md` files recursively
   - Report total files found

2. **Parse each document**:
   - Extract YAML frontmatter for metadata
   - Expected frontmatter:
     ```yaml
     ---
     type: bugfix | feature | refactor | analysis
     date: YYYY-MM-DD
     tags: [tag1, tag2]
     files: [file1.ts, file2.ts]
     title: Document Title
     ---
     ```

3. **Generate record IDs**: `namespace-date-filename-hash`

4. **Batch upsert to Pinecone**:
   - Process in batches of 10-20 documents
   - Index: codecrib
   - Namespace: provided or derived from project

5. **Report progress**:
   ```
   Indexing: 15/45 documents...
   Complete: 40 indexed, 5 skipped
   ```

## Directory Structure Expected

```
.rag-docs/
├── 2024-01-15-session-timeout-fix.md
├── 2024-01-16-user-auth-feature.md
└── archived/
    └── older-document.md
```
