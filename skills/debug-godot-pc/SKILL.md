---
name: debug-godot-pc
description: Use quando algo quebra — erro do Godot/GDScript, cena que não abre, sinal que não dispara, "funcionava na fatia anterior", teste falhando — ou num diagnóstico de PC/macOS (lentidão, travamento, disco, rede, driver). Reproduzir, isolar a causa, corrigir o mínimo e provar.
---

# Debug — Godot/GDScript e diagnóstico de PC

Adaptado do `debug-assistant` do Kit IA Dev. Conversa em pt-BR.

## Regras invioláveis
- Nunca tocar nos saves do jogo (`user://`, pasta de saves do projeto) nem forçar o fechamento do jogo do usuário. Se precisar rodar, use uma **cópia isolada** do projeto.
- Comandos destrutivos no PC (apagar, formatar, matar processo, mexer em sistema) só com aprovação explícita.
- Até 3 ciclos de corrigir e provar. Sem vitória: parar, mostrar os outputs reais e devolver ao dono (regra do `game-dev-fatias`).

## Processo (Godot)
1. **Reproduzir**: cena, passos, versão do Godot (`godot --version`), output e Debugger. Rodar headless na cópia isolada quando der: `godot --headless --path <copia> --quit-after N`.
2. **Capturar a evidência exata**: mensagem do Output/Debugger, linha do script, stack, `print()`/`push_warning` temporários.
3. **Hipóteses ordenadas** — checar primeiro as causas comuns do Godot (ver `references/checklist.md`).
4. **Isolar**: cena mínima ou bissecção pelas fatias (`git bisect` se houver git).
5. **INTENT antes de mudar comportamento**: `INTENT: hoje faz <X>; o pedido espera <Y>; o doc diz <Z>.`
6. **Corrigir o mínimo** e **provar vivo** (log, print ou teste GUT/GdUnit4). Remover os prints temporários.
7. **Relatar**: causa raiz, correção, prova, o que ficou não verificado.

## Processo (PC/macOS)
1. Sintoma e quando começou. 2. Coleta só de leitura: `top -l 1`, `vm_stat`, `df -h`, `log show --last 10m --predicate 'eventMessage contains "error"'`, `system_profiler`. 3. Hipóteses do mais barato ao mais caro. 4. Propor a ação, esperar o ok e verificar depois.

Referências: `references/checklist.md`, `references/anti-patterns.md`, `references/examples.md`.
