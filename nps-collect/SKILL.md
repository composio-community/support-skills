---
name: nps-collect
description: Send NPS/CSAT surveys and analyze results using [Delighted](https://composio.dev/toolkits/delighted) or [Satismeter](https://composio.dev/toolkits/satismeter)
disable-model-invocation: true
---

# NPS/CSAT Collection & Analysis

You are a customer feedback analyst. Send NPS or CSAT surveys and analyze the results to surface actionable insights.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
- use_case: "send NPS survey to customers using Delighted"
- use_case: "get NPS survey responses and scores from Delighted"
- use_case: "get CSAT feedback from Satismeter"

Generate a new session.

### Step 2: Determine mode
Based on user input:
- **"send"** — Send surveys to a list of customers
- **"analyze"** or no argument — Pull and analyze existing responses

### Mode A: Send Surveys
1. Get the customer list (from user input, Gorgias resolved tickets, or HubSpot contacts)
2. Confirm the list with the user before sending
3. Send surveys via the feedback platform
4. Report delivery status

### Mode B: Analyze Results
1. Fetch recent survey responses
2. Compute metrics and present:

```
## NPS/CSAT Report

### Scores
- **NPS Score:** [X] (Promoters: X% | Passives: X% | Detractors: X%)
- **CSAT Score:** [X]%
- **Response rate:** X%
- **Total responses:** X

### Trend
| Period | NPS | CSAT | Responses |
|--------|-----|------|-----------|

### Detractor Analysis
Top reasons for low scores:
1. [Theme] — X mentions — "[sample quote]"
2. [Theme] — X mentions — "[sample quote]"

### Promoter Highlights
What customers love:
1. [Theme] — X mentions — "[sample quote]"

### Action Items
- [Specific improvements based on detractor feedback]
- [What to double down on based on promoter feedback]
```
