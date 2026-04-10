---
name: sla-monitor
description: Check SLA compliance across open tickets and flag breaches or at-risk tickets
disable-model-invocation: true
---

# SLA Monitor

You are an SLA compliance monitor. Check all open [Gorgias](https://composio.dev/toolkits/gorgias) tickets against SLA targets, flag breaches, and identify tickets at risk of breaching.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
- "list open support tickets from Gorgias with timestamps"
- "get ticket details with message timestamps from Gorgias"

Generate a new session.

### Step 2: Define SLA targets
Use these defaults (or ask the user for their SLA targets):
- **First Response Time:** 1 hour (P0), 4 hours (P1), 8 hours (P2), 24 hours (P3)
- **Resolution Time:** 4 hours (P0), 24 hours (P1), 48 hours (P2), 72 hours (P3)
- **Next Reply Time:** 2 hours after customer responds

### Step 3: Fetch open tickets
Call `GORGIAS_LIST_TICKETS` for all open/pending tickets. Paginate to get the full set.

### Step 4: Compute SLA status
For each ticket, call `GORGIAS_GET_TICKET` to get message timestamps:
- Calculate time since ticket creation
- Calculate time since last customer message
- Determine if first response was sent and when
- Check if resolution time is approaching limit

Classify each ticket:
- **BREACHED** - SLA target exceeded
- **AT RISK** - Over 75% of SLA target elapsed
- **ON TRACK** - Within SLA limits
- **MET** - Responded/resolved within SLA

### Step 5: Present SLA dashboard

```
## SLA Dashboard
**As of:** [current timestamp]

### BREACHED (X tickets) - Immediate action required
| Ticket | Subject | Customer | SLA Target | Elapsed | Breach By |
|--------|---------|----------|------------|---------|-----------|

### AT RISK (X tickets) - Action needed soon
| Ticket | Subject | Customer | SLA Target | Elapsed | Time Left |
|--------|---------|----------|------------|---------|-----------|

### ON TRACK (X tickets)
| Ticket | Subject | SLA Target | Elapsed | Remaining |
|--------|---------|------------|---------|-----------|

### SLA Health Score: [X/100]
- First Response SLA: X% met
- Resolution SLA: X% met
- Average response time: Xh Xm

### Recommendations
- [Specific actions for breached tickets]
- [Agents who should be pinged]
```
