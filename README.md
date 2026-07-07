# Idea Expander

A [Claude Code](https://claude.com/claude-code) skill that turns **one input** — a task, a half-formed idea, a feature, a product brief, a screenshot, or a rough note — into a large, ranked set of ideas and features, then explains the best ones.

It runs your input through five stages:

> **Ground → Diverge → Converge → Red-team → Explain**

1. **Ground** — if the input points at real code or a file, it reads it first so ideas are concrete, not generic.
2. **Diverge** — generates 20–40 raw ideas from many lenses and personas (user value, differentiation, growth, monetization, technical leverage, UX, risk, *subtraction*, and one or two 10x wildcards).
3. **Converge** — clusters duplicates and scores every survivor on **Impact · Effort · Fit · Novelty** with an explicit weighted formula, then picks the best 5–8.
4. **Red-team** — attacks its own winners ("why would this fail?") and drops the ones that don't survive.
5. **Explain** — for each survivor: what it is, why it won, how it works, what it depends on, and the biggest risk.

It separates **ideas** (directions) from **features** (buildable things), and closes with a single recommended next move.

Bilingual: it answers in the language you write in — including full **Persian (فارسی)** output.

## Install

Copy the skill into your Claude Code skills directory.

**macOS / Linux**

```bash
git clone https://github.com/AmirGhl/idea-expander.git
cp -r idea-expander/skills/idea-expander ~/.claude/skills/
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/AmirGhl/idea-expander.git
Copy-Item -Recurse idea-expander\skills\idea-expander $env:USERPROFILE\.claude\skills\
```

Or run the installer from the repo root:

```bash
bash install.sh          # macOS / Linux
```
```powershell
./install.ps1            # Windows
```

Restart Claude Code (or reload skills) and the skill is available.

## Usage

Trigger it explicitly:

```
/idea-expander <your input>
```

Or just describe what you want in natural language — the skill also fires on phrases like *"extract all ideas"*, *"brainstorm everything possible"*, *"find the best features"*, *"what could I build from this?"*, or the Persian *همه ایده‌ها رو دربیار / بهتریناشو انتخاب کن*.

### Options

| Flag | Effect |
|---|---|
| `--count N` | Aim for roughly N ideas. |
| `--goal <x>` | Bias scoring toward a goal (e.g. `revenue`, `retention`, `speed`). |

### Modes

The skill auto-scales its effort:

- **Quick mode** — small or one-line input: ~15 raw ideas, pick 5, single pass.
- **Deep mode** — big brief or *"همه‌چیو دربیار" / "very thorough"*: 30–40 raw ideas, pick 8, fans out one sub-agent per lens/persona (blind to each other), then merges, scores once, and optionally uses a small judge panel.

## Examples

```
/idea-expander improve the share button
```

```
/idea-expander دکمهٔ share رو بهتر کن
```

```
/idea-expander --goal retention --count 8 a habit-tracking mobile app
```

## What it is NOT

- Not a Socratic refiner — it generates volume, then cuts.
- Not implementation — it stops at explained, ranked ideas plus a recommended next step, then offers a clean handoff to a plan/PRD/implement skill.

## License

[MIT](./LICENSE)
