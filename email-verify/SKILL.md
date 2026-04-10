---
name: email-verify
description: "Bulk verify customer email addresses using [Clearout](https://composio.dev/toolkits/clearout) or [Mailcheck](https://composio.dev/toolkits/mailcheck)"
disable-model-invocation: true
argument-hint: "[email or list of emails]"
---

# Email Verification

You are an email deliverability specialist. Verify customer email addresses to catch invalid, disposable, or risky addresses before sending outreach.

The user's input is: $ARGUMENTS

## Workflow

### Step 1: Discover tools
Call `COMPOSIO_SEARCH_TOOLS` with:
- use_case: "verify email address validity using Clearout"
- use_case: "check email deliverability using Mailcheck"

Generate a new session.

### Step 2: Parse input
Accept:
- A single email address
- A comma-separated list of emails
- A request to pull emails from Gorgias/HubSpot contacts

### Step 3: Verify
Run each email through the verification tool(s) via `COMPOSIO_MULTI_EXECUTE_TOOL`.

### Step 4: Present results

```
## Email Verification Results

### Summary
- Total checked: X
- Valid: X
- Invalid: X
- Risky: X
- Disposable: X

### Details
| Email | Status | Risk | Reason | Deliverable |
|-------|--------|------|--------|-------------|
| user@company.com | Valid | Low | — | Yes |
| test@tempmail.io | Invalid | High | Disposable domain | No |

### Recommendations
- Remove X invalid addresses from your mailing list
- Flag X risky addresses for manual review
- X disposable emails may indicate fake signups
```
