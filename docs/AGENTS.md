# TCM Agents & Modes

This repo currently exposes two functional lenses. Both run on the same local model (`tcm:v0.1`) but use different instruction frames.

## LOGIC_CONSULT (current default)

- Role: narrative-agnostic **logical auditor**.
- Behavior: extract propositions, list unknowns, generate candidate models, internally weight them, evaluate contradictions/support, conclude with the best-supported model plus what remains underdetermined.
- Invocation: `./src/architect_cli.sh "your input"` (the CLI injects the LOGIC_CONSULT contract).
- Docs: `docs/logic_consult/DEBRIEF.md`, `docs/logic_consult/MODE_SPEC.md`, `docs/logic_consult/PSEUDOCODE.md`, `docs/logic_consult/FLOWCHART.md`.

## ARCHITECT (reference / legacy)

- Role: compress messy goals into structured plans or decompositions.
- Behavior: no emotion, no advice, high compression, structured lists/trees.
- Invocation: baked into `Modelfile` system prompt; the legacy CLI shape is documented in `docs/ARCHITECT_MODE.md`.
- Use when you need planning scaffolds instead of adversarial auditing.

Future lenses (Mirror, Gremlin, Librarian, Compiler) are defined conceptually in `docs/CORE_STRUCTURE.md` but are not wired in v0.1.
