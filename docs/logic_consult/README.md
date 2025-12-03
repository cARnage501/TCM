# LOGIC_CONSULT Engine

Narrative-agnostic logical auditor that turns any input into propositions, unknowns, candidate models, evaluation, and a justified conclusion.

## What this is

LOGIC_CONSULT:
- extracts propositions (P1, P2, …)
- identifies variables / unknowns
- generates candidate models (M1, M2, …)
- internally weights support (strong / moderate / weak / impossible)
- evaluates which models are best-supported and why
- concludes with the best-supported model, what is underdetermined, and what info would resolve it

It **does not** give advice, moral judgments, emotional reflections, or feasibility verdicts. It is strictly about logical structure and consequences.

## Why it was made

Built as a small, local reasoning kernel that:
- interrogates information for coherence
- exposes assumptions and missing variables
- forces clarity about what actually follows from the premises

Designed to sit underneath other systems as a reusable auditing core.

## Implementation (v0.1)

Wired through `src/architect_cli.sh`:
- accepts a single input string to audit
- injects the LOGIC_CONSULT contract
- runs `ollama run tcm:v0.1`
- prints the structured response to stdout

Output sections (stable shape):
- `### Propositions`
- `### Variables / Unknowns`
- `### Candidate Models`
- `### Evaluation`
- `### Conclusion`

## Example

**Input**

> Given A and B tend to co-occur and G sometimes follows on a rolling basis, with this limited scope of information what can you deduce about this?

**Output**

```text
### Propositions
- P1: A and B tend to co-occur.
- P2: G sometimes follows on a rolling basis.

### Variables / Unknowns
- What “rolling basis” means operationally.
- Magnitude or probability of “sometimes”.

### Candidate Models
- M1: A and B are correlated but not predictive of G.
- M2: G's occurrence is influenced by A and B's co-occurrence.

### Evaluation
- M1: weak support due to lack of connection to G.
- M2: moderate support because the input explicitly links G with A+B.

### Conclusion
- Best-supported model: M2.
- Underdetermined: definition of “rolling basis”; without it the strength of inference is limited.
```

## Roadmap

1. Expose weight table (optional) — e.g., `M1: weak`, `M2: moderate`.
2. Symbolic pattern parsing — handle inputs like `A+B -> G (0.3)` or `A+!B -> G (0.1)`.
3. Abductive reasoning — surface best explanations and missing premises.
4. Structural consistency checks — flag contradictions between propositions and model implications.
5. Integration — use LOGIC_CONSULT as the core reasoning kernel for larger systems.

## Related docs

- Debrief/continuity: `docs/logic_consult/DEBRIEF.md`
- Mode contract: `docs/logic_consult/MODE_SPEC.md`
- Pseudocode: `docs/logic_consult/PSEUDOCODE.md`
- Flow: `docs/logic_consult/FLOWCHART.md`
- Dataset schema: `docs/logic_consult/DATASET_SCHEMA.md`
- Examples: `data/logic_consult_fine_tune_examples.jsonl`
