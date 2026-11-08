---
name: revisao-fatia
description: Revisão de código no fim de cada fatia e refatoração sem mudar comportamento — GDScript, sinais, cenas (.tscn), recursos e performance. Use antes de fechar ou registrar uma fatia, antes de commit, ou quando pedirem "revisa", "limpa", "simplifica" ou "organiza esse script".
---

# Revisão de fim de fatia + refatoração

Une `code-review` e `refactor-guide` do Kit IA Dev, adaptados ao Godot.

## Revisão (padrão ao fechar a fatia)
1. Ler o diff da fatia (`git diff` ou os arquivos tocados) e a linha da fatia na fonte de verdade.
2. Conferir o escopo: entrou só o que foi aprovado? O que "NÃO entra" ficou de fora?
3. Passar o checklist (`references/checklist.md`): corretude, sinais, cenas, performance, legibilidade.
4. Classificar os achados como **BLOQUEIA** (bug ou quebra), **SUGERE** ou **DETALHE**, sempre com `arquivo:linha`.
5. Entregar em pt-BR: veredito na 1ª frase, depois a lista. Não editar nada sem o "vai".

## Refatoração (só com "vai" e com prova)
1. Antes: prova de que o comportamento atual funciona (log, print ou teste).
2. Passos pequenos — extrair função, renomear, trocar `get_node` por `%Unico`, dividir script grande — cada um seguido de prova.
3. Nunca misturar refatoração com mudança de comportamento na mesma fatia.
4. Mesma prova antes e depois = refatoração válida.

Nunca tocar em saves nem forçar o fechamento do jogo; testar em cópia isolada.
