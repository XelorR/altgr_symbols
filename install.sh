#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
Linux)
  # xkalamine must be on PATH (installed via pip/pipx)
  if ! command -v xkalamine >/dev/null 2>&1; then
    echo "xkalamine not found in PATH. Install with: pipx install kalamine" >&2
    exit 1
  fi
  sudo env "PATH=$PATH" xkalamine install "$SCRIPT_DIR/us.toml"
  sudo env "PATH=$PATH" xkalamine install "$SCRIPT_DIR/ru.toml"
  ;;

Darwin)
  # macOS: copy prebuilt .keylayout files instead of using xkalamine
  DEST="$HOME/Library/Keyboard Layouts"
  mkdir -p "$DEST"
  cp "$SCRIPT_DIR/dist/us-sym.keylayout" "$DEST/"
  cp "$SCRIPT_DIR/dist/ru-sym.keylayout" "$DEST/"
  echo "Layouts copied. Log out (or reboot), then add them via"
  echo "System Settings -> Keyboard -> Input Sources -> '+'."
  ;;

*)
  echo "Unsupported OS: $(uname -s)" >&2
  exit 1
  ;;
esac
