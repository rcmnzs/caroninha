# Roadmap

Regras: uma tarefa por vez; ao final de cada uma rodar `flutter analyze` e `flutter test`, testar manualmente e fazer commit. Marque `[x]` ao concluir.

## Fase 1: MVP local (Android, offline)

- [x] **T1.1 Estrutura do projeto**
      Prompt: "Configure o projeto conforme `.github/copilot-instructions.md`: adicione dependências (riverpod, drift, go_router, intl, uuid, fl_chart), crie a estrutura `lib/core` e `lib/features/{caronas,financeiro,configuracoes}`, tema Material 3 em pt-BR e navegação com 3 abas inferiores (Caronas, Financeiro, Config.) com telas vazias."

- [x] **T1.2 Banco local**
      Prompt: "Crie o banco Drift com as tabelas Passageiro, Carona, Transacao, Abastecimento e ConfiguracaoVeiculo conforme `docs/modelo-dados.md`, incluindo campos comuns e índices. Não crie telas."

- [x] **T1.3 Repositório de caronas**
      Prompt: "Implemente o repositório e os providers Riverpod de Carona e Passageiro (criar, editar, excluir logicamente, listar por data, filtrar por período). Valores em centavos. Inclua testes unitários."

- [x] **T1.4 Lista de caronas**
      Prompt: "Implemente a tela de lista de caronas (mais recentes primeiro), com resumo de total recebido e pendente no topo (RF02, RF07)."

- [x] **T1.5 Formulário de carona**
      Prompt: "Implemente o formulário de nova/editar carona: nome com autocomplete de passageiros existentes, valor em R$, data e switch 'pago' (RF01, RF03, RF06). Validar RN01 e RN02. Máximo de 3 toques no fluxo comum."

- [x] **T1.6 Pago/pendente e receita automática**
      Prompt: "Implemente RN03: ao marcar uma carona como paga, gerar a Transacao de receita; ao desmarcar ou excluir, reverter. Inclua testes unitários cobrindo todos os cenários."

- [x] **T1.7 Despesas e saldo**
      Prompt: "Implemente o cadastro de despesas com categorias (RF10) e a tela Financeiro com cards de receita, despesa e saldo do período (RF13, RN04), mais a lista de lançamentos. Inclua testes do cálculo do saldo."

- [ ] **T1.8 Revisão da Fase 1**
      Prompt: "Revise a Fase 1 contra `docs/requisitos.md`: liste requisitos de prioridade Alta da fase ainda não atendidos, corrija avisos do analyzer e complete a cobertura de testes das regras de negócio."

## Fase 2: Financeiro completo

- [ ] **T2.1** Cadastro de abastecimento com despesa automática (RF12)
- [ ] **T2.2** Consumo médio e custo por km (RF15, RN05, RN10, RN11), com testes
- [ ] **T2.3** Gráficos receita x despesa por mês e despesas por categoria (RF14)
- [ ] **T2.4** Filtros avançados e resumo diário (RF04, RF28)
- [ ] **T2.5** Receitas avulsas e origem/destino/observação (RF16, RF08)

## Prova de conceito de sincronização (antes da Fase 3)

- [ ] **T3.0** Criar projeto Supabase de teste e validar, em Android E Windows: login, envio e recebimento de uma tabela simples. Registrar o resultado em `docs/decisoes.md` e confirmar ou trocar o backend.

## Fase 3: Nuvem e Windows

- [ ] **T3.1** Autenticação (RF21)
- [ ] **T3.2** Sincronização: envio, recebimento e last-write-wins (RF22, RF23, RN08, RN09)
- [ ] **T3.3** Indicador de status de sincronização (RF24)
- [ ] **T3.4** Build e layout adaptativo para Windows: navegação lateral, lista + formulário lado a lado (RF26)
- [ ] **T3.5** Exclusão de dados da conta (LGPD)

## Fase 4: Refinamentos

- [ ] **T4.1** Exportação CSV/PDF (RF18)
- [ ] **T4.2** Backup e restauração (RF19)
- [ ] **T4.3** Meta mensal e alertas (RF17)
- [ ] **T4.4** Repetir carona / copiar para outros dias (RF09)
- [ ] **T4.5** Atalhos de teclado e tabela no Windows (RF27)
- [ ] **T4.6** Biometria no Android

=== FIM ===
