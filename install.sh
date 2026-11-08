#!/bin/sh
# install.sh — instala/atualiza as skills deste repositório em todas as IAs presentes na máquina.
# Uso: sh install.sh [--dry-run|--apply] [--uninstall] [--move-kit] [--codex]
# Padrão: --dry-run (só mostra o plano). POSIX sh; macOS e Ubuntu.
set -eu

REPO_URL="${AGENT_SKILLS_REPO:-https://github.com/Lvc1o/agent-skills-public.git}"
REPO_DIR="${AGENT_SKILLS_DIR:-$HOME/.agents/skills-repo}"
HUB="$HOME/.agents/skills"
BACKUP="$HOME/.agents/backups/$(date +%Y%m%d-%H%M%S)"
KIT_OLD="kit-debug-assistant kit-code-review kit-refactor-guide kit-feature-planner kit-doc-writer kit-pr-writer kit-test-generator kit-security-audit kit-api-design"

MODE=dry; ACTION=install; MOVE_KIT=0; FORCE_CODEX=0
for a in "$@"; do
  case "$a" in
    --dry-run) MODE=dry ;;
    --apply) MODE=apply ;;
    --uninstall) ACTION=uninstall ;;
    --move-kit) MOVE_KIT=1 ;;
    --codex) FORCE_CODEX=1 ;;
    -h|--help) sed -n '2,4p' "$0"; exit 0 ;;
    *) echo "opção desconhecida: $a" >&2; exit 2 ;;
  esac
done

say() { printf '%s\n' "$*"; }
run() { if [ "$MODE" = apply ]; then "$@"; else say "  [plano] $*"; fi; }
warn() { printf 'AVISO: %s\n' "$*" >&2; }
backup_mv() { run mkdir -p "$BACKUP"; run mv "$1" "$BACKUP/"; }

# 1) repositório local
SELF_DIR=$(cd "$(dirname "$0")" && pwd)
if [ -d "$SELF_DIR/skills" ] && [ -d "$SELF_DIR/.git" -o "${AGENT_SKILLS_USE_SELF:-0}" = 1 ]; then
  SRC="$SELF_DIR"
else
  SRC="$REPO_DIR"
fi
if [ "$ACTION" = install ]; then
  if [ "$SRC" = "$REPO_DIR" ]; then
    if [ -d "$REPO_DIR/.git" ]; then say "Atualizando $REPO_DIR"; run git -C "$REPO_DIR" pull --ff-only || warn "git pull falhou; usando a cópia local"
    else say "Clonando $REPO_URL -> $REPO_DIR"; run mkdir -p "$(dirname "$REPO_DIR")"; run git clone "$REPO_URL" "$REPO_DIR"; fi
  fi
fi

# 2) destinos: hub + pastas de ferramentas que EXISTEM
TARGETS="$HUB"
[ -d "$HOME/.claude" ] && TARGETS="$TARGETS $HOME/.claude/skills"
[ -d "$HOME/.qwen" ] && TARGETS="$TARGETS $HOME/.qwen/skills"
[ -d "$HOME/.gemini/config" ] && TARGETS="$TARGETS $HOME/.gemini/config/skills"
[ -d "$HOME/.copilot" ] && TARGETS="$TARGETS $HOME/.copilot/skills"
# Codex lê ~/.agents/skills nativamente; só duplica com --codex
[ "$FORCE_CODEX" = 1 ] && [ -d "$HOME/.codex" ] && TARGETS="$TARGETS $HOME/.codex/skills"

if [ -d "$SRC/skills" ]; then SKILLS=$(cd "$SRC/skills" && ls -1)
else SKILLS="debug-godot-pc revisao-fatia planejar-fatia docs-commit-devlog testes-godot seguranca-web-flask api-web-flask"; fi

say "Modo: $MODE | Ação: $ACTION | Fonte: $SRC/skills"
say "Destinos: $TARGETS"

for T in $TARGETS; do
  [ "$ACTION" = install ] && [ ! -d "$T" ] && run mkdir -p "$T"
  for n in $SKILLS; do
    dest="$T/$n"; want="$SRC/skills/$n"
    if [ "$ACTION" = uninstall ]; then
      if [ -L "$dest" ]; then say "remover link $dest"; run rm "$dest"
      elif [ -e "$dest" ]; then warn "$dest não é link; deixado intacto"; fi
      continue
    fi
    if [ -L "$dest" ]; then
      cur=$(readlink "$dest")
      if [ "$cur" = "$want" ]; then say "ok $dest"; continue; fi
      say "relink $dest ($cur -> $want)"; run rm "$dest"; run ln -s "$want" "$dest"
    elif [ -e "$dest" ]; then
      warn "$dest existe e não é link — pulado (mova manualmente se quiser substituir)"
    else
      say "link $dest -> $want"; run ln -s "$want" "$dest"
    fi
  done
  if [ "$MOVE_KIT" = 1 ] && [ "$ACTION" = install ]; then
    for k in $KIT_OLD; do
      [ -e "$T/$k" ] || [ -L "$T/$k" ] || continue
      if [ -L "$T/$k" ]; then say "remover link antigo $T/$k"; run rm "$T/$k"
      else say "backup $T/$k -> $BACKUP/"; backup_mv "$T/$k"; fi
    done
  fi
done

[ "$MODE" = dry ] && say "Nada foi alterado. Rode de novo com --apply para executar."
exit 0
