USE company;

-- Duas cidades se repetem entre departamentos, para dar resultado
-- interessante na pergunta "departamentos por cidade".
INSERT INTO departamento (nome, cidade) VALUES
('TI',         'São Paulo'),
('RH',         'Belém'),
('Vendas',     'São Paulo'),
('Financeiro', 'Santarém');

-- TI fica com mais empregados, para responder à pergunta do
-- departamento com maior número de pessoas.
INSERT INTO empregado (nome, id_departamento) VALUES
('Fernanda Costa',    1),
('Ricardo Alves',     1),
('Juliana Prado',     1),
('Marcos Vinícius',   2),
('Camila Nunes',      3),
('André Barbosa',     3),
('Patrícia Gomes',    4);
