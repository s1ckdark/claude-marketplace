---
name: search
description: Search the RAG knowledge base for relevant past work and solutions. Use when the user wants to find, search, or look up previous work, solutions, or documentation.
---

# RAG Search

Search the vector database for relevant past work, solutions, and analyses.

## Usage

```
/claude-code-rag:search "session timeout handling"
/claude-code-rag:search "authentication" --type bugfix --limit 3
```

## Parameters

- `query` (required): Search query describing what you're looking for
- `limit`: Maximum number of results (default 5)
- `type`: Filter by work type (bugfix, feature, refactor, analysis)
- `namespace`: Search within specific project namespace
- `tags`: Filter by tags (comma-separated)

## Instructions

1. **Execute vector search** using Pinecone MCP search-records:
   - Index: claude-code-rag
   - Namespace: provided or search all
   - Query: user's search text
   - TopK: limit (default 5)
   - Rerank with pinecone-rerank-v0 for better relevance

2. **Apply filters** if provided:
   - Filter by `type` field
   - Filter by `tags` field
   - Namespace restricts to specific project

3. **Format results**:
   ```markdown
   ## Found {{count}} relevant documents

   ### 1. {{title}} ({{type}}, {{date}})
   **Tags**: {{tags}}
   **Files**: {{files}}

   **Summary**: {{first 200 chars of content}}
   ```

4. **Provide actionable insights**:
   - How past solutions might apply to current problem
   - Differences in context that might affect applicability
   - Which document to explore further

## Search Tips

- Use specific technical terms for precise results
- Include error messages or function names when searching for bugs
- Combine with type filter for focused results
