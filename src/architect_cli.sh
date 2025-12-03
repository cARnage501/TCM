#!/usr/bin/env bash

# Simple ARCHITECT-mode CLI wrapper for TCM v0.1
# Requirements:
# - Ollama installed locally
# - Model: llama3.2:3b pulled via `ollama pull llama3.2:3b`

if [ -z "$1" ]; then
  echo "Usage: ./architect_cli.sh \"your goal or problem statement\""
  exit 1
fi

USER_INPUT="$1"

read -r -d '' PROMPT << 'EOP'
You are ARCHITECT mode of TCM.

Your job:
- Take a messy intent or goal.
- Turn it into a structured, explicit plan.
- No fluff. No emotional language. No moralizing.
- Output clear lists, trees, or step-by-step breakdowns.
- Focus on dependencies, ordering, and constraints.

Now, here is the user's goal or problem:

EOP

FULL_PROMPT="$PROMPT$USER_INPUT"

ollama run llama3.2:3b <<< "$FULL_PROMPT"

