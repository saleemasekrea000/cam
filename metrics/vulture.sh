#!/usr/bin/env bash
# SPDX-FileCopyrightText: Copyright (c) 2021-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

set -euo pipefail

TARGET_DIR="."
MIN_CONF=60
OUTFILE="metrics/vulture_report.txt"

: "${OUTFILE}"

echo "Scanning Python dead code in ${TARGET_DIR} (confidence ≥ ${MIN_CONF})..."

python -W "ignore::SyntaxWarning" -m vulture "${TARGET_DIR}" \
  --min-confidence ${MIN_CONF} \
  --exclude 'venv/**' \
  --exclude '**/site-packages/**' \
  --exclude '**/__pycache__/**' \
  --exclude '.git/**' \
  >> "${OUTFILE}" || true  # Don't fail on finding dead code

echo "Vulture scan completed. See ${OUTFILE} for results."