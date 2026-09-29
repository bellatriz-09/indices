# Índices em Banco de Dados — Cenário Company

Projeto de exemplo com duas tabelas (`departamento` e `empregado`), três consultas de negócio e os índices criados a partir dessas consultas.

## Arquivos

| Arquivo | Conteúdo |
|---|---|
| `schema.sql` | Criação das tabelas `departamento` e `empregado` |
| `dados.sql` | Massa de dados de teste |
| `consultas.sql` | As três consultas SQL que respondem às perguntas do desafio |
| `indices.sql` | Criação dos índices, com o motivo de cada um |

## Perguntas respondidas

- Qual o departamento com maior número de pessoas?
- Quais são os departamentos por cidade?
- Relação de empregados por departamento

## Por que esses índices e não outros

A criação de índice tem custo (espaço e overhead em toda escrita), então só valem a pena nas colunas realmente acessadas pelas consultas do cenário:

1. **`idx_empregado_departamento` em `empregado(id_departamento)`** — essa coluna aparece no `JOIN` e no `GROUP BY` das duas perguntas que cruzam empregados e departamentos. É o dado mais acessado do cenário, por isso é o índice mais importante aqui.

2. **`idx_departamento_cidade` em `departamento(cidade)` (USING HASH)** — usado para responder "departamentos por cidade", uma comparação por igualdade/agrupamento, não por intervalo (não há consultas do tipo "cidades entre X e Y"). Por isso um índice pensado para igualdade (HASH) é a escolha mais direta — embora no MySQL/InnoDB ele seja implementado internamente como BTREE, já que esse é o único tipo de índice suportado nesse motor de armazenamento.

Não foram criados índices em colunas que não aparecem em filtro, junção ou ordenação (como `nome` do empregado), já que não trariam ganho de performance para as consultas propostas — só custo de manutenção.

## Como executar

```bash
mysql -u seu_usuario -p < schema.sql
mysql -u seu_usuario -p < dados.sql
mysql -u seu_usuario -p < indices.sql
mysql -u seu_usuario -p < consultas.sql
```
