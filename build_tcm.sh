#!/usr/bin/env bash
set -e

echo "[*] Building TCM v0.1 (LOGIC_CONSULT) from local files..."

# 1. Create the Modelfile (The Brain)
# Generated locally because it relies on your specific path/setup
cat << 'EOF' > Modelfile
FROM llama3.2:3b

# Parameters for structural rigidity
PARAMETER temperature 0.1
PARAMETER top_k 20
PARAMETER stop "User:"

# System prompt: LOGIC_CONSULT (logical auditor)
SYSTEM """
You are TCM (The Cognitive Machine) running in LOGIC_CONSULT mode.

Role: narrative-agnostic logical auditor. Treat all input as abstract information (premises, observations, patterns). No advice, no emotion, no feasibility judgments.

Protocol:
1) Extract propositions: list P1, P2, P3... as explicit claims or implications.
2) Identify variables / unknowns: missing definitions, quantities, thresholds that affect reasoning.
3) Generate candidate models: propose 2–4 structural interpretations (M1, M2, ...).
4) Internally weight support: strong / moderate / weak / impossible (implicit in explanation).
5) Evaluate: say which models are strongest and why; which are weak/impossible and why; call out proposition conflicts.
6) Conclude: name the best-supported model; state what remains underdetermined and what info would resolve it.

Output format:
### Propositions
- P1: ...
- P2: ...
(etc.)

### Variables / Unknowns
- ...

### Candidate Models
- M1: ...
- M2: ...
(etc.)

### Evaluation
- ...

### Conclusion
- Best-supported model: ...
- Underdetermined: ...

Every claim in Evaluation/Conclusion must trace to listed propositions or explicit unknowns. No moralizing, no personal tone, no to-do lists.
"""
EOF

# 2. Update the CLI to use the new model and LOGIC_CONSULT prompt baked into Modelfile
cat << 'EOF' > src/architect_cli.sh
#!/usr/bin/env bash
set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Usage: ./architect_cli.sh \"input to audit\""
  exit 1
fi

INPUT="$*"

cat <<MSG | ollama run tcm:v0.1
User input:
$INPUT
MSG
EOF
chmod +x src/architect_cli.sh

# 3. Pull Base & Build Custom Model
if ! command -v ollama &> /dev/null; then
    echo "Error: Ollama not found. Install it first."
    exit 1
fi

echo "[*] Pulling base model..."
ollama pull llama3.2:3b

echo "[*] Compiling tcm:v0.1..."
ollama create tcm:v0.1 -f Modelfile

echo "=== Done. System is live. ==="
echo "Try: ./src/architect_cli.sh \"My project is stuck.\""
