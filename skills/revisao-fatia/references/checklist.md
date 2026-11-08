# Checklist de fim de fatia
## Corretude
- [ ] Caminhos de nó estáveis (`%Unico`, `@export var x: Node`).
- [ ] `is_instance_valid` depois de `queue_free`; `await` seguro.
- [ ] Tipagem estática em variáveis e funções públicas.
## Sinais
- [ ] Conectados uma vez; desconectados quando o nó sai; assinatura certa.
- [ ] "Chamar para baixo, sinalizar para cima" — sem `get_parent().get_parent()`.
## Cenas e recursos
- [ ] Cena autocontida e reutilizável; sem dependência de caminho absoluto.
- [ ] Recursos compartilhados duplicados quando precisam ser únicos.
- [ ] `.tscn` sem nós órfãos nem UIDs quebrados.
## Performance
- [ ] Nada pesado em `_process` sem necessidade (sinais, Timer, `set_process(false)`).
- [ ] Sem `get_node` ou `load` por frame (`preload`, cache).
- [ ] Pooling para muitos projéteis/partículas; `VisibleOnScreenNotifier`.
## Legibilidade
- [ ] Nomes claros em pt ou en, consistentes com o projeto; funções curtas; sem código morto.
