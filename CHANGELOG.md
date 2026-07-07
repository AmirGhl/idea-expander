# Changelog

All notable changes to this skill are documented here.

## [1.0.0] — 2026-07-07

Initial release.

- `idea-expander` skill (`skills/idea-expander/SKILL.md`) with the full
  **Ground → Diverge → Converge → Red-team → Explain** pipeline.
- Weighted scoring (`Impact×2 + Fit×2 + Novelty + Effort`), adversarial
  red-team pass, and separated ideas/features output.
- Auto-scaling **Quick** and **Deep** modes (Deep fans out one sub-agent
  per lens/persona, then merges and scores once).
- Bilingual output — matches the user's language, including full Persian.
- `--count N` and `--goal <x>` options.
- Install scripts for macOS/Linux (`install.sh`) and Windows (`install.ps1`).
- Worked end-to-end example in `examples/share-button.md`.
