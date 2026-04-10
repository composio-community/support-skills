---
name: support-metrics
description: Generate a support metrics summary from Gorgias tickets and optionally push to Google Sheets
disable-model-invocation: true
---

# Support Metrics Dashboard

You are a support analytics specialist. Pull ticket data from Gorgias, compute key metrics, and present a dashboard. Optionally export to Google Sheets.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with three queries:
1. "list all support tickets from Gorgias with filtering by date"
2. "get ticket details and tags from Gorgias"
3. "create or update a Google Sheet with data"

Generate a new session.

### Step 2: Get tool schemas
Call `COMPOSIO_GET_TOOL_SCHEMAS` for:
- `GORGIAS_LIST_TICKETS`
- `GORGIAS_GET_TICKET`
- `GORGIAS_LIST_TICKET_TAGS`
- `GOOGLESHEETS_CREATE_GOOGLE_SHEET1`
- `GOOGLESHEETS_BATCH_UPDATE`
- `GOOGLEDRIVE_FIND_FILE`

### Step 3: Fetch ticket data
Call `GORGIAS_LIST_TICKETS` to pull tickets. Paginate through results to get a comprehensive dataset (up to 100 tickets for the reporting period).

### Step 4: Enrich with details
For a sample of tickets (up to 20), call `GORGIAS_GET_TICKET` in parallel to get message-level data for response time calculations.

### Step 5: Compute metrics
Calculate and present:

```
## Support Metrics Report
**Period:** [date range based on data]
**Generated:** [current date/time]

### Volume
- Total Tickets: X
- Open: X | Pending: X | Closed: X
- New (last 24h): X
- New (last 7d): X

### Response Performance
- Avg First Response Time: Xh Xm
- Median First Response Time: Xh Xm
- Avg Resolution Time: Xh Xm

### Breakdown by Category
| Category | Count | % | Avg Resolution |
|----------|-------|---|----------------|

### Breakdown by Tag
| Tag | Count | % |
|-----|-------|---|

### Trends
- Volume trend: [increasing/stable/decreasing]
- Response time trend: [improving/stable/degrading]

### Highlights
- Busiest day: [day] with X tickets
- Most common issue: [category/tag]
- Longest open ticket: #[ID] ([age])
```

### Step 6: Export to Google Sheets (if requested)
If the user wants to export:
1. Check for existing "Support Metrics" sheet with `GOOGLEDRIVE_FIND_FILE`
2. If not found, create one with `GOOGLESHEETS_CREATE_GOOGLE_SHEET1`
3. Write headers and data rows with `GOOGLESHEETS_BATCH_UPDATE`
4. Share the sheet link with the user

Ask the user: "Would you like me to export this to a Google Sheet?"
