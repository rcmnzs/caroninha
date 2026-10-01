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
