# agent-skills

Fonte única das minhas skills de IA (formato aberto **SKILL.md**: frontmatter `name` + `description`, pasta `references/`). Funcionam em Claude Code, Codex CLI, Qwen Code, Antigravity, Copilot CLI e qualquer ferramenta compatível com Agent Skills.

## Skills

| Skill | Para quê |
|---|---|
| `debug-godot-pc` | Erros de Godot/GDScript e diagnóstico de PC/macOS — reproduzir, isolar, corrigir o mínimo, provar |
| `revisao-fatia` | Revisão de fim de fatia + refatoração segura (GDScript, sinais, cenas, performance) |
| `planejar-fatia` | Complemento do `game-dev-fatias` para propor fatias (não o substitui) |
| `docs-commit-devlog` | Commit, changelog, devlog, PR e comentários de GDScript |
| `testes-godot` | Testes com GUT ou GdUnit4 |
| `seguranca-web-flask` | Auditoria de segurança para Flask/web |
| `api-web-flask` | Design de API para Flask/web |

Adaptadas a partir das skills do Kit IA Dev.

## Instalar

Repositório público: não precisa de login no GitHub.

```sh
git clone https://github.com/Lvc1o/agent-skills-public.git ~/.agents/skills-repo
sh ~/.agents/skills-repo/install.sh            # mostra o plano (nada muda)
sh ~/.agents/skills-repo/install.sh --apply    # instala
```

O instalador:
- cria links em `~/.agents/skills/` e nas pastas de skills das ferramentas que **existem** na máquina: `~/.claude/skills`, `~/.qwen/skills`, `~/.gemini/config/skills`, `~/.copilot/skills`;
- não duplica no Codex (ele já lê `~/.agents/skills`); use `--codex` para forçar;
- nunca sobrescreve arquivo/pasta que não seja link — pula e avisa;
- `--move-kit` remove/guarda em `~/.agents/backups/<data>/` as 9 skills antigas `kit-*` substituídas;
- `--uninstall --apply` remove só os links criados por ele.

## Atualizar

```sh
sh ~/.agents/skills-repo/update.sh
```

Para editar uma skill: altere `skills/<nome>/` neste repo, faça commit/push, e rode `update.sh` em cada máquina.
