CREATE DATABASE IF NOT EXISTS universidade;
USE universidade;

CREATE TABLE IF NOT EXISTS aluno (
    id_aluno    INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL,
    curso       VARCHAR(100) NOT NULL,
    email       VARCHAR(150) NOT NULL,
    matricula   VARCHAR(20) NOT NULL UNIQUE
);

DELIMITER $$

CREATE PROCEDURE sp_manipula_aluno (
    IN p_acao       INT,           
    IN p_id_aluno   INT,          
    IN p_nome       VARCHAR(150),
    IN p_curso      VARCHAR(100),
    IN p_email      VARCHAR(150),
    IN p_matricula  VARCHAR(20)
)
BEGIN
    IF p_acao = 1 THEN
        INSERT INTO aluno (nome, curso, email, matricula)
        VALUES (p_nome, p_curso, p_email, p_matricula);

    ELSEIF p_acao = 2 THEN
        UPDATE aluno
        SET nome      = p_nome,
            curso     = p_curso,
            email     = p_email,
            matricula = p_matricula
        WHERE id_aluno = p_id_aluno;

    ELSEIF p_acao = 3 THEN
        DELETE FROM aluno WHERE id_aluno = p_id_aluno;

    ELSE
        SELECT 'Ação inválida. Use 1 (inserir), 2 (atualizar) ou 3 (excluir).' AS mensagem;
    END IF;
END$$

DELIMITER ;

CALL sp_manipula_aluno(1, NULL, 'Fernanda Costa', 'Engenharia de Software', 'fernanda.costa@uni.edu', '2026001');

CALL sp_manipula_aluno(2, 1, 'Fernanda Costa Lima', 'Engenharia de Software', 'fernanda.lima@uni.edu', '2026001');

CALL sp_manipula_aluno(3, 1, NULL, NULL, NULL, NULL);

SELECT * FROM aluno;
