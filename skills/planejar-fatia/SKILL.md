---
name: planejar-fatia
description: Complemento do game-dev-fatias para a etapa PROPOR — checklist e anti-padrões para desenhar uma fatia pequena, visível e provável antes do código. Use junto com game-dev-fatias quando um pedido de gameplay ou sistema ainda não estiver fatiado. NÃO substitui o game-dev-fatias.
---

# Planejar fatia (complemento do game-dev-fatias)

O **game-dev-fatias** manda. Esta skill só ajuda a montar a proposta.

## Proposta de fatia (formato)
```
FATIA <n>: <nome curto>
Objetivo visível: <o que o usuário vai ver/jogar>
Entra: <itens>
NÃO entra: <itens>
Prova nomeada: <log "X OK" | print da tela | teste GUT/GdUnit4>
Ambiente de prova: cópia isolada em <caminho> (saves intocados)
Riscos/dúvidas: <se houver>
```
Depois: **esperar o "vai"**. Nada de código ou arte antes disso.

## Regras
- INTENT obrigatório se mudar comportamento: `INTENT: hoje faz <X>; o pedido espera <Y>; o doc diz <Z>.`
- Prova em cópia isolada do projeto; nunca tocar nos saves do dono; nunca forçar o fechamento do jogo dele.
- Fatia grande demais (mais de 1 sistema ou mais de ~1 sessão)? Quebrar em mais fatias.
- Pedido ambíguo: 1–2 perguntas curtas, não um questionário.

Ver `references/checklist.md` e `references/anti-patterns.md`.
