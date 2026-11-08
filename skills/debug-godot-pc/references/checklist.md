# Checklist de causas comuns — Godot 4
- [ ] `null` em `@onready`/`get_node`: caminho do nó mudou, nó renomeado ou a cena instanciada não tem o filho.
- [ ] Sinal não conectado, conectado duas vezes ou com assinatura errada (`connect` + `is_connected`).
- [ ] Ordem de `_ready` (filhos antes do pai) e `await` sobre um nó que já saiu da árvore.
- [ ] `queue_free` e acesso depois (`is_instance_valid`).
- [ ] Física em `_process` em vez de `_physics_process`; delta ignorado.
- [ ] Layers e masks de colisão; `monitoring`/`monitorable`.
- [ ] Autoload ausente ou na ordem errada em Project Settings.
- [ ] Recurso compartilhado sem `resource_local_to_scene`/`duplicate()`.
- [ ] Tipagem: `Variant` escondendo `int` vs `float`; `:=` inferindo errado.
- [ ] Export: preset, filtros de recursos, `res://` vs `user://`.
- [ ] Diferença editor × export × headless.
# PC
- [ ] Disco cheio, swap alto, processo em loop, atualização pendente, extensão ou kext, rede/DNS.
