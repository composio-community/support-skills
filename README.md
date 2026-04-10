# Support Skills

 Support skills for AI agents for Claude Code, Codex, Cursor and more. Triage tickets, draft replies, track SLAs, detect churn risk, escalate bugs, generate CSAT follow-ups, build macros, translate messages, sync CRM contacts, and run weekly digests, without leaving your terminal.

## Contents

- [Quick Start](#quick-start)
- [Ticket Management](#ticket-management)
- [Customer Intelligence](#customer-intelligence)
- [Communication](#communication)
- [Analytics & Reporting](#analytics--reporting)
- [Workflow Automation](#workflow-automation)
- [Quality & Training](#quality--training)
- [Feedback & Surveys](#feedback--surveys)
- [Sales & Outreach](#sales--outreach)
- [Setup](#setup)

---

## Quick Start

```bash
# 1. Install Claude Code
npm install -g @anthropic-ai/claude-code

# 2. Add the Composio MCP server (connects to Gorgias, HubSpot, Slack, etc.)
claude mcp add composio-mcp --transport http https://connect.composio.dev/mcp

# 3. Clone and install the skills
git clone https://github.com/composiohq/support-skills.git
cd support-skills
./install.sh /path/to/your/project
```

This copies all skills into `.claude/skills/` so they're available as `/slash-commands` in Claude Code.

```bash
# Open Claude Code and run any skill
claude
> /ticket-triage
> /customer-360 jane@acme.com
> /escalate 12345
> /sentiment-check "I've been waiting 3 days and nobody has responded"
> /tone-rewriter empathetic "Your request has been processed."
```

On first run, Claude will prompt you to authenticate with each app it needs — just follow the browser link and you're set.

Skills that don't need external tools (like `/sentiment-check`, `/tone-rewriter`, `/qa-response`, `/angry-customer-playbook`, `/response-templates`) work immediately with no setup.

---

## Ticket Management

| Skill | Description |
|-------|-------------|
| [Ticket Triage](ticket-triage/SKILL.md) | Pull open tickets and auto-classify by P0-P3 priority and category (bug, billing, howto, feature, account) |
| [Inbox Zero](inbox-zero/SKILL.md) | Batch-scan unhandled tickets and suggest quick actions — reply, escalate, close, assign, or defer |
| [Auto-Tag](auto-tag/SKILL.md) | Analyze untagged tickets and recommend tags based on content, with confidence scores |
| [Merge Tickets](merge-tickets/SKILL.md) | Detect duplicate and related tickets using subject similarity, same-customer signals, and content matching |
| [SLA Monitor](sla-monitor/SKILL.md) | Real-time SLA compliance dashboard — flags breaches, at-risk tickets, and tracks first-response / resolution times |
| [Ticket Summarize](ticket-summarize/SKILL.md) | Condense long ticket threads into TL;DR, timeline, what's been tried, and clear action items |

## Customer Intelligence

| Skill | Description |
|-------|-------------|
| [Customer 360](customer-360/SKILL.md) | Full customer profile — ticket history + CRM data (company, deals, engagement timeline, health score) |
| [VIP Alert](vip-alert/SKILL.md) | Cross-reference open tickets against CRM to identify high-value customers needing priority treatment |
| [Sentiment Check](sentiment-check/SKILL.md) | Analyze customer messages for sentiment (-2 to +2), urgency level, emotional signals, and churn risk |
| [Contact Sync](contact-sync/SKILL.md) | Compare customer data across support and CRM systems to find missing contacts and data mismatches |
| [Root Cause Analysis](root-cause/SKILL.md) | Analyze a cluster of related tickets to identify the underlying root cause with Five Whys framework |

## Communication

| Skill | Description |
|-------|-------------|
| [Draft Reply](draft-reply/SKILL.md) | Read the full ticket thread and draft an empathetic, context-aware reply — optionally save as email draft |
| [Response Templates](response-templates/SKILL.md) | Generate polished canned response templates for common scenarios (first response, need info, bug confirmed, etc.) |
| [CSAT Follow-Up](csat-followup/SKILL.md) | Find recently resolved tickets and send personalized satisfaction follow-up emails |
| [Customer Winback](customer-winback/SKILL.md) | Identify churned/at-risk customers from ticket patterns + CRM data, then draft personalized winback emails |
| [Tone Rewriter](tone-rewriter/SKILL.md) | Rewrite a support response in a different tone — formal, casual, technical, empathetic, or concise |
| [Translate Ticket](translate-ticket/SKILL.md) | Detect language, translate to English for the agent, and draft a reply in the customer's language |
| [Angry Customer Playbook](angry-customer-playbook/SKILL.md) | Step-by-step de-escalation guide with tailored response for handling angry or abusive messages |

## Analytics & Reporting

| Skill | Description |
|-------|-------------|
| [Support Metrics](support-metrics/SKILL.md) | Compute volume, response times, category breakdowns, and trends — optionally export to a spreadsheet |
| [Weekly Digest](weekly-digest/SKILL.md) | Generate a comprehensive weekly support report and post it to Slack |

## Workflow Automation

| Skill | Description |
|-------|-------------|
| [Escalate](escalate/SKILL.md) | Escalate a ticket to an issue tracker + team notification in one move, with confirmation before executing |
| [Bug Report](bug-report/SKILL.md) | Extract structured, engineering-ready bug reports from tickets (repro steps, expected/actual, impact) |
| [Handoff Notes](handoff-notes/SKILL.md) | Generate shift handoff notes covering all active tickets — what needs attention, what's waiting, what was resolved |
| [Refund Processor](refund-processor/SKILL.md) | Gather full context around refund requests, assess eligibility against customer history, and prepare for approval |
| [Macro Builder](macro-builder/SKILL.md) | Analyze recurring ticket patterns and generate reusable step-by-step playbooks for agents |

## Quality & Training

| Skill | Description |
|-------|-------------|
| [Knowledge Search](knowledge-search/SKILL.md) | Search the knowledge base for relevant articles to help resolve customer issues, with suggested responses |
| [QA Response](qa-response/SKILL.md) | Review a drafted response for quality, accuracy, tone, and completeness before sending |

---

## Setup

### Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

### Add the MCP server

These skills use [Composio](https://composio.dev) to connect to your support tools (Gorgias, HubSpot, Slack, etc.). Add the MCP server to your Claude Code config:

```bash
claude mcp add composio-mcp --transport http https://connect.composio.dev/mcp
```

This registers the Composio MCP server so Claude Code can discover and call tools across your connected apps.

### Connect your apps

On first use, Claude will prompt you to authenticate with each app it needs. You'll get a browser link to authorize access — just click through and you're set. Supported apps:

- **Gorgias** — Support tickets
- **HubSpot** — CRM, contacts, deals
- **Gmail** — Email replies and drafts
- **Slack** — Team notifications and digests
- **Linear** — Issue tracking and escalation
- **Google Sheets** — Metrics export
- **Notion** — Knowledge base search

---

## How Skills Work

Each skill is a directory with a `SKILL.md` file — a self-contained prompt that tells Claude what to do. The install script copies them into your project's `.claude/skills/` directory where Claude Code picks them up as `/slash-commands`.

Skills that integrate with external apps:

1. **Discover** the right tools for the task
2. **Fetch schemas** to know the exact parameters needed
3. **Execute** tool calls to pull/push data across connected apps
4. **Analyze** the results using Claude's reasoning
5. **Present** structured, actionable output
6. **Confirm** before taking any external action (sending emails, creating issues, posting messages)

Standalone skills (sentiment, tone, QA, templates) work purely with Claude's reasoning — no external connections needed.

---

## Contributing

Got an idea for a new support skill? Open a PR with a new `skill-name/SKILL.md` following the existing format.

## License

MIT
