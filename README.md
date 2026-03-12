# The GTM Engineer's Playbook for the Claude Code Era

**10 installable Claude Code skills that turn your terminal into a GTM command center.**

Built by [Earleads](https://www.earleads.com) — GTM Engineering as a Service.

---

## What This Is

A collection of Claude Code skills designed for GTM engineers, sales operators, and revenue teams. Each skill encodes a repeatable methodology — not a one-shot prompt. Install them, trigger them with natural language, and they produce structured output you can use immediately.

These skills are the building blocks of a modern GTM operating system. They chain together: your ICP feeds your Signal Scanner, which feeds your Qualification Scorer, which feeds your Outreach Sequences.

## The Skills

### Core Skills (7)

| # | Skill | Trigger | What It Produces |
|---|-------|---------|-----------------|
| 01 | **ICP Architect** | "build my ICP" | `docs/icp.md` — personas, psychographics, buying signals, community map |
| 02 | **Signal Scanner** | "scan for signals" | `docs/signals/{company}.md` — buying signals with Fit x Timing x Access x Intent scores |
| 03 | **Account Research Brief** | "research this company" | `docs/accounts/{company}.md` — 1-page company intelligence brief in 2 minutes |
| 04 | **Qualification Scorer** | "score this lead" | `docs/pipeline/scored-leads.md` — HOT/WARM/COLD/PARK tier classification |
| 05 | **Outreach Sequence Builder** | "build an outreach sequence" | `docs/sequences/{trigger}.md` — signal-triggered multi-channel sequences |
| 06 | **Meeting Prep Brief** | "prep me for a meeting" | `docs/meeting-prep/{company}-{date}.md` — pre-call intelligence brief |
| 07 | **Competitive Battlecard Generator** | "battlecard for [competitor]" | `docs/battlecards/{competitor}.md` — strengths, weaknesses, objection handling |

### Bonus Skills (3)

| # | Skill | Trigger | What It Produces |
|---|-------|---------|-----------------|
| 08 | **CRM Hygiene Scanner** | "clean my CRM" | `docs/crm-hygiene-report.md` — duplicates, stale records, data quality score |
| 09 | **Weekly GTM Report** | "weekly report" | `docs/reports/week-{date}.md` — pipeline summary, signals, recommendations |
| 10 | **Agent Architecture Planner** | "design an agent" | `docs/agents/{name}/` — shell wrapper, system prompt, config, scheduling |

## How They Chain Together

```
ICP Architect ─────────────┐
  "build my ICP"           │
  produces: docs/icp.md    │
                           ▼
Signal Scanner ◄─── reads icp.md for scoring criteria
  "scan for signals"       │
  produces: docs/signals/  │
                           ▼
Qualification Scorer ◄──── reads icp.md + signals/
  "score this lead"        │
  produces: docs/pipeline/ │
                           ├──────────────────────┐
                           ▼                      ▼
Outreach Sequence Builder  Meeting Prep Brief
  reads icp.md + accounts/ reads accounts/ + signals/
  produces: docs/sequences/ produces: docs/meeting-prep/
                           │
                           ▼
Account Research Brief ◄── standalone or feeds into above
  "research [company]"
  produces: docs/accounts/

Competitive Battlecard ◄── standalone reference
  "battlecard for [X]"
  produces: docs/battlecards/

Weekly GTM Report ◄──────── reads ALL docs/ subdirectories
  "weekly report"
  produces: docs/reports/
```

## Installation

### Option 1: Quick Install (recommended)

```bash
git clone https://github.com/Othmane-Khadri/gtm-engineer-playbook.git
cd gtm-engineer-playbook
./install.sh
```

### Option 2: Manual

```bash
git clone https://github.com/Othmane-Khadri/gtm-engineer-playbook.git
cp -r gtm-engineer-playbook/.claude/skills/gtm-playbook/ your-project/.claude/skills/gtm-playbook/
```

### Option 3: Cherry-pick specific skills

```bash
# Only install the skills you want
cp -r gtm-engineer-playbook/.claude/skills/gtm-playbook/icp-architect/ your-project/.claude/skills/gtm-playbook/icp-architect/
cp -r gtm-engineer-playbook/.claude/skills/gtm-playbook/signal-scanner/ your-project/.claude/skills/gtm-playbook/signal-scanner/
```

## Uninstall

```bash
rm -rf .claude/skills/gtm-playbook/
```

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- A Claude Code project (any project — these skills work anywhere)
- WebSearch access (most skills use it for real-time intelligence)

## Recommended MCP Servers

These skills work standalone, but they're even more powerful with MCP servers connected:

| MCP Server | Install Command | What It Adds |
|------------|----------------|-------------|
| HubSpot | `claude mcp add --transport http hubspot https://mcp.hubspot.com/mcp` | CRM read/write |
| Notion | `claude mcp add --transport http notion https://mcp.notion.com/mcp` | Workspace integration |
| Apollo.io | Community: `edwardchoh/apollo-io-mcp-server` | Contact enrichment |
| SmartLead | `npx @leadmagic/smartlead-mcp` | Email outreach |
| Supabase | Community: `supabase-community/supabase-mcp` | Database backend |

## Quick Start

After installation, open Claude Code in any project and try:

```
1. "Build my ICP" → walks you through defining your target customer
2. "Research Acme Corp" → produces a 1-page intelligence brief
3. "Scan Acme Corp for buying signals" → finds and scores live signals
4. "Score my leads" → qualifies your pipeline with tier classification
5. "Build an outreach sequence for post-fundraise" → ready-to-send messages
```

## Output Structure

All skills write to a `docs/` directory in your project root:

```
docs/
├── icp.md                          # ICP Architect output
├── signals/
│   ├── README.md                   # Signal summary
│   └── {company-name}.md           # Per-company signals
├── accounts/
│   └── {company-name}.md           # Account research briefs
├── pipeline/
│   └── scored-leads.md             # Qualification scores
├── sequences/
│   ├── README.md                   # Sequence index
│   └── {trigger-name}.md           # Per-trigger sequences
├── meeting-prep/
│   └── {company}-{date}.md         # Meeting briefs
├── battlecards/
│   ├── README.md                   # Competitor index
│   └── {competitor-name}.md        # Per-competitor battlecards
├── reports/
│   ├── README.md                   # Report index
│   └── week-{YYYY-WNN}.md         # Weekly reports
├── crm-hygiene-report.md           # CRM audit
└── agents/
    └── {agent-name}/               # Agent architecture plans
        ├── architecture.md
        ├── run.sh
        ├── prompt.md
        ├── config.yaml
        └── README.md
```

## Complementary Resources

These skills pair well with existing GTM resources:

| Resource | What It Adds |
|----------|-------------|
| [ColdIQ GTM Skills](https://github.com/sachacoldiq/ColdIQ-s-GTM-Skills) | 137 sales triggers, 34 email templates |
| [gtmagents](https://github.com/gtmagents/gtm-agents) | 92 agents across sales, marketing, CS, RevOps |
| [claude-seo](https://github.com/AgriciDaniel/claude-seo) | SEO/GEO skills with DataForSEO integration |
| [awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers) | Comprehensive MCP server directory |
| [Anthropic Skills](https://github.com/anthropics/skills) | Official Claude Code skills |

## Philosophy

**Skills > Prompts.** A prompt gives you a one-time answer. A skill encodes a methodology that produces consistent, high-quality output every time. The hard part of GTM engineering isn't writing the prompt — it's knowing the right questions to ask, the right frameworks to apply, and the right sequence to follow.

**Chain, don't silo.** Each skill reads the output of other skills. Your ICP informs your signal scoring. Your signals inform your outreach. Your outreach results feed your weekly report. The whole system compounds.

**Shell orchestrates, Claude thinks.** For autonomous agents, let the shell handle infrastructure (API calls, scheduling, file management) and let Claude handle intelligence (scoring, writing, deciding). This separation keeps both layers simple and debuggable.

---

Built by [Earleads](https://www.earleads.com) — we build GTM systems for B2B companies. If you want us to build and run these systems for you, [let's talk](https://www.earleads.com).
