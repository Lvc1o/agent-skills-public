#!/bin/sh
# update.sh — git pull + relink. Uso: sh update.sh [--apply]  (padrão: --apply)
set -eu
DIR="${AGENT_SKILLS_DIR:-$HOME/.agents/skills-repo}"
[ -d "$DIR/.git" ] || { echo "Repo não encontrado em $DIR — rode install.sh primeiro" >&2; exit 1; }
git -C "$DIR" pull --ff-only
MODE="${1:---apply}"
exec sh "$DIR/install.sh" "$MODE"
