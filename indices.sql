USE company;

-- ============================================================
-- Índice 1: empregado(id_departamento)
-- Motivo: é a coluna usada no JOIN e no GROUP BY das perguntas
-- "departamento com maior número de pessoas" e "relação de
-- empregados por departamento" — é o dado mais acessado do
-- cenário, presente em praticamente toda consulta.
-- Tipo BTREE (padrão): serve tanto para o JOIN por igualdade
-- quanto para o agrupamento, sem overhead de um tipo específico.
-- ============================================================
CREATE INDEX idx_empregado_departamento ON empregado(id_departamento);

-- ============================================================
-- Índice 2: departamento(cidade)
-- Motivo: usado para responder "quais são os departamentos por
-- cidade" — uma busca/agrupamento por igualdade, não por
-- intervalo. USING HASH é adequado para esse padrão de acesso.
-- Observação: no MySQL/InnoDB (motor padrão), um índice HASH
-- explícito é implementado internamente como BTREE — a sintaxe
-- abaixo documenta a intenção (igualdade, não intervalo), mesmo
-- que o SGBD normalize o tipo de estrutura por baixo dos panos.
-- ============================================================
CREATE INDEX idx_departamento_cidade ON departamento(cidade) USING HASH;
