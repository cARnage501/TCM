# LOGIC_CONSULT Pseudocode

This pseudocode describes the reasoning loop for the LOGIC_CONSULT engine.

```pseudo
function LOGIC_CONSULT(input_text):

    # 1. Extract propositions
    propositions = extract_propositions(input_text)
    # propositions is a list of strings: ["P1: ...", "P2: ...", ...]

    # 2. Identify variables / unknowns
    variables = identify_unknowns(input_text, propositions)
    # variables is a list of strings: ["...", "..."]

    # 3. Generate candidate models
    models = generate_models(propositions, variables)
    # models is a list of model objects: [M1, M2, ...]
    # each model has:
    #   - id (e.g., "M1")
    #   - description (string)
    #   - support_evidence (subset of propositions)
    #   - conflicts (subset of propositions or derived contradictions)

    # 4. Internally assign weights
    for model in models:
        model.weight = assess_support(model, propositions, variables)
        # weight categories: STRONG, MODERATE, WEAK, IMPOSSIBLE

    # 5. Evaluate models
    evaluation_lines = []
    for model in models:
        line = describe_model_evaluation(model)
        evaluation_lines.append(line)

    # 6. Select best-supported model(s)
    best_models = select_best_models(models)
    # typically 1 model; may handle ties

    # 7. Determine underdetermined aspects
    unresolved = infer_underdetermined_aspects(models, variables)

    # 8. Construct textual output
    output = ""

    output += "### Propositions\n"
    for p in propositions:
        output += "- " + p + "\n"

    output += "\n### Variables / Unknowns\n"
    if variables is empty:
        output += "- (none identified)\n"
    else:
        for v in variables:
            output += "- " + v + "\n"

    output += "\n### Candidate Models\n"
    for model in models:
        output += "- " + model.id + ": " + model.description + "\n"

    output += "\n### Evaluation\n"
    for line in evaluation_lines:
            output += "- " + line + "\n"

    output += "\n### Conclusion\n"
    if best_models is empty:
        output += "- No non-trivial model is clearly supported by the given information.\n"
    else:
        primary = best_models[0]
        output += "- Best-supported model: " + primary.id + ".\n"
        output += "- Summary: " + primary.description + "\n"

    if unresolved is not empty:
        output += "- Still underdetermined: " + join(unresolved, "; ") + "\n"
        output += "- Additional information needed: " + describe_needed_info(unresolved) + "\n"

    return output
```

Notes:

- `extract_propositions` is responsible for turning fuzzy text into atomic statements.
- `identify_unknowns` scans for missing definitions, quantities, or conditions.
- `generate_models` is abductive: it proposes different ways the propositions could fit together.
- `assess_support` evaluates each model against the propositions and unknowns.
- `select_best_models` chooses the logically strongest interpretations.
- `infer_underdetermined_aspects` explains why the result is limited and what would improve it.

This loop is conceptually what the LLM is prompted to emulate.
