# LOGIC_CONSULT Flowchart (Textual)

You can translate this into a visual diagram in any tool (Mermaid, draw.io, etc.).

```text
             ┌─────────────────────────┐
             │       INPUT TEXT        │
             └─────────────┬───────────┘
                           │
                           v
              ┌────────────────────────┐
              │  Extract Propositions  │
              │      (P1, P2, ...)     │
              └────────────┬───────────┘
                           │
                           v
          ┌────────────────────────────────┐
          │   Identify Variables / Unknowns │
          └─────────────────┬──────────────┘
                            │
                            v
           ┌────────────────────────────────┐
           │      Generate Candidate        │
           │        Models (M1, M2, ...)    │
           └─────────────────┬──────────────┘
                             │
                             v
       ┌────────────────────────────────────────┐
       │   Assess Support / Assign Weights      │
       │  (STRONG / MODERATE / WEAK / IMPOSS.) │
       └──────────────────┬─────────────────────┘
                          │
                          v
          ┌────────────────────────────────┐
          │        Evaluate Models         │
          │ (compare, find conflicts, etc.)│
          └─────────────────┬──────────────┘
                            │
                            v
         ┌─────────────────────────────────┐
         │    Select Best-Supported Model  │
         │     + Infer Underdetermined     │
         └─────────────────┬───────────────┘
                           │
                           v
           ┌────────────────────────────────┐
           │        Construct Output        │
           │  Propositions / Variables /    │
           │  Models / Evaluation /         │
           │  Conclusion                    │
           └────────────────────────────────┘
```

This is the operational flow that LOGIC_CONSULT is expected to follow for every input.
