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
