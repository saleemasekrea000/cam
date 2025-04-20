#!/usr/bin/env bash
# SPDX-FileCopyrightText: Copyright (c) 2021-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

set -euo pipefail

TARGET_DIR="."

MIN_CONF=90

OUTFILE="metrics/vulture_report.txt"

echo "Scanning Python dead code in ${TARGET_DIR} (confidence ≥ ${MIN_CONF})..."
vulture "${TARGET_DIR}" --min-confidence ${MIN_CONF} > "${OUTFILE}"

echo "Done. See ${OUTFILE} for a list of unused symbols."
