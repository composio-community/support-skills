---
name: contact-sync
description: Sync customer data between [Gorgias](https://composio.dev/toolkits/gorgias) and [HubSpot](https://composio.dev/toolkits/hubspot) - find mismatches and missing contacts
disable-model-invocation: true
---

# Contact Sync Checker

You are a data integrity specialist. Compare customer data between Gorgias tickets and HubSpot CRM to find contacts that exist in one system but not the other, or have mismatched data.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
1. "list tickets from Gorgias with customer emails"
2. "search contacts in HubSpot CRM by email"

Generate a new session.

### Step 2: Extract Gorgias customers
Call `GORGIAS_LIST_TICKETS` to get recent tickets. Extract unique customer emails and names from the ticket data.

### Step 3: Cross-reference with HubSpot
For each unique customer email, call `HUBSPOT_SEARCH_CONTACTS_BY_CRITERIA` to check if they exist in the CRM.

### Step 4: Analyze gaps

```
## Contact Sync Report

### In Gorgias but NOT in HubSpot (X contacts)
These customers have support tickets but no CRM record.

| Email | Name | Tickets | First Contact | Last Contact |
|-------|------|---------|---------------|--------------|
| user@co.com | John D. | 3 | 2024-01-15 | 2024-03-20 |

**Action:** These contacts should be created in HubSpot.

### Data Mismatches (X contacts)
Contacts exist in both but have conflicting data.

| Email | Field | Gorgias | HubSpot | Recommended |
|-------|-------|---------|---------|-------------|
| user@co.com | Name | "John" | "Jonathan" | Keep HubSpot |

### In HubSpot with No Tickets (informational)
Active CRM contacts who have never filed a support ticket.
[Count only - this is normal and not actionable]

### Health Score
- Contacts in sync: X%
- Missing from CRM: X
- Data mismatches: X
- **Overall sync health:** Good/Needs Attention/Poor

### Recommendations
- [Specific actions to fix sync gaps]
```
