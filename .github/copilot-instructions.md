# Instruções para o Copilot

## Projeto
App Flutter (Android + Windows) para controle de caronas de UM único motorista, com aba de controle financeiro e sincronização em nuvem. Offline-first.

## Documentação de referência (leia antes de implementar)
- `docs/requisitos.md`: requisitos funcionais, não funcionais e regras de negócio
- `docs/modelo-dados.md`: entidades e campos
- `docs/decisoes.md`: stack e decisões técnicas
- `docs/roadmap.md`: fases e checklist de tarefas

## Stack
- Flutter (Dart), Material 3, layout adaptativo (mobile e desktop)
- Estado: Riverpod
- Banco local: Drift (SQLite)
- Navegação: go_router
- Gráficos: fl_chart
- IDs: uuid
- Sincronização: definida em `docs/decisoes.md` (Supabase, sujeito a prova de conceito)

## Arquitetura
- Organização por feature: `lib/features/<feature>/{data,domain,presentation}`
- Código compartilhado em `lib/core/` (tema, utilitários, formatação, banco)
- Features: `caronas`, `financeiro`, `configuracoes`
- Widgets pequenos e reutilizáveis; nada de regra de negócio dentro de widgets

## Convenções de dados
- Toda entidade tem: `id` (UUID gerado no cliente), `usuarioId`, `criadoEm`, `atualizadoEm`, `excluido` (bool), `sincronizado` (bool)
- Exclusão SEMPRE lógica (`excluido = true`), nunca delete físico
- Ao alterar um registro, atualizar `atualizadoEm` e `sincronizado = false`
- Dinheiro: armazenar em centavos (inteiro). Nunca usar `double` para valores monetários
- Datas: armazenar em UTC; exibir em horário local

## Localização
- Interface em pt-BR
- Moeda: R$ (formato brasileiro, ex.: R$ 1.234,56)
- Datas: dd/MM/yyyy
- Usar o pacote `intl`

## Qualidade
- Rodar `flutter analyze` e `flutter test` ao final de cada tarefa; corrigir todos os avisos
- Escrever testes unitários para toda regra de negócio (saldo, reversão de receita, consumo médio, custo por km)
- Não adicionar funcionalidades fora de `docs/requisitos.md`
- Uma tarefa por vez; não implementar itens de fases futuras
- Nunca colocar chaves de API ou segredos no código; usar `.env` (no `.gitignore`)
- Ao criar dependências, confirmar que existem no pub.dev e funcionam em Android e Windows

## Fluxo
- Antes de implementar, resumir em poucas linhas o que será feito e quais arquivos serão alterados
- Ao terminar, listar os arquivos alterados e como testar manualmente
