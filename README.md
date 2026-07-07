<h1 align="center">🧠 Idea Expander</h1>

<p align="center">
  <em>Turn <strong>one input</strong> into a large, ranked, red-teamed set of ideas and features — then explain the best ones.</em>
</p>

<p align="center">
  <a href="./LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-black.svg"></a>
  <img alt="Claude Code skill" src="https://img.shields.io/badge/Claude%20Code-skill-8A63D2">
  <img alt="Bilingual EN / فارسی" src="https://img.shields.io/badge/lang-EN%20%2F%20%D9%81%D8%A7%D8%B1%D8%B3%DB%8C-1f6feb">
  <img alt="No dependencies" src="https://img.shields.io/badge/deps-none-brightgreen">
</p>

---

A [Claude Code](https://claude.com/claude-code) skill that takes **one input** — a task, a half-formed idea, a feature, a product brief, a screenshot, or a rough note — and produces a large, scored, adversarially-filtered set of ideas and features, with a clear next move.

Most brainstorming stops at a flat list. This one **generates volume, then cuts** — it scores every candidate, attacks its own winners, and hands you a ranked shortlist you can act on.

## The pipeline

```
Ground ──▶ Diverge ──▶ Converge ──▶ Red-team ──▶ Explain
  │           │            │            │            │
 read      20–40        cluster +     "why would   what · why ·
 the       raw ideas    weighted      this fail?"  how · depends
 input     from many    scoring       drop the     on · effort ·
 first     lenses       Impact·Effort weak ones     biggest risk
           & personas   ·Fit·Novelty
```

```mermaid
flowchart LR
    A[📥 Input] --> B[0· Ground<br/>read real code/files]
    B --> C[1· Diverge<br/>20–40 ideas · many lenses]
    C --> D[2· Converge<br/>cluster + weighted score]
    D --> E[2.5· Red-team<br/>attack the winners]
    E --> F[3· Explain<br/>the survivors]
    F --> G[💡 Ranked ideas + features<br/>+ one recommended next move]
```

**What each stage does**

| Stage | What happens |
|---|---|
| **0 · Ground** | If the input points at real code or a file, it reads it first — grounded ideas that name real files beat generic ones. |
| **1 · Diverge** | 20–40 raw ideas across lenses: user value, differentiation, growth, monetization, technical leverage, UX, risk/edge cases, **subtraction**, and one or two 10x wildcards — plus PM / designer / engineer / skeptic personas. |
| **2 · Converge** | Clusters duplicates, scores every survivor **1–5** on Impact · Effort · Fit · Novelty with an explicit weighted formula (`Impact×2 + Fit×2 + Novelty + Effort`), picks the best 5–8, and names what it rejected. |
| **2.5 · Red-team** | Turns skeptic on its own picks — hidden cost, wrong audience, better existing solution, trust risk — and drops or demotes any that don't survive. |
| **3 · Explain** | For each survivor: what it is, why it won, how it works, what it depends on, effort (S/M/L), and the single biggest risk. Ideas and features are separated under two headers. |

It closes with a single recommended next move, and offers to save the output or hand off to a plan/PRD/implement skill.

## Install

**macOS / Linux**

```bash
git clone https://github.com/AmirGhl/idea-expander.git
cd idea-expander && bash install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/AmirGhl/idea-expander.git
cd idea-expander; ./install.ps1
```

<details>
<summary>Manual copy (no script)</summary>

```bash
# macOS / Linux
cp -r idea-expander/skills/idea-expander ~/.claude/skills/
```
```powershell
# Windows
Copy-Item -Recurse idea-expander\skills\idea-expander $env:USERPROFILE\.claude\skills\
```
</details>

Restart Claude Code (or reload skills) and it's ready.

## Usage

Trigger it explicitly:

```
/idea-expander <your input>
```

Or just describe what you want — it also fires on phrases like *"extract all ideas"*, *"brainstorm everything possible"*, *"find the best features"*, *"what could I build from this?"*, or the Persian *همه ایده‌ها رو دربیار / بهتریناشو انتخاب کن*.

### Options

| Flag | Effect |
|---|---|
| `--count N` | Aim for roughly N ideas. |
| `--goal <x>` | Bias scoring toward a goal (e.g. `revenue`, `retention`, `speed`). |

### Modes (auto-selected)

- **⚡ Quick** — small/one-line input → ~15 raw ideas, pick 5, single pass.
- **🔬 Deep** — big brief or *"very thorough" / "همه‌چیو دربیار"* → 30–40 raw ideas, pick 8, **fans out one sub-agent per lens/persona** (blind to each other), merges, scores once, and can use a small judge panel for the finalists.

## Example

```
/idea-expander improve the share button
```

<details>
<summary><strong>See a full sample output →</strong></summary>

See [`examples/share-button.md`](./examples/share-button.md) for a complete, end-to-end run (in Persian) — raw diverge list, scoring table, red-team pass, explained winners, and the closing recommendation.

</details>

More triggers:

```
/idea-expander دکمهٔ share رو بهتر کن
/idea-expander --goal retention --count 8 a habit-tracking mobile app
```

## Design principles

- **Volume, then cut.** The good ideas usually live at #12–30, not in the first obvious 5.
- **Subtraction counts.** Every run spends at least one idea on what to *remove* — an all-additive list quietly bloats the thing.
- **Red-teaming is the highest-leverage step.** A picked idea that can't survive its own critique never ships.
- **Grounded beats generic.** Real file and function names in the ideas, whenever the input allows.
- **No filler.** On a mature input or a re-run, it returns fewer, higher-quality picks and says so.

## What it is NOT

- Not a Socratic refiner — it generates volume, then cuts.
- Not implementation — it stops at explained, ranked ideas plus a recommended next step, then offers a clean handoff.

## License

[MIT](./LICENSE) © AmirGhl
