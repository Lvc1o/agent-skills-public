---
name: seguranca-web-flask
description: Auditoria de segurança para projetos web/Flask (e APIs do jogo, se houver backend ou multiplayer) — login, sessões, formulários, upload, banco, segredos, dados pessoais. Use ao mexer nessas áreas ou quando perguntarem "isso é seguro?". Não se aplica a gameplay local.
---

# Auditoria de segurança — Flask/web

Adaptado do `security-audit` do Kit IA Dev.

## Processo
1. Mapear: rotas, auth, dados sensíveis (PII, senhas, tokens), limites de confiança e onde ficam os segredos.
2. Checar contra `references/checklist.md` com caminho real de ataque. Nada de achado teórico sem rota.
3. Classificar **Crítico / Alto / Médio / Baixo** com `arquivo:linha`, impacto e correção.
4. Corrigir só com "vai"; Crítico pode ser proposto como fatia imediata.
5. Provar a correção (teste com pytest/requests ou curl local).

Segredos: nunca imprimir valores. Não rodar scanners ou ataques contra sistemas de terceiros.
