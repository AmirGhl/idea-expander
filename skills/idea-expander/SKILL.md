---
name: idea-expander
description: Expand any task, idea, feature, product brief, or rough note into a large set of possible ideas and features generated from many different angles, then rank and select the best ones against explicit criteria, and explain each selected idea and feature. Use when the user gives you an input and wants to "extract all ideas", "brainstorm everything possible", "find the best ideas/features", asks "what could I build from this?", or says چه ایده‌هایی درمیاد / همه ایده‌ها رو دربیار / بهتریناشو انتخاب کن. Trigger with /idea-expander.
---

# Idea Expander

Take one input — a task, a half-formed idea, a feature, a product brief, a screenshot, a paragraph — and run it through **ground → diverge → converge → red-team → explain**:

0. **Ground**: if the input points at real code/a file, read it first.
1. **Diverge**: pull out as many distinct ideas and features as possible, from many lenses and personas.
2. **Converge**: dedupe, score against explicit weighted criteria, pick the best.
3. **Red-team**: attack your own picks; drop the ones that don't survive.
4. **Explain**: for each survivor, what it is, why it's good, how it works, what it depends on.

Match the user's language. If they wrote in Persian, produce the whole output in Persian (headings can stay English-ish, but content is Persian). Keep the same tone the user used.

## Step 0 — Read the input (ground it), then decide if you need to ask

If the input **points at something concrete** — a file, a component, a feature, a page, a diff, a codebase area — **read it first** before generating. Grounded ideas that name real files/functions beat generic ones every time. Only skip reading when the input is a pure abstract prompt with nothing to open.

Ask clarifying questions **only if the input is genuinely ambiguous in a way that changes the ideas** — e.g. you don't know the audience, the platform, or the goal, and guessing would send you the wrong direction. Ask at most 2 short questions, then proceed. If the input is clear enough, do **not** ask — just start generating, but write a one-line **فرضیات / Assumptions** note stating the guesses you made, so the user can correct them without you having stalled. Never stall on questions; a rough answer now beats a perfect answer never.

If the user passed a goal or constraint (revenue, retention, speed, a deadline) or an explicit `--count N` / `--goal <x>`, honor it: weight scoring toward that goal and generate roughly that many.

## Step 1 — Diverge (generate a lot, from many angles)

Generate **20–40 raw ideas**. Force variety by walking these lenses — spend at least one idea on each that applies:

- **User value** — what makes the core job easier, faster, or more delightful for the end user.
- **Feature / product** — concrete buildable things (screens, flows, components, endpoints).
- **Differentiation** — what would make this stand out vs. the obvious/competitor version.
- **Growth & retention** — hooks, loops, sharing, notifications, habit formation.
- **Business / monetization** — ways it could make money or cut cost.
- **Technical leverage** — smart uses of data, automation, AI, integrations, existing infra.
- **UX & delight** — micro-interactions, empty states, onboarding, personalization.
- **Risk-reduction / edge cases** — trust, safety, errors, abuse, accessibility, i18n.
- **Subtract / simplify** — what to *remove*, merge, or cut. Great ideation includes deletions, not just additions; an all-additive list quietly bloats the thing. Spend at least one idea here.
- **Wildcard / 10x** — one or two deliberately ambitious, "what if we went all in" ideas.

Rules for this step:
- Quantity over polish. One line each. Don't self-censor or dedupe yet.
- Push past the first obvious 5 — the good ones usually live in ideas #12–30.
- Separate two kinds as you go: **Ideas** (directions/concepts) vs **Features** (specific things you'd build). Tag each `[idea]` or `[feature]`.
- **Force diversity with personas, not just lenses:** spend a few ideas answering "what would a PM / a designer / an engineer / a growth hacker / a skeptic each want here?" — personas surface ideas the flat lens-sweep misses.
- **Anti-obvious check:** before moving on, confirm at least ~5 candidates are non-obvious (a naive first pass wouldn't reach them). If not, keep going.

Show this raw list briefly (collapsed/compact) so the user sees the breadth, then move on. Don't over-explain here.

## Step 2 — Converge (score and select the best)

First **cluster near-duplicates**: merge candidates that are the same idea in different words, so scoring isn't diluted by repeats. Then score every survivor on a 1–5 scale across four axes.

| Axis | Question |
|---|---|
| **Impact** | How much does it move the goal / help the user? |
| **Effort** | How cheap/fast is it to build? (higher score = less effort) |
| **Fit** | Does it fit the input's real intent, audience, and constraints? |
| **Novelty** | Is it non-obvious / differentiating? |

- Rank by an **explicit weighted total** — default **Impact×2 + Fit×2 + Novelty + Effort** (Impact and Fit dominate). State the formula you used; if the user gave a goal, tilt the weights toward it.
- **Select the best 5–8**, and try to keep a mix: at least a couple of quick wins (high impact, low effort) and one ambitious bet.
- Explicitly name **2–3 you rejected and why** (too costly, off-target, duplicate) — the cut is as useful as the pick.

## Step 2.5 — Red-team the winners (adversarial pass)

Before explaining, turn skeptic on your own picks. For each selected winner ask: **"Why would this fail, be a bad idea, or not be worth it?"** — hidden cost, wrong audience, better existing solution, regulatory/trust risk, won't actually move the goal. 

- Drop or demote any winner that doesn't survive its own critique; promote a reserve in its place.
- Keep the surviving critique as the "biggest risk" line in Step 3 — this is the single highest-leverage quality step, so don't skip it.

### Saturation & re-runs

Don't manufacture filler to hit a count. If the input is already mature — or this is a **re-run over the same input** — it is correct to return **fewer, higher-quality** picks and to say so ("این ورودی بالغ است؛ فقط N موردِ حاشیه‌ای مانده"). Declare saturation only *after* a full diverge pass, never as an excuse to skip one.

On a re-run: read the previous output first, **skip ideas already surfaced**, and target only the remaining gap — the second pass should find what the first missed, not repeat it.

## Step 3 — Explain each winner

For **each selected idea and feature**, write a short block:

- **Name** — a crisp, memorable title.
- **نوع / Type** — idea (direction) or feature (buildable).
- **چیه** — one or two sentences: what it actually is.
- **چرا خوبه** — why it won: the value and the differentiation.
- **چطور کار می‌کنه** — the mechanism / how you'd build or run it, at a high level.
- **وابستگی / Depends on** — what must exist or ship first (write "—" if nothing). This turns the list into a sequenced roadmap.
- **تلاش / Effort** — S / M / L, plus the single biggest risk or unknown (reuse what survived the red-team pass).

Order the winners by score (best first). Group ideas and features under two clear headers so "هم ایده هم فیچر" is visually separated, exactly as the user asked.

## Step 4 — Close with a recommendation

End with a 2–3 line **پیشنهاد**: if the user could only do one thing next, which, and why. Offer the obvious next move (e.g. "بگو تا برای فیچر شمارهٔ ۱ یک plan/PRD بسازم" or "می‌خوای همینو prototype کنم؟").

If the output is long or the user will act on it later, offer to **save it to a file** (e.g. an `ideas/<topic>.md` in the repo or the scratchpad) so it isn't lost in chat, and offer a clean **handoff** to a plan/PRD/implement skill for the top pick.

## Output shape (template)

```
> TL;DR: بهترین انتخاب = <top pick> — <چرا در یک جمله>
> فرضیات: <guesses you made if you didn't ask> (این خط را فقط وقتی بدون سؤال جلو رفتی بیاور)

## ورودی
<one-line restatement of what you understood>

## ۱) همه ایده‌ها (خام) — دیورج
- [idea] ...
- [feature] ...
  (۲۰–۴۰ مورد، فشرده)

## ۲) امتیازدهی و انتخاب
فرمول: Impact×2 + Fit×2 + Novelty + Effort
<compact table: candidate | Impact | Effort | Fit | Novelty | total | verdict>
رد شد: <2–3 مورد + دلیل>
ضدحمله: <هر برنده‌ای که در پاس اسکپتیک افتاد یا جایگزین شد>

## ۳) برنده‌ها — توضیح کامل

### 💡 ایده‌ها
**۱. <name>** — نوع: idea
- چیه / چرا خوبه / چطور کار می‌کنه / وابستگی / تلاش: S/M/L — ریسک: ...

### 🧩 فیچرها
**۱. <name>** — نوع: feature
- چیه / چرا خوبه / چطور کار می‌کنه / وابستگی / تلاش

## پیشنهاد
<one clear next step + offer to save to file / hand off to plan/PRD>
```

## Scaling the effort

Auto-pick a mode from the input size and the user's wording:

- **Quick mode** (small/one-line input, or `--count` small) → ~15 raw ideas, pick 5, short explanations, single pass. Skip parallel sub-agents.
- **Deep mode** ("همه‌چیو دربیار" / "خیلی کامل" / big brief) → 30–40 raw ideas, pick 8. Fan out one **sub-agent per lens (or per persona)** so each generates independently and blind to the others — this surfaces ideas a single pass misses. Concrete recipe:
  - Spawn via the **Agent** tool (one call per lens, in a single message so they run concurrently), or an **idea-expander Workflow** that maps lenses → agents → merge.
  - Each sub-agent returns its raw candidates; you **merge, cluster duplicates, then score once** (Step 2) over the union.
  - For extra rigor in deep mode, use a small **judge panel**: 2–3 independent scorers rank the finalists and you reconcile, instead of one scoring pass.

## Example (tiny, end-to-end)

Input: «دکمهٔ share رو بهتر کن» (grounded in a real `ShareButton`).

- **Diverge (compact):** `[feature]` share as branded image · `[feature]` copy-link · `[idea]` share-to-earn referral · `[feature]` QR for mobile · `[feature]` pre-filled caption · `[feature] Subtract:` drop the 6 rarely-used networks, keep 2 …
- **Converge** (Impact×2+Fit×2+Nov+Effort): branded-image **24** ✅ · copy-link **22** ✅ · referral **21** ✅ (big bet) · QR **15** ✂️ (low fit).
- **Red-team:** "referral" → abuse risk → keep but gate behind login.
- **Explain** winners under 💡 ایده‌ها / 🧩 فیچرها, each with *وابستگی* + *تلاش*.
- **پیشنهاد:** branded-image first (cheap, viral); offer to save to `ideas/share.md`.

## What this skill is NOT

- Not a Socratic refiner (that's brainstorming skills) — here you generate volume, then cut.
- Not implementation. Stop at explained, ranked ideas + a recommended next step. If the user wants to build, hand off to a plan/PRD/implement skill.
