# Decisões Técnicas

| Tema        | Decisão                             | Motivo                                    |
| ----------- | ----------------------------------- | ----------------------------------------- |
| Framework   | Flutter (Android + Windows)         | Código único                              |
| Estado      | Riverpod                            | Testável, separa lógica da UI             |
| Banco local | Drift (SQLite)                      | Funciona em Android e Windows             |
| Navegação   | go_router                           | Rotas declarativas, suporte desktop       |
| Gráficos    | fl_chart                            | Multiplataforma                           |
| Exportação  | pacotes `pdf` e `csv`               | Relatórios                                |
| IDs         | UUID v4 no cliente                  | Permite criar offline sem conflito        |
| Dinheiro    | Inteiro em centavos                 | Evita erro de ponto flutuante             |
| Exclusão    | Lógica                              | Necessária para propagar na sincronização |
| Conflitos   | Last-write-wins por `atualizado_em` | Simples; uso por um único usuário         |
| Arquitetura | Offline-first, por feature          | Banco local é a fonte primária            |

## Banco local e geração Drift

- Escolha do pacote: `drift` + `sqlite3_flutter_libs` + `path_provider` + `path`.
- Essa combinação foi preferida em relação a `drift_flutter` porque oferece melhor compatibilidade com execução em Windows e Android sem depender de um wrapper específico do framework, mantendo o SQLite nativo da plataforma.
- Os arquivos gerados pelo Drift (`*.g.dart`) ficam versionados no repositório para manter a compilação previsível em máquinas de desenvolvimento e CI, sem ignorá-los no `.gitignore`.

## Backend e sincronização (PENDENTE de prova de conceito)

- Candidato principal: **Supabase** (Auth + PostgreSQL + API REST), por funcionar em Android e Windows.
- Firebase: suporte oficial a Windows em Flutter é limitado (Firestore em especial); só considerar se a prova de conceito confirmar compatibilidade.
- Estratégia de sync: enviar registros com `sincronizado = false`, receber alterações com `atualizado_em` maior que a última sincronização, aplicar last-write-wins.
- Segurança: Row Level Security isolando dados por `usuario_id`.
- A prova de conceito deve ser feita ANTES da Fase 3.

## Estratégia por fases

1. MVP local (Android, offline)
2. Financeiro completo
3. Nuvem e Windows
4. Refinamentos
