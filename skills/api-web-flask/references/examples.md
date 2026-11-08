# Exemplo
POST /api/v1/notas  {"titulo": "..."} -> 201 Location: /api/v1/notas/42
GET /api/v1/notas?pagina=2&limite=20 -> 200 {"itens": [...], "pagina": 2, "total": 57}
