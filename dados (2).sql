USE company;

INSERT INTO departamento (nome, cidade) VALUES
('TI',         'São Paulo'),
('RH',         'Belém'),
('Vendas',     'São Paulo'),
('Financeiro', 'Santarém');

INSERT INTO empregado (nome, id_departamento) VALUES
('Fernanda Costa',    1),
('Ricardo Alves',     1),
('Juliana Prado',     1),
('Marcos Vinícius',   2),
('Camila Nunes',      3),
('André Barbosa',     3),
('Patrícia Gomes',    4);
