# Exemplo
ALTO app/routes.py:88 — `/nota/<id>` não confere o dono; o usuário B lê a nota de A.
Correção: `Nota.query.filter_by(id=id, user_id=current_user.id).first_or_404()`.
Prova: teste pytest com dois usuários retornando 404.
