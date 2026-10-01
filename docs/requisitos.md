# Requisitos: App de Controle de Caronas

## 1. Visão geral
App para o motorista registrar caronas (passageiro, valor, data) e controlar suas finanças (receitas, combustível, outras despesas) em uma aba separada. Android e Windows, com sincronização entre dispositivos.

## 2. Decisões de escopo
- Público: apenas o motorista (sem perfil de passageiro, chat ou matching)
- Um único veículo
- Cobrança por passageiro por dia (sem mensalidade)
- Ida e volta no mesmo dia: dois registros de carona
- O passageiro pode pagar na hora ou depois (status pago/pendente)
- Plataforma: Flutter (Android + Windows)
- Offline-first, com sincronização em nuvem

## 3. Requisitos funcionais

### Aba Caronas
| ID | Requisito | Prioridade |
|----|-----------|-----------|
| RF01 | Cadastrar carona: nome do passageiro, valor (R$), data | Alta |
| RF02 | Listar caronas por data (mais recente primeiro) | Alta |
| RF03 | Editar e excluir carona | Alta |
| RF04 | Filtrar por período, passageiro ou status | Média |
| RF05 | Marcar carona como paga/pendente | Alta |
| RF06 | Autocompletar nomes de passageiros já cadastrados | Média |
| RF07 | Exibir total recebido e total pendente no período | Média |
| RF08 | Registrar origem/destino e observações | Baixa |
| RF09 | Atalho para repetir carona (copiar para outros dias) | Média |
| RF28 | Resumo diário: quanto recebi hoje e quem ainda não pagou | Média |

### Aba Financeiro
| ID | Requisito | Prioridade |
|----|-----------|-----------|
| RF10 | Registrar despesas com categoria (combustível, pedágio, manutenção, estacionamento, outros), valor e data | Alta |
| RF11 | Receitas das caronas pagas entram automaticamente no financeiro | Alta |
| RF12 | Registrar abastecimento: litros, preço por litro, valor total, km do odômetro | Média |
| RF13 | Resumo do período: receita, despesas e saldo | Alta |
| RF14 | Gráficos: receita x despesa por mês; despesas por categoria | Média |
| RF15 | Calcular consumo médio (km/l) e custo por km | Média |
| RF16 | Registrar receitas avulsas | Baixa |
| RF17 | Meta mensal com alerta de desvio | Baixa |

### Transversais
| ID | Requisito | Prioridade |
|----|-----------|-----------|
| RF18 | Exportar dados (CSV/PDF) | Média |
| RF19 | Backup e restauração | Média |
| RF21 | Autenticação (e-mail/senha ou Google) | Alta |
| RF22 | Sincronização automática entre Android e Windows | Alta |
| RF23 | Funcionar offline e sincronizar ao reconectar | Alta |
| RF24 | Indicador de status de sincronização | Média |
| RF25 | Resolução de conflitos de edição | Média |
| RF26 | Layout responsivo: touch no Android, mouse/teclado no Windows | Alta |
| RF27 | Atalhos de teclado e tabela de dados no Windows | Baixa |

## 4. Requisitos não funcionais
- Usabilidade: cadastrar uma carona em no máximo 3 toques/campos
- Desempenho: abertura em menos de 2 s; listas fluidas com milhares de registros
- Offline-first: banco local é a fonte primária; a nuvem é réplica
- Segurança: autenticação obrigatória, dados isolados por usuário, HTTPS, biometria opcional no Android
- Consistência: UUIDs gerados no cliente; sem duplicar nem perder registros na sincronização
- LGPD: nomes de passageiros são dados pessoais; política de privacidade e opção de excluir todos os dados da conta
- Confiabilidade: sem perda de dados em fechamento inesperado
- Manutenibilidade: código modular por feature
- Localização: pt-BR, R$, dd/MM/yyyy

## 5. Regras de negócio
- RN01: valor da carona deve ser maior que zero
- RN02: a data é obrigatória; datas futuras são permitidas (agendamento)
- RN03: carona marcada como paga gera uma receita no financeiro; ao desmarcar ou excluir, a receita é revertida
- RN04: saldo = total de receitas − total de despesas no período
- RN05: custo por km = despesas com combustível ÷ km rodados no período
- RN06: excluir um passageiro não apaga o histórico financeiro
- RN07: uma carona = um passageiro + um dia + um valor; ida e volta geram dois registros
- RN08: conflito de sincronização: vale a edição mais recente (last-write-wins por `atualizadoEm`)
- RN09: exclusões são lógicas para propagar a remoção na sincronização
- RN10: com um único veículo, consumo médio e custo por km usam sempre o mesmo odômetro
- RN11: consumo médio (km/l) = km percorridos entre abastecimentos ÷ litros abastecidos

## 6. Telas
- Android: abas inferiores (Caronas | Financeiro | Config.), botão "+" flutuante
- Windows: navegação lateral, lista e formulário lado a lado, tabela com ordenação e filtros
- Telas: lista de caronas, nova/editar carona, financeiro (cards, gráficos, lançamentos), nova despesa/abastecimento, configurações (backup, exportação, segurança, conta)

## 7. Fora do escopo
- Matching entre motoristas e passageiros
- Pagamento integrado (Pix, cartão)
- Rastreamento GPS e cálculo de rotas
- Avaliações e chat
- Múltiplos veículos

=== ARQUIVO 3: docs/modelo-dados.md ===

# Modelo de Dados

## Campos comuns (todas as tabelas)
| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | TEXT (UUID) | Gerado no cliente |
| usuario_id | TEXT | Dono do registro |
| criado_em | DATETIME (UTC) | |
| atualizado_em | DATETIME (UTC) | Atualizar a cada alteração |
| excluido | BOOLEAN | Exclusão lógica |
| sincronizado | BOOLEAN | false até confirmar no servidor |

Valores monetários: INTEGER em centavos.

## Passageiro
| Campo | Tipo | Observação |
|-------|------|-----------|
| nome | TEXT | Obrigatório |
| telefone | TEXT | Opcional |

## Carona
| Campo | Tipo | Observação |
|-------|------|-----------|
| passageiro_id | TEXT | FK para Passageiro |
| valor_centavos | INTEGER | > 0 |
| data | DATE | Obrigatória |
| pago | BOOLEAN | Padrão: false |
| origem | TEXT | Opcional |
| destino | TEXT | Opcional |
| observacao | TEXT | Opcional |

## Transacao
| Campo | Tipo | Observação |
|-------|------|-----------|
| tipo | TEXT | `receita` ou `despesa` |
| categoria | TEXT | combustivel, pedagio, manutencao, estacionamento, carona, avulsa, outros |
| valor_centavos | INTEGER | > 0 |
| data | DATE | |
| descricao | TEXT | Opcional |
| carona_id | TEXT | Opcional; preenchido quando a receita vem de uma carona |

## Abastecimento
| Campo | Tipo | Observação |
|-------|------|-----------|
| data | DATE | |
| litros | REAL | |
| preco_litro_centavos | INTEGER | |
| valor_total_centavos | INTEGER | |
| km_odometro | INTEGER | |
| transacao_id | TEXT | Despesa gerada automaticamente |

## ConfiguracaoVeiculo (um registro por usuário)
| Campo | Tipo | Observação |
|-------|------|-----------|
| tipo_combustivel | TEXT | |
| odometro_inicial | INTEGER | |
| meta_consumo_kml | REAL | Opcional |
| meta_mensal_centavos | INTEGER | Opcional |

## Relações
- Passageiro 1 — N Carona
- Carona 1 — 0..1 Transacao (receita)
- Abastecimento 1 — 1 Transacao (despesa de combustível)

## Índices sugeridos
- Carona: (data), (passageiro_id), (pago)
- Transacao: (data), (tipo, categoria)
- Todas: (sincronizado), (atualizado_em)

=== ARQUIVO 4: docs/decisoes.md ===

# Decisões Técnicas

| Tema | Decisão | Motivo |
|------|---------|--------|
| Framework | Flutter (Android + Windows) | Código único |
| Estado | Riverpod | Testável, separa lógica da UI |
| Banco local | Drift (SQLite) | Funciona em Android e Windows |
| Navegação | go_router | Rotas declarativas, suporte desktop |
| Gráficos | fl_chart | Multiplataforma |
| Exportação | pacotes `pdf` e `csv` | Relatórios |
| IDs | UUID v4 no cliente | Permite criar offline sem conflito |
| Dinheiro | Inteiro em centavos | Evita erro de ponto flutuante |
| Exclusão | Lógica | Necessária para propagar na sincronização |
| Conflitos | Last-write-wins por `atualizado_em` | Simples; uso por um único usuário |
| Arquitetura | Offline-first, por feature | Banco local é a fonte primária |

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

=== ARQUIVO 5: docs/roadmap.md ===

# Roadmap

Regras: uma tarefa por vez; ao final de cada uma rodar `flutter analyze` e `flutter test`, testar manualmente e fazer commit. Marque `[x]` ao concluir.

## Fase 1: MVP local (Android, offline)

- [ ] **T1.1 Estrutura do projeto**
  Prompt: "Configure o projeto conforme `.github/copilot-instructions.md`: adicione dependências (riverpod, drift, go_router, intl, uuid, fl_chart), crie a estrutura `lib/core` e `lib/features/{caronas,financeiro,configuracoes}`, tema Material 3 em pt-BR e navegação com 3 abas inferiores (Caronas, Financeiro, Config.) com telas vazias."

- [ ] **T1.2 Banco local**
  Prompt: "Crie o banco Drift com as tabelas Passageiro, Carona, Transacao, Abastecimento e ConfiguracaoVeiculo conforme `docs/modelo-dados.md`, incluindo campos comuns e índices. Não crie telas."

- [ ] **T1.3 Repositório de caronas**
  Prompt: "Implemente o repositório e os providers Riverpod de Carona e Passageiro (criar, editar, excluir logicamente, listar por data, filtrar por período). Valores em centavos. Inclua testes unitários."

- [ ] **T1.4 Lista de caronas**
  Prompt: "Implemente a tela de lista de caronas (mais recentes primeiro), com resumo de total recebido e pendente no topo (RF02, RF07)."

- [ ] **T1.5 Formulário de carona**
  Prompt: "Implemente o formulário de nova/editar carona: nome com autocomplete de passageiros existentes, valor em R$, data e switch 'pago' (RF01, RF03, RF06). Validar RN01 e RN02. Máximo de 3 toques no fluxo comum."

- [ ] **T1.6 Pago/pendente e receita automática**
  Prompt: "Implemente RN03: ao marcar uma carona como paga, gerar a Transacao de receita; ao desmarcar ou excluir, reverter. Inclua testes unitários cobrindo todos os cenários."

- [ ] **T1.7 Despesas e saldo**
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
