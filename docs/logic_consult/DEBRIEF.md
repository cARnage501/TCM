# LOGIC_CONSULT Debrief (v0.1)

Continuity handoff for anyone (human or model) who needs to understand and extend the LOGIC_CONSULT engine without digging through history.

## 1) Starting goal

Build a small, local, deterministic reasoning engine that audits information, extracts structure, and thinks logically without emotional or narrative contamination.

Desired capabilities:
- first-principles reasoning and structured logic
- adversarial claim auditing and variable/unknown tracking
- model-based thinking with internal weighting
- convergence toward the strongest supported interpretation

Explicitly **not**: advice, classification, personal analysis, or feasibility judgments. Domain-agnostic across math, patterns, events, data, pseudo-code, or abstract descriptions.

## 2) Finished product (v0.1)

Delivered as a CLI-wrapped local model (`src/architect_cli.sh`) that enforces six mandatory operations on any input:

1. **Propositional Extraction** — convert the input into explicit P1, P2, P3… propositions (raw claims/relationships).
2. **Variable / Unknown Identification** — list missing values, definitions, or under-specified components that constrain reasoning.
3. **Candidate Model Generation** — propose multiple structural interpretations (M1, M2, M3…).
4. **Internal Weighting** — judge each model as strong/moderate/weak/impossible (weights are implicit in the explanation).
5. **Logical Evaluation** — explain which models follow from the data, which contradict it, and why certain models collapse.
6. **Conclusion** — name the strongest supported interpretation, state what remains underdetermined, and what info would resolve ambiguity.

## 3) What this engine is

LOGIC_CONSULT is a narrative-agnostic logical auditor that evaluates information via propositional extraction, model generation, internal weighting, and adversarial reasoning to derive the most supported interpretation of any input.

It is **not** personal, emotional, advisory, optimization-focused, or a feasibility classifier. It is a logical inference engine.

## 4) What it does

Short version: break input into propositions, identify unknowns, construct models, weight them, reject contradictions, and conclude with the best-supported interpretation plus explicit gaps.

Long version:
- parse input into structured components
- highlight missing data
- build interpretations of how the system might work
- compare them and select the strongest based on evidence
- state what cannot be concluded
- state what additional information would settle the matter

Every output shows its reasoning chain.

## 5) Why it was built

Needed a reusable **truth auditor**, not a helper, life coach, pattern generator, or rule-based classifier. Goals:
- dismantle narrative, expose logical structure, and force clarity
- respect uncertainty and avoid hallucinated confidence
- operate identically across domains
- serve as the auditing core for larger reasoning systems

Think “small, local, adversarial mathematician” interrogating coherence.

## 6) Example (exact output shape)

**Input**

> Given A and B tend to co-occur and G sometimes follows on a rolling basis, with this limited scope of information what can you deduce?

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
- Underdetermined: definition of rolling basis; without it the strength of inference is limited.
```

## 7) Next development steps

1. **Expose weight table (optional):** print `M1: weak`, `M2: moderate`, etc.
2. **Symbolic pattern handling:** parse inputs like `A+B → G (0.3)` or `A+!B → G (0.1)` and fold into evaluation.
3. **Abductive reasoning:** surface best explanations, differentiate cause vs correlation, hypothesize missing premises.
4. **Structural consistency checks:** explicitly flag contradictions between propositions and model implications.
5. **Integration into multi-mode core:** embed this auditor as the skeleton reasoning module for larger systems.

## 8) One-liner

LOGIC_CONSULT is a local logical auditor that turns any input into propositions, identifies unknowns, generates and weighs candidate models, rules out contradictions, and concludes with the most supported interpretation. Next: expose weight tables, handle symbolic patterns, add abductive reasoning, and strengthen consistency checks.
