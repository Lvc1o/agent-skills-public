# Exemplo
Sintoma: "Invalid get index 'position' (on base: 'null instance')" em player.gd:42.
Evidência: `@onready var arma = $Mao/Arma`; a fatia 7 renomeou `Mao` para `MaoDireita`.
INTENT: hoje quebra ao atirar; o pedido espera atirar; o doc da fatia 7 diz que o nó virou MaoDireita.
Correção: caminho atualizado (ou `%Arma` com nome único).
Prova: headless na cópia isolada, log `TIRO OK` 3x, sem erro no Output.
