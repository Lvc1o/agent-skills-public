---
name: api-web-flask
description: Projeta ou revisa endpoints de API em projetos Flask/web (ou um backend de jogo) — rotas, verbos HTTP, status, erros, paginação e versionamento, seguindo o que o projeto já usa. Use ao criar ou mudar endpoint ou ao revisar o formato de uma API.
---

# Design de API — Flask/web

Adaptado do `api-design` do Kit IA Dev.

## Processo
1. Ler as rotas existentes (blueprints) e copiar as convenções: nomes, formato de erro, auth.
2. Propor o contrato antes do código: método, rota, entrada, saída, status e erros. Esperar o "vai".
3. Regras: substantivos no plural (`/api/v1/notas`); GET seguro, PUT/DELETE idempotentes; 201+Location ao criar; 400/401/403/404/409/422 corretos; erro em JSON `{ "erro": { "codigo", "mensagem" } }`; paginação `?pagina&limite`.
4. Validar a entrada (marshmallow ou pydantic) e nunca devolver stack trace.
5. Provar com teste (`app.test_client()` ou pytest).
6. Mexeu em auth ou dados pessoais? Chamar `seguranca-web-flask`.
