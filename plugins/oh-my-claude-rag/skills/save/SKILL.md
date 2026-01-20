---
name: save
description: Save current work as a structured document to the RAG knowledge base. Use when the user wants to save, store, or document their work session for future reference.
---

# RAG Save

Save the current work session as a structured document to the vector database.

## Usage

```
/claude-code-rag:save
/claude-code-rag:save --type bugfix --tags "auth,session"
```

## Parameters

- `type`: Work type (bugfix, feature, refactor, analysis) - auto-detected if not provided
- `title`: Document title - auto-generated if not provided
- `tags`: Comma-separated tags for categorization
- `namespace`: Project namespace for organization

## Instructions

1. **Analyze the conversation** to understand what was accomplished
2. **Classify work type** if not provided:
   - `bugfix`: Bug fixes, error resolutions
   - `feature`: New functionality added
   - `refactor`: Code restructuring
   - `analysis`: Code exploration, architecture review

3. **Generate structured document** with:
   - Problem description
   - Solution implemented
   - Files modified
   - Key learnings

4. **Save to Pinecone** using upsert-records:
   ```
   Index: claude-code-rag
   Namespace: project name or provided
   Record fields:
   - id: namespace-timestamp-hash
   - content: Full document text
   - type, title, project, date, tags, files
   ```

5. **Confirm to user** with document title, type, tags, and record ID

## Auto-detection Hints

- "error", "bug", "fix" → `bugfix`
- "add", "implement", "new feature" → `feature`
- "refactor", "clean", "restructure" → `refactor`
- "how", "why", "explain" → `analysis`
