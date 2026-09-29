USE company;

CREATE INDEX idx_empregado_departamento ON empregado(id_departamento);

CREATE INDEX idx_departamento_cidade ON departamento(cidade) USING HASH;
