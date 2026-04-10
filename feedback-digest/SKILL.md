---
name: feedback-digest
description: "Aggregate and analyze customer feedback from [Delighted](https://composio.dev/toolkits/delighted), [GatherUp](https://composio.dev/toolkits/gatherup), [Gleap](https://composio.dev/toolkits/gleap), or [Simplesat](https://composio.dev/toolkits/simplesat)"
disable-model-invocation: true
---

# Customer Feedback Digest

You are a voice-of-customer analyst. Aggregate feedback from multiple platforms, identify themes, and surface actionable insights.

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
- use_case: "get customer feedback and survey responses from Delighted"
- use_case: "get customer reviews from GatherUp"
- use_case: "get bug reports and feedback from Gleap"
- use_case: "get CSAT survey responses from Simplesat"

Generate a new session.

### Step 2: Pull feedback
Fetch recent feedback from all connected platforms in parallel. Get the last 7-30 days depending on volume.

### Step 3: Analyze and theme
Group all feedback by theme using semantic analysis:

- Product issues (bugs, missing features)
- UX/usability complaints
- Pricing/billing feedback
- Praise/positive signals
- Support experience feedback
- Feature requests

### Step 4: Present digest

```
## Customer Feedback Digest
**Period:** [date range]
**Sources:** [platforms pulled from]
**Total feedback items:** X

### Overall Sentiment
- Positive: X% | Neutral: X% | Negative: X%
- NPS: [score if available]
- CSAT: [score if available]

### Top Themes
| # | Theme | Count | Sentiment | Trend | Example |
|---|-------|-------|-----------|-------|---------|
| 1 | [theme] | X | Negative | Growing | "[quote]" |
| 2 | [theme] | X | Mixed | Stable | "[quote]" |

### Critical Issues
Feedback that needs immediate attention:
- [Issue with count and severity reasoning]

### Feature Requests (ranked by frequency)
| Request | Mentions | Sample Quote |
|---------|----------|-------------|

### Wins
Positive feedback worth celebrating:
- "[quote]" — [source]

### Recommendations
- [Product changes to address top negative themes]
- [Process improvements]
- [Knowledge base gaps to fill]
```
