#!/usr/bin/env bash
set -euo pipefail

if ! command -v fd >/dev/null 2>&1; then
  echo "fd is not installed." >&2
  exit 1
fi

mapfile -t dirs < <(fd -H -I --prune -t d '^\.direnv$' "$HOME")

if [ "${#dirs[@]}" -eq 0 ]; then
  echo "No .direnv directories found under: $HOME"
  exit 0
fi

echo "Found ${#dirs[@]} project(s) with a .direnv GC root:"
printf '  %s\n' "${dirs[@]}"
echo

read -r -p "Delete all of these and their GC roots? [y/N] " reply
case "$reply" in
  [yY]|[yY][eE][sS]) ;;
  *) echo "Aborted."; exit 0 ;;
esac

for d in "${dirs[@]}"; do
  rm -rf -- "$d"
done
echo "Removed ${#dirs[@]} .direnv directories."
