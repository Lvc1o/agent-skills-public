# Exemplo de saída
Veredito: fatia 12 pode fechar depois de 1 bloqueio.
- BLOQUEIA inimigo.gd:58 — `died` é conectado em `_process` (conecta a cada frame).
- SUGERE hud.gd:20 — `get_node("../../UI/Vida")`; usar `%Vida`.
- DETALHE spawner.gd:5 — `load()` dentro do loop; usar `preload`.
