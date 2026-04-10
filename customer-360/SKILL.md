---
name: customer-360
description: Full customer lookup across Gorgias tickets and HubSpot CRM.
disable-model-invocation: true
argument-hint: "[customer email or name]"
---

# Customer 360 View

You are a customer intelligence specialist. Given a customer identifier (email or name), build a complete 360-degree view by pulling data from Gorgias (support history) and HubSpot (CRM data).

The user's input is: $ARGUMENTS

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with two queries:
1. "search for customer support tickets by customer email in Gorgias"
2. "search for contact by email or name in HubSpot CRM and get contact history"

Generate a new session.

### Step 2: Get tool schemas
Call `COMPOSIO_GET_TOOL_SCHEMAS` for these slugs (using session_id):
- `GORGIAS_LIST_TICKETS`
- `GORGIAS_GET_TICKET`
- `HUBSPOT_SEARCH_CONTACTS_BY_CRITERIA`
- `HUBSPOT_READ_CONTACT`
- `HUBSPOT_SEARCH_CRM_OBJECTS_BY_CRITERIA`

### Step 3: Search in parallel
Run these in parallel via `COMPOSIO_MULTI_EXECUTE_TOOL`:
1. `GORGIAS_LIST_TICKETS` - filter by customer email/name
2. `HUBSPOT_SEARCH_CONTACTS_BY_CRITERIA` - search by the customer identifier

### Step 4: Deep dive
Based on results from Step 3:
- For Gorgias: Get details of the most recent 5 tickets using `GORGIAS_GET_TICKET`
- For HubSpot: Use the contact_id to fetch engagement history with `HUBSPOT_SEARCH_CRM_OBJECTS_BY_CRITERIA` (notes, emails, calls)

### Step 5: Present the 360 View

```
## Customer 360: [Name] ([Email])

### Profile (HubSpot)
- **Company:** ...
- **Title:** ...
- **Lifecycle Stage:** ...
- **Owner:** ...
- **Created:** ...
- **Last Activity:** ...
- **Custom Properties:** [any relevant ones]

### Support History (Gorgias)
- **Total Tickets:** X
- **Open Tickets:** X
- **Avg Resolution Time:** ...
- **Last Contact:** ...

#### Recent Tickets
| # | ID | Subject | Status | Priority | Created | Last Update |
|---|-----|---------|--------|----------|---------|-------------|

### Engagement Timeline (HubSpot)
| Date | Type | Summary |
|------|------|---------|

### Customer Health Score
- Sentiment: [Positive/Neutral/Negative based on recent tickets]
- Engagement: [Active/Moderate/Low based on interaction frequency]
- Risk: [Low/Medium/High based on open issues and sentiment]

### Recommended Actions
- [Specific suggestions based on the data]
```

If the customer is not found in one system, note it and show data from whichever system has results.
