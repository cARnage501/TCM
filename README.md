# TCM

TCM is a small, local reasoning engine built on an open-source base model (Ollama, `llama3.2:3b`). It is designed to run locally, stay deterministic, and produce structured reasoning instead of narrative or advice.

## What’s in v0.1

- Core local model definition (`Modelfile`) and build script (`build_tcm.sh`).
- CLI entrypoint (`src/architect_cli.sh`) that forwards input to the **LOGIC_CONSULT** model (logical auditor).
- Legacy **ARCHITECT** prompt retained for structured planning reference.
- Datasets and docs that describe modes, behavior, and next steps.

No tools, no memory, no remote calls — just one local model routed through a thin script.

## Run it

```bash
# Build the model (pull base + create tcm:v0.1)
./build_tcm.sh

# Run the LOGIC_CONSULT auditor on an input
./src/architect_cli.sh "Given A and B co-occur and G sometimes follows, what can you infer?"
```

The LOGIC_CONSULT protocol (propositions → unknowns → models → evaluation → conclusion) is baked into the model’s system prompt; the CLI just forwards your input to `ollama run tcm:v0.1`.

## Repo map

- `Modelfile` — base model and system prompt (LOGIC_CONSULT auditor).
- `src/architect_cli.sh` — CLI wrapper that forwards input to the model.
- `docs/logic_consult/` — debrief, mode spec, pseudocode, flow, dataset schema, examples.
- `docs/ARCHITECT_MODE.md` — legacy ARCHITECT lens for planning.
- `docs/AGENTS.md` — overview of available modes.
- `docs/CORE_STRUCTURE.md` — overall TCM architecture and modes.
- `docs/MODEL_NOTES.md` — runtime/model choices.
- `data/` — training data (`tcm_dataset_v0.jsonl`, `logic_consult_fine_tune_examples.jsonl`).

## Next steps

See `docs/logic_consult/DEBRIEF.md` for the continuity plan: expose weight tables, add symbolic pattern parsing, add abductive reasoning, and strengthen consistency checks.
