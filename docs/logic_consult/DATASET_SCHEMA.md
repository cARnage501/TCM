# LOGIC_CONSULT Dataset Schema (for training / fine-tuning)

Reference samples: `data/logic_consult_fine_tune_examples.jsonl` and the main dataset at `data/tcm_dataset_v0.jsonl`.

The goal of this dataset is to capture many examples of how `LOGIC_CONSULT` should behave.

Each row is a JSON object with two keys:

- `input`: the raw user text (premises, descriptions, patterns, etc.)
- `output`: the full structured LOGIC_CONSULT response as a single string

## JSONL row example

```json
{
  "input": "Given A and B tend to co-occur and G sometimes follows on a rolling basis, with this limited scope of information what can you deduce about this?",
  "output": "### Propositions\n- P1: A and B tend to co-occur.\n- P2: G sometimes follows on a rolling basis.\n\n### Variables / Unknowns\n- What 'rolling basis' means operationally.\n- Magnitude or probability of 'sometimes'.\n\n### Candidate Models\n- M1: A and B are correlated but not predictive of G.\n- M2: G's occurrence is influenced by A and B's co-occurrence.\n\n### Evaluation\n- M1: weak support due to lack of connection to G.\n- M2: moderate support because the input explicitly links G with A+B.\n\n### Conclusion\n- Best-supported model: M2.\n- Underdetermined: definition of 'rolling basis'; without it the strength of inference is limited.\n"
}
```

Note: newlines in `output` are escaped as `\n` when stored in JSONL.

---

## Recommended fields (extended schema)

You may optionally expand each row to include more explicit structure, for example:

```json
{
  "input": "...",
  "propositions": [
    "P1: ...",
    "P2: ..."
  ],
  "variables": [
    "..."
  ],
  "models": [
    "M1: ...",
    "M2: ..."
  ],
  "evaluation": [
    "M1: weak support because ...",
    "M2: strong support because ..."
  ],
  "conclusion": [
    "Best-supported model: M2.",
    "Still underdetermined: ...",
    "Need X to decide between M1 and M2."
  ]
}
```

This more structured variant allows training with multiple heads or using tools that operate at the field level.

---

## Annotation guidelines

1. **Faithfulness**
   - Ensure propositions accurately reflect the input text.
   - Do not inject extra facts that are not clearly implied.

2. **Atomicity**
   - Keep propositions as atomic as possible.
   - Split compound statements into P1, P2, etc.

3. **Models**
   - Aim for 2–4 plausible models.
   - Avoid trivial models that restate a single proposition.

4. **Evaluation**
   - Must reference specific propositions or models by label.
   - Must explain *why* a model is strong/weak/impossible.

5. **Conclusion**
   - Must clearly choose a winner (or explicitly say “no nontrivial conclusion”).
   - Must list specific unknowns that prevent a stronger conclusion.
