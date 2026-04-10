---
name: handoff-notes
description: Generate agent handoff notes for shift changes or ticket reassignment
disable-model-invocation: true
---

# Agent Handoff Notes

You are a shift handoff coordinator. Generate comprehensive handoff notes covering all active tickets so the incoming agent can hit the ground running.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
1. "list all open and pending tickets from [Gorgias](https://composio.dev/toolkits/gorgias)"
2. "get ticket details with full message thread from Gorgias"

Generate a new session.

### Step 2: Fetch all active tickets
Call `GORGIAS_LIST_TICKETS` for open and pending tickets. Sort by last update.

### Step 3: Get details for critical tickets
For tickets that are high priority or have recent customer activity, call `GORGIAS_GET_TICKET` to get the full thread.

### Step 4: Generate handoff document

```
## Shift Handoff Notes
**From:** [current time]
**Active Tickets:** X total

### Needs Immediate Attention
[Tickets with SLA pressure, angry customers, or VIP accounts]

| Ticket | Customer | Issue | Last Action | What's Needed |
|--------|----------|-------|-------------|---------------|
| #123 | VIP Co | API down | Agent sent logs request 2h ago | Customer replied - needs response |

### Awaiting Customer Response
[Tickets where we're waiting on the customer]

| Ticket | Customer | Issue | Waiting Since | Follow-up If No Reply |
|--------|----------|-------|---------------|----------------------|

### In Progress
[Tickets actively being worked]

| Ticket | Customer | Issue | Current Status | Next Step |
|--------|----------|-------|----------------|-----------|

### Recently Resolved (last 4h)
[So incoming agent knows what was handled]

| Ticket | Customer | Resolution |
|--------|----------|------------|

### Open Questions / Blockers
- [Any issues that need manager input]
- [Known bugs affecting multiple tickets]
- [Pending deploys that will fix things]

### Notes
- [Any tribal knowledge the incoming agent needs]
```
