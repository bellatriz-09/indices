USE company;

SELECT d.nome AS departamento,
       COUNT(e.id_empregado) AS total_empregados
FROM departamento d
JOIN empregado e ON e.id_departamento = d.id_departamento
GROUP BY d.id_departamento, d.nome
ORDER BY total_empregados DESC
LIMIT 1;

SELECT cidade,
       nome AS departamento
FROM departamento
ORDER BY cidade;

SELECT d.nome AS departamento,
       e.nome AS empregado
FROM departamento d
JOIN empregado e ON e.id_departamento = d.id_departamento
ORDER BY d.nome, e.nome;
