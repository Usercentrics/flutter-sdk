#!/usr/bin/env bash
# Measures pub.dev archive size for the Flutter SDK and optionally compares
# against the last published version from the pub.dev API.
#
# Usage:
#   ./scripts/measure_binary_sizes.sh                     # measure only
#   ./scripts/measure_binary_sizes.sh --compare           # measure + compare vs published
#   ./scripts/measure_binary_sizes.sh --output out.json   # also write JSON to file
#   ./scripts/measure_binary_sizes.sh --compare --output out.json
#
# Run this after flutter pub publish (the script fetches the archive from pub.dev).
# Requires: flutter, python3, curl

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

COMPARE=false
OUTPUT_FILE=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --compare) COMPARE=true; shift ;;
    --output)  OUTPUT_FILE="$2"; shift 2 ;;
    *) echo "Unknown argument: $1" >&2; exit 1 ;;
  esac
done

# ── helpers ───────────────────────────────────────────────────────────────────

warn() { echo "⚠️  $*" >&2; }

file_bytes() {
  [[ -f "$1" ]] && wc -c < "$1" | tr -d ' ' || echo "null"
}

format_bytes() {
  local bytes="$1"
  [[ "$bytes" == "null" ]] && { echo "not found"; return; }
  local kb=$(( bytes / 1024 ))
  if (( kb >= 1024 )); then
    printf "%.2f MB" "$(echo "scale=2; $kb / 1024" | bc)"
  else
    printf "%d KB" "$kb"
  fi
}

print_row() {
  local label="$1" cur="$2" pub="${3:-}"
  local cur_str delta_str=""
  cur_str="$(format_bytes "$cur")"
  if [[ -n "$pub" ]]; then
    local pub_str
    pub_str="$(format_bytes "$pub")"
    if [[ "$cur" != "null" && "$pub" != "null" ]]; then
      delta_str=$(python3 -c "
c, p = $cur, $pub
diff = c - p
sign = '+' if diff >= 0 else ''
pct = (diff / p * 100) if p else 0
if abs(diff) >= 1048576:
    print(f'{sign}{diff/1048576:.2f} MB ({sign}{pct:.1f}%)')
elif abs(diff) >= 1024:
    print(f'{sign}{diff//1024} KB ({sign}{pct:.1f}%)')
else:
    print(f'{sign}{diff} B ({sign}{pct:.1f}%)')
")
    fi
    printf "  %-40s  %-14s  %-14s  %s\n" "$label" "$cur_str" "$pub_str" "$delta_str"
  else
    printf "  %-40s  %s\n" "$label" "$cur_str"
  fi
}

# ── version + package name ────────────────────────────────────────────────────

VERSION=$(python3 -c "
import re, sys
for line in open('$REPO_ROOT/pubspec.yaml'):
    m = re.match(r'^version:\s*(\S+)', line)
    if m:
        print(m.group(1)); sys.exit(0)
print('unknown')
" 2>/dev/null || echo "unknown")
PACKAGE_NAME=$(python3 -c "
import re, sys
for line in open('$REPO_ROOT/pubspec.yaml'):
    m = re.match(r'^name:\s*(\S+)', line)
    if m:
        print(m.group(1)); sys.exit(0)
print('usercentrics_sdk')
" 2>/dev/null || echo "usercentrics_sdk")
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# ── fetch current version archive from pub.dev ────────────────────────────────

TMPDIR_WORK=$(mktemp -d)
trap 'rm -rf "$TMPDIR_WORK"' EXIT

ARCHIVE_BYTES="null"

echo "Fetching ${PACKAGE_NAME} v${VERSION} archive from pub.dev..." >&2

# pub.dev may take a moment to index after publish — retry up to 12 times (2 min)
ARCHIVE_URL=""
for i in $(seq 1 12); do
  ARCHIVE_URL=$(curl -sf "https://pub.dev/api/packages/${PACKAGE_NAME}/versions/${VERSION}" \
    | python3 -c "import sys,json; print(json.load(sys.stdin).get('archive_url',''))" 2>/dev/null || true)
  [[ -n "$ARCHIVE_URL" ]] && break
  echo "  Waiting for pub.dev to index v${VERSION}... (attempt $i/12)" >&2
  sleep 10
done

if [[ -n "$ARCHIVE_URL" ]]; then
  curl -sf -L -o "$TMPDIR_WORK/archive.tar.gz" "$ARCHIVE_URL" 2>/dev/null \
    && ARCHIVE_BYTES=$(file_bytes "$TMPDIR_WORK/archive.tar.gz") \
    || warn "Could not download pub.dev archive"
else
  warn "pub.dev did not index v${VERSION} within 2 minutes — falling back to dry-run estimate"
  # Fall back: flutter pub publish --dry-run output contains a size line
  cd "$REPO_ROOT"
  DRY_RUN_OUT=$(flutter pub publish --dry-run 2>&1 || true)
  # Parse lines like "Package size: 31.1 KB (72.2 KB unpacked)" or
  # "Your package is 31 files, which would be published (1.5 MB)"
  ARCHIVE_BYTES=$(echo "$DRY_RUN_OUT" | python3 -c "
import sys, re
text = sys.stdin.read()
# Match sizes in MB or KB
for pattern in [
    r'[Pp]ackage size[:\s]+([0-9.]+)\s*(MB|KB)',
    r'([0-9.]+)\s*(MB|KB)\s+uncompressed',
    r'([0-9.]+)\s*(MB|KB)',
]:
    m = re.search(pattern, text)
    if m:
        size = float(m.group(1))
        unit = m.group(2)
        print(int(size * 1048576 if unit == 'MB' else size * 1024))
        sys.exit(0)
print('null')
" 2>/dev/null || echo "null")
fi

# ── fetch published artifact size ─────────────────────────────────────────────

PUB_VERSION=""
PUB_ARCHIVE_BYTES="null"

if [[ "$COMPARE" == true ]]; then
  echo "Fetching published version list from pub.dev..." >&2

  VERSIONS_DATA=$(curl -sf "https://pub.dev/api/packages/${PACKAGE_NAME}" 2>/dev/null || true)
  if [[ -n "$VERSIONS_DATA" ]]; then
    PUB_VERSION=$(echo "$VERSIONS_DATA" | python3 -c "
import sys, json, re
d = json.load(sys.stdin)
cur = '$VERSION'
all_versions = [v['version'] for v in d.get('versions', [])]
# Keep only stable releases (no pre-release suffix like -rc, -beta)
stable = [v for v in all_versions if re.match(r'^\d+\.\d+\.\d+$', v)]
try:
    versions_sorted = sorted(stable, key=lambda v: [int(x) for x in v.split('.')])
    prev = None
    for v in versions_sorted:
        if v == cur:
            break
        prev = v
    print(prev or '')
except Exception:
    print('')
" 2>/dev/null || true)

    if [[ -n "$PUB_VERSION" ]]; then
      echo "Downloading published v${PUB_VERSION} archive for comparison..." >&2
      PUB_ARCHIVE_URL=$(curl -sf "https://pub.dev/api/packages/${PACKAGE_NAME}/versions/${PUB_VERSION}" \
        | python3 -c "import sys,json; print(json.load(sys.stdin).get('archive_url',''))" 2>/dev/null || true)
      if [[ -n "$PUB_ARCHIVE_URL" ]]; then
        curl -sf -L -o "$TMPDIR_WORK/pub-archive.tar.gz" "$PUB_ARCHIVE_URL" 2>/dev/null \
          && PUB_ARCHIVE_BYTES=$(file_bytes "$TMPDIR_WORK/pub-archive.tar.gz") \
          || warn "Could not download published archive"
      fi
    else
      warn "Could not determine previous published version — skipping comparison"
      COMPARE=false
    fi
  else
    warn "Could not fetch pub.dev package data — skipping comparison"
    COMPARE=false
  fi
fi

# ── print summary ─────────────────────────────────────────────────────────────

echo ""
if [[ "$COMPARE" == true ]]; then
  echo "Binary Sizes — v${VERSION} vs published v${PUB_VERSION} — ${TIMESTAMP}"
  echo ""
  printf "  %-40s  %-14s  %-14s  %s\n" "" "current" "published" "delta"
  printf "  %-40s  %-14s  %-14s  %s\n" "────────────────────────────────────────" "──────────────" "──────────────" "──────────────────"
else
  echo "Binary Sizes — v${VERSION} — ${TIMESTAMP}"
  echo ""
fi

echo "pub.dev (${PACKAGE_NAME})"
print_row "archive (.tar.gz)" "$ARCHIVE_BYTES" ${COMPARE:+"$PUB_ARCHIVE_BYTES"}
echo ""

# ── json output ───────────────────────────────────────────────────────────────

JSON=$(python3 - <<PYEOF
import json

def v(b):
    s = str(b).strip()
    return None if s == "null" else int(s)

def entry(cur, pub=None):
    d = {"bytes": v(cur)}
    if pub is not None:
        d["published_bytes"] = v(pub)
        if d["bytes"] is not None and d["published_bytes"] is not None:
            d["delta_bytes"] = d["bytes"] - d["published_bytes"]
    return d

compare = "$COMPARE" == "true"

data = {
    "version": "$VERSION",
    "timestamp": "$TIMESTAMP",
    "published_version": "$PUB_VERSION" if compare else None,
    "pub": {
        "archive": entry("$ARCHIVE_BYTES", "$PUB_ARCHIVE_BYTES" if compare else None),
    },
}

print(json.dumps(data, indent=2))
PYEOF
)

if [[ -n "$OUTPUT_FILE" ]]; then
  echo "$JSON" > "$OUTPUT_FILE"
  echo "JSON written to: $OUTPUT_FILE" >&2
else
  echo "$JSON"
fi
