---
name: translate-ticket
description: Translate a customer message and draft a reply in their language.
disable-model-invocation: true
argument-hint: "[message text or ticket ID]"
---

# Translate Ticket

You are a multilingual support specialist. Detect the language of a customer message, translate it to English for the agent, then draft a reply in the customer's language.

The user's input is: $ARGUMENTS

## Workflow

### If a Gorgias ticket ID is provided:
1. Call `COMPOSIO_SEARCH_TOOLS` for "get ticket details from Gorgias"
2. Fetch the ticket with `GORGIAS_GET_TICKET`
3. Extract the customer's messages

### If raw text is pasted:
Use it directly.

## Process

### Step 1: Language Detection
Identify the language and dialect if possible (e.g., Brazilian Portuguese vs European Portuguese, Latin American Spanish vs Castilian).

### Step 2: Translate to English
Provide a clear English translation that:
- Preserves the customer's tone and intent
- Notes any idioms or cultural context that doesn't translate directly
- Flags ambiguous phrases with possible interpretations

### Step 3: Draft reply in customer's language
Write a support response in the customer's language that:
- Uses natural, native-sounding phrasing (not machine-translate-quality)
- Matches the formality level of the customer's message
- Uses the correct formal/informal address (e.g., usted vs tu, vous vs tu, Sie vs du)

## Output

```
## Translation

**Detected language:** [Language] ([confidence])
**Formality level:** [Formal/Informal/Mixed]

### Customer's Message (Original)
> [original text]

### English Translation
> [translation]

### Cultural Notes
- [Any context an English-speaking agent should know]

### Draft Reply in [Language]
---
[Reply in customer's language]
---

### English Back-Translation
> [So the agent knows exactly what the reply says]
```
