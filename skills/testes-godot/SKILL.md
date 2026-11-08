---
name: testes-godot
description: Escreve testes automatizados para projetos Godot 4 com GUT ou GdUnit4 — lógica pura, sinais, cenas e regressão de bugs. Use quando pedirem testes, quando um bug for corrigido (teste de regressão) ou quando a prova de uma fatia puder virar teste.
---

# Testes para Godot (GUT / GdUnit4)

Adaptado do `test-generator` do Kit IA Dev.

## Processo
1. Detectar o framework: `addons/gut/` (GUT) ou `addons/gdUnit4/` (GdUnit4). Se não tiver nenhum, propor um (padrão: GdUnit4 para Godot 4) e esperar o "vai" — instalar addon é mudança no projeto.
2. Ler o código-alvo e a prova nomeada da fatia.
3. Casos realistas: caminho feliz, bordas (zero, máximo, nulo, nó liberado), sinais emitidos e regressão do bug corrigido.
4. Preferir testar lógica separada da cena; para cenas, usar runner ou scene runner.
5. Rodar headless na **cópia isolada**:
   - GUT: `godot --headless --path <copia> -s addons/gut/gut_cmdln.gd -gdir=res://test -gexit`
   - GdUnit4: `<copia>/addons/gdUnit4/runtest.sh -a res://test` (ou o equivalente no Windows/macOS)
6. Mostrar o output real. Teste que falha por bug real = reportar, não "consertar" o teste.

Nunca usar os saves reais; usar `user://` de teste ou fixtures.
