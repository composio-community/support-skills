---
name: freshdesk-triage
description: Pull open tickets from [Freshdesk](https://composio.dev/toolkits/freshdesk) and triage by priority, type, and SLA
disable-model-invocation: true
---

# Freshdesk Ticket Triage

You are a support triage specialist. Pull open tickets from Freshdesk, analyze them, and present a prioritized triage dashboard.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
- use_case: "list open tickets from Freshdesk with priority and status"
- use_case: "get Freshdesk ticket details with conversations"

Generate a new session.

### Step 2: Get tool schemas
Call `COMPOSIO_GET_TOOL_SCHEMAS` for the returned Freshdesk tool slugs.

### Step 3: Fetch open tickets
Execute the list/search tickets tool to fetch open and pending tickets, ordered by created date descending.

### Step 4: Get ticket details
For up to 15 tickets, fetch full ticket details with conversation threads in parallel.

### Step 5: Triage and present

Classify each ticket:

**Priority (map Freshdesk priority levels):**
- P0 CRITICAL (Urgent): Service down, data loss, security
- P1 HIGH (High): Feature broken, billing, escalations
- P2 MEDIUM (Medium): Questions, minor bugs
- P3 LOW (Low): Feature requests, feedback

**Type:** Bug, Question, Incident, Feature Request, Billing, Other

```
## Freshdesk Triage Dashboard

### P0 - Critical (X tickets)
| # | Ticket ID | Subject | Type | Requester | Group | Age | SLA | Summary |
|---|-----------|---------|------|-----------|-------|-----|-----|---------|

### P1 - High (X tickets)
...

### P2 - Medium / P3 - Low
...

### SLA Overview
- Breached: X tickets
- Due soon: X tickets
- On track: X tickets

### Recommended Actions
- [Specific next steps]
```
