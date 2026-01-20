---
name: index
description: Bulk index local markdown documents to the RAG knowledge base. Use when the user wants to index, import, or bulk upload existing documentation.
---

# RAG Index

Bulk index local markdown documents into the vector database.

## Usage

```
/claude-code-rag:index
/claude-code-rag:index --path ./docs/knowledge
/claude-code-rag:index --namespace my-project --force
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
   - Index: claude-code-rag
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
