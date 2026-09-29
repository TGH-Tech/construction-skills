# Construction skills by Bleno

Agent skills for construction planning and quality, for Claude, ChatGPT, Codex
and any agent that reads `SKILL.md`.

| Skill | What it does |
|---|---|
| [`construction-critical-path`](skills/construction-critical-path/SKILL.md) | Turns a construction agreement or scope of work into a critical-path (CPM) schedule: activities, logic, provisional durations, float and the critical path, with a CSV / Excel Gantt. |
| [`construction-qa-checklists`](skills/construction-qa-checklists/SKILL.md) | Reads a scope of work, decides which stage QA checklists it needs (with a reason for each), and prints a site-ready checklist workbook with YES / NO / NA and sign-off. |

These are open samples of workflows Bleno runs in production. The critical-path
skill carries the setup and substructure part of the planning library (13 of 33
activities) and a full CPM calculator; the QA skill carries 5 of 24 checklists
(118 of 599 checks) with their matching rules.

**The full workflows** — the complete libraries, automatic mapping from your
agreement, review steps, and PDF / Excel output — run free at
**[constructions.bleno.io](https://constructions.bleno.io)**. To use them on
your own projects, checklists and team, **[request a pilot at bleno.io](https://bleno.io)**.

## Install

### Quickest: paste a link into any Claude or ChatGPT chat

No install needed. Start a chat, attach your agreement or scope of work, and
paste one of these:

> Follow the instructions at
> https://raw.githubusercontent.com/TGH-Tech/construction-skills/main/dist/construction-critical-path.md
> and build the critical path schedule for the attached agreement.

> Follow the instructions at
> https://raw.githubusercontent.com/TGH-Tech/construction-skills/main/dist/construction-qa-checklists.md
> and make the QA checklist workbook for the attached scope of work.

Each file is the whole skill in one page — instructions, reference library
and scripts. Web access must be on in the chat so it can read the link.

### Claude Code, Codex, Cursor and other coding agents

```bash
npx skills add TGH-Tech/construction-skills
```

The [skills CLI](https://skills.sh) asks which agents to install into. Useful
options:

```bash
npx skills add TGH-Tech/construction-skills -g                      # for your user, not just this project
npx skills add TGH-Tech/construction-skills -a claude-code -a codex # specific agents
npx skills add TGH-Tech/construction-skills -s construction-qa-checklists
npx skills add TGH-Tech/construction-skills --list                  # see what's inside
```

### claude.ai (web and desktop)

1. Download the skill's zip:
   [construction-critical-path.zip](https://github.com/TGH-Tech/construction-skills/raw/main/dist/construction-critical-path.zip)
   or [construction-qa-checklists.zip](https://github.com/TGH-Tech/construction-skills/raw/main/dist/construction-qa-checklists.zip)
   (also on the [latest release](https://github.com/TGH-Tech/construction-skills/releases/latest)).
2. In Claude, open **Customize → Skills** (Settings → Capabilities on some
   plans), choose **Upload skill**, and select the zip.
3. Code execution must be on (Settings → Capabilities) so the calculator and
   the workbook builder can run.

### ChatGPT

1. Download the same zip (links above).
2. In ChatGPT, open **Skills → Create → Upload from your computer** and select
   the zip. ChatGPT scans a skill before it becomes available.

### Manually

Copy a folder from `skills/` into your agent's skills directory — for
example `~/.claude/skills/` for Claude Code or `~/.codex/skills/` for Codex.

## Try it

- *"Here is our construction agreement (PDF). Build the critical path schedule
  — we start on 5 October and work Monday to Saturday."*
- *"Which QA checklists does this scope of work need? Make me the workbook."*

The scripts run on Python 3 with the standard library; Excel output uses
`openpyxl` (`pip install openpyxl`), which claude.ai and ChatGPT already have.

## Repository layout

```
skills/
  construction-critical-path/
    SKILL.md
    references/   method, sample activity library
    scripts/      cpm.py — CPM calculator (JSON/CSV in; table, JSON, CSV, XLSX out)
    assets/       example schedule
    agents/       openai.yaml (ChatGPT / Codex display metadata)
  construction-qa-checklists/
    SKILL.md
    references/   sample checklists, matching rules
    scripts/      build_workbook.py — controlled-form QA workbook
    assets/       checklist data, example selection
    agents/       openai.yaml
dist/                upload zips and single-file editions (built by scripts/package.sh)
scripts/package.sh   rebuilds dist/
```

## License

Free to install and use, including on commercial projects; not to be
republished or redistributed. See [LICENSE](LICENSE).

## About

Built by [Bleno](https://bleno.io). Durations in the planning library are
provisional planning assumptions, and checklists must be reviewed by a
competent person for each project — these skills support, and do not replace,
the judgement of the site and QA team.
