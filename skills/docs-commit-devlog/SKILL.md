---
name: docs-commit-devlog
description: Escreve mensagem de commit, changelog, devlog da fatia, README e comentários de GDScript, em pt-BR, a partir do diff real. Use ao registrar ou fechar uma fatia, pedir "commit", "changelog", "devlog", "documenta isso", ou preparar PR quando houver Git ou GitHub.
---

# Docs, commit e devlog

Une `doc-writer` e `pr-writer` do Kit IA Dev.

## Entradas
Diff real (`git diff --staged` ou arquivos tocados), linha da fatia na fonte de verdade e a prova observada.

## Saídas (escolher conforme o pedido)
- **Commit** (Conventional Commits, em pt-BR): `feat(player): dash com cooldown (fatia 14)`. Corpo: o quê, por quê, prova.
- **Changelog**: seções Adicionado / Mudado / Corrigido, por versão ou fatia.
- **Devlog**: 5–10 linhas para humanos — o que dá para ver, o que foi difícil, print, próxima fatia.
- **PR** (se usar GitHub): título = commit; corpo com Resumo, Mudanças, Como testar, Prova, Riscos.
- **Comentários de GDScript**: `##` doc-comments em funções públicas e `@export`; comentar o porquê, não o quê.

## Regras
- Nunca inventar o que não está no diff ou na prova.
- Segredos: citar o nome da variável, nunca o valor.
- Não fazer commit nem push sem pedido; entregar o texto.
