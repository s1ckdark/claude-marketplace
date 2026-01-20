---
name: rag-save
description: Save current work as a structured document to the RAG knowledge base
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

# RAG Save Command

Save the current work session as a structured document to the vector database.

## Instructions

1. **Analyze the current conversation** to understand:
   - What problem was being solved
   - What solution was implemented
   - What files were modified
   - Key learnings and insights

2. **Determine work type** (if not provided):
   - `bugfix`: Bug fixes, error resolutions
   - `feature`: New functionality added
   - `refactor`: Code restructuring without behavior change
   - `analysis`: Code exploration, architecture review

3. **Generate structured document** using the documenter agent:
   ```
   Use the documenter agent to create a structured markdown document
   based on the conversation context and work type.
   ```

4. **Extract metadata**:
   - Auto-detect tags from code patterns, file types, frameworks
   - List all modified files
   - Generate relevant keywords

5. **Save to vector database**:
   - Use Pinecone MCP `upsert-records` tool
   - Index: `claude-code-rag`
   - Namespace: Use provided namespace or project directory name
   - Record format:
     ```json
     {
       "id": "{{namespace}}-{{timestamp}}-{{hash}}",
       "content": "Full markdown document text",
       "type": "{{type}}",
       "title": "{{title}}",
       "project": "{{namespace}}",
       "date": "{{YYYY-MM-DD}}",
       "tags": "{{comma-separated-tags}}",
       "files": "{{comma-separated-files}}"
     }
     ```

6. **Confirm save** to user with:
   - Document title
   - Type and tags
   - Files referenced
   - Record ID for future reference

## Example Usage

```
/rag-save --type bugfix --tags "auth,session" --title "Session timeout fix"
```

## Auto-detection Hints

- If conversation mentions "error", "bug", "fix" → likely `bugfix`
- If conversation mentions "add", "implement", "new feature" → likely `feature`
- If conversation mentions "refactor", "clean", "restructure" → likely `refactor`
- If conversation asks "how", "why", "explain" → likely `analysis`
