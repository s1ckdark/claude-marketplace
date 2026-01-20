---
name: check
description: Check what's in your stash (alias: /list)
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

# Check Command

See what you got in your knowledge stash.

## Instructions

### List Documents

```
/check --namespace my-project
```

1. Query Pinecone for all documents in namespace
2. Sort by date (newest first)
3. Display in clean format:

```markdown
## Your Stash (23 docs)

| Date | Type | Title | Tags |
|------|------|-------|------|
| 2024-01-19 | bugfix | Session timeout fix | auth, session |
| 2024-01-18 | feature | OAuth integration | auth, oauth |
| ... | ... | ... | ... |
```

### Show Stats

```
/check --stats
```

Display summary:

```markdown
## Stash Stats

**Total Docs**: 147

**By Type**:
- bugfix: 45 (31%)
- feature: 62 (42%)
- refactor: 23 (16%)
- analysis: 17 (12%)

**By Namespace**:
- main-project: 89
- side-project: 35
- experiments: 23

**Recent Activity**:
- Last 7 days: 12 docs
- Last 30 days: 34 docs
```

## Example Usage

```bash
# See all your docs
/check

# Filter by project
/check --namespace my-project

# Only bugfixes
/check --type bugfix --limit 10

# Get the stats
/check --stats

# Formal version
/list --namespace work-stuff
```
