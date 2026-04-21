<h1 align="center">Support Skills</h1>

<p align="center">
<a href="https://dashboard.composio.dev/login?utm_source=Github&utm_medium=Github&utm_campaign=2026-04&utm_content=SupportSkills">
 <img width="1280" height="640" alt="Support Skills" src="https://github.com/user-attachments/assets/bab01a9e-f73b-4aae-a567-07304be3aa20" />
</a>
<p align="center">
  <a href="https://awesome.re">
    <img src="https://awesome.re/badge.svg" alt="Awesome" />
  </a>
  <a href="https://makeapullrequest.com">
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PRs Welcome" />
  </a>
  <a href="https://www.apache.org/licenses/LICENSE-2.0">
    <img src="https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=flat-square" alt="License: Apache-2.0" />
  </a>
</p>
<div>
<p align="center">
  <a href="https://twitter.com/composio">
    <img src="https://img.shields.io/badge/Follow on X-000000?style=for-the-badge&logo=x&logoColor=white" alt="Follow on X" />
  </a>
  <a href="https://www.linkedin.com/company/composiohq/">
    <img src="https://img.shields.io/badge/Follow on LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="Follow on LinkedIn" />
  </a>
  <a href="https://discord.com/invite/composio">
    <img src="https://img.shields.io/badge/Join our Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Join our Discord" />
  </a>
  </p>
</div>

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

# 2. Install the Composio CLI (connects to Gorgias, HubSpot, Slack, etc.)
curl -fsSL https://composio.dev/install | bash

# 3. Authenticate with Composio
composio login

# 4. Clone and install the skills
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

Skills shell out to the `composio` CLI to run tools. If a skill tries to call a toolkit that isn't connected yet, the CLI will tell you — just run `composio link <toolkit>` and retry.

Skills that don't need external tools (like `/sentiment-check`, `/tone-rewriter`, `/qa-response`, `/angry-customer-playbook`, `/response-templates`) work immediately with no setup.

---

## Ticket Management

| Skill | Description |
|-------|-------------|
| [Ticket Triage](ticket-triage/SKILL.md) | Pull open Gorgias tickets and auto-classify by P0-P3 priority and category |
| [Zendesk Triage](zendesk-triage/SKILL.md) | Pull open Zendesk tickets and triage by priority, category, and SLA status |
| [Freshdesk Triage](freshdesk-triage/SKILL.md) | Pull open Freshdesk tickets and triage by priority, type, and SLA |
| [Zoho Desk Triage](zoho-desk-triage/SKILL.md) | Pull open Zoho Desk tickets and triage by priority and department |
| [Intercom Resolve](intercom-resolve/SKILL.md) | Manage and resolve Intercom conversations — triage, reply, snooze, or close |
| [Inbox Zero](inbox-zero/SKILL.md) | Batch-scan unhandled tickets and suggest quick actions — reply, escalate, close, assign, or defer |
| [Auto-Tag](auto-tag/SKILL.md) | Analyze untagged tickets and recommend tags based on content, with confidence scores |
| [Merge Tickets](merge-tickets/SKILL.md) | Detect duplicate and related tickets using subject similarity, same-customer signals, and content matching |
| [SLA Monitor](sla-monitor/SKILL.md) | Real-time SLA compliance dashboard — flags breaches, at-risk tickets, and tracks first-response / resolution times |
| [Ticket Summarize](ticket-summarize/SKILL.md) | Condense long ticket threads into TL;DR, timeline, what's been tried, and clear action items |
| [WhatsApp Support](whatsapp-support/SKILL.md) | Handle WhatsApp customer support conversations via Wati or Whautomate |

## Customer Intelligence

| Skill | Description |
|-------|-------------|
| [Customer 360](customer-360/SKILL.md) | Full customer profile — ticket history + CRM data (company, deals, engagement timeline, health score) |
| [VIP Alert](vip-alert/SKILL.md) | Cross-reference open tickets against CRM to identify high-value customers needing priority treatment |
| [Sentiment Check](sentiment-check/SKILL.md) | Analyze customer messages for sentiment (-2 to +2), urgency level, emotional signals, and churn risk |
| [Contact Sync](contact-sync/SKILL.md) | Compare customer data across support and CRM systems to find missing contacts and data mismatches |
| [Lead Enrich](lead-enrich/SKILL.md) | Enrich customer/lead profiles with business data using LeadIQ, RocketReach, or Clearout |
| [Email Verify](email-verify/SKILL.md) | Bulk verify customer email addresses using Clearout or Mailcheck |
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
| [Chatbot Review](chatbot-review/SKILL.md) | Review AI chatbot conversations for bad responses, hallucinations, and missed questions |

## Feedback & Surveys

| Skill | Description |
|-------|-------------|
| [NPS Collect](nps-collect/SKILL.md) | Send NPS/CSAT surveys and analyze results using Delighted or Satismeter |
| [Feedback Digest](feedback-digest/SKILL.md) | Aggregate and analyze customer feedback from Delighted, GatherUp, Gleap, or Simplesat |

## Sales & Outreach

| Skill | Description |
|-------|-------------|
| [Outreach Campaign](outreach-campaign/SKILL.md) | Set up customer outreach sequences via Lemlist, Reply.io, or Woodpecker |
| [Proposal Draft](proposal-draft/SKILL.md) | Draft and send client proposals via Better Proposals or Bidsketch |
| [Call Summary](call-summary/SKILL.md) | Summarize customer support/sales calls from Dialpad or Leexi call logs |

---

## Setup

### Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

### Install the Composio CLI

These skills use the [Composio](https://composio.dev) CLI to connect to your support tools (Gorgias, HubSpot, Slack, etc.). Install it with:

```bash
curl -fsSL https://composio.dev/install | bash
```

Then authenticate:

```bash
composio login
composio whoami
```

`composio login` opens a browser-based flow, then prompts you to choose your default organization and project. `composio whoami` shows your current session context.

### Connect your apps

Connect each toolkit you plan to use with `composio link <toolkit>`:

```bash
composio link gorgias
composio link hubspot
composio link gmail
composio link slack
composio link linear
```

You don't have to do this upfront — if a skill tries to call a toolkit that isn't connected, the CLI will tell you and you can run `composio link` then retry. Supported apps:

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

Skills that integrate with external apps shell:

1. **Discover** the right tool slug with `composio search "<task description>"`
2. **Inspect** the schema with `composio execute <TOOL_SLUG> --get-schema` (or `--dry-run` for a safe preview)
3. **Execute** the tool with `composio execute <TOOL_SLUG> -d '{...}'`
4. **Recover** from missing connections by running `composio link <toolkit>` and retrying
5. **Analyze** the results using Claude's reasoning
6. **Present** structured, actionable output
7. **Confirm** before taking any external action (sending emails, creating issues, posting messages)

Standalone skills (sentiment, tone, QA, templates) work purely with Claude's reasoning — no external connections needed.

---

## Contributing

Got an idea for a new support skill? Open a PR with a new `skill-name/SKILL.md` following the existing format.

## License

MIT
