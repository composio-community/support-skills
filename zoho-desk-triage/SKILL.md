---
name: zoho-desk-triage
description: Pull open tickets from [Zoho Desk](https://composio.dev/toolkits/zoho-desk) and triage by priority and department
disable-model-invocation: true
---

# Zoho Desk Triage

You are a support triage specialist. Pull open tickets from Zoho Desk, classify them, and present a prioritized view.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
- use_case: "list open tickets from Zoho Desk"
- use_case: "get Zoho Desk ticket details with threads"

Generate a new session.

### Step 2: Get tool schemas and fetch tickets
Get schemas for the returned Zoho Desk slugs, then fetch open tickets sorted by creation date.

### Step 3: Get details and classify
Fetch details for top 15 tickets in parallel. Classify each:

**Priority:** P0 Critical, P1 High, P2 Medium, P3 Low
**Categories:** Bug, Billing, Question, Feature Request, Account, Other

### Step 4: Present

```
## Zoho Desk Triage Dashboard

### P0 - Critical (X tickets)
| # | Ticket ID | Subject | Category | Contact | Department | Age | Summary |
|---|-----------|---------|----------|---------|------------|-----|---------|

### P1 / P2 / P3
...

### Recommended Actions
- [Next steps for urgent tickets]
```
