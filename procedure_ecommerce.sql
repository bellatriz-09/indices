USE ecommerce;

DELIMITER $$

CREATE PROCEDURE sp_manipula_produto (
    IN p_acao          INT,             
    IN p_id_produto    INT,             
    IN p_nome          VARCHAR(150),
    IN p_descricao     VARCHAR(300),
    IN p_preco         DECIMAL(10,2),
    IN p_id_categoria  INT,
    IN p_id_vendedor   INT
)
BEGIN
    IF p_acao = 1 THEN
        INSERT INTO produto (nome, descricao, preco, id_categoria, id_vendedor)
        VALUES (p_nome, p_descricao, p_preco, p_id_categoria, p_id_vendedor);

    ELSEIF p_acao = 2 THEN
        UPDATE produto
        SET nome         = p_nome,
            descricao    = p_descricao,
            preco        = p_preco,
            id_categoria = p_id_categoria,
            id_vendedor  = p_id_vendedor
        WHERE id_produto = p_id_produto;

    ELSEIF p_acao = 3 THEN
        DELETE FROM produto WHERE id_produto = p_id_produto;

    ELSE
        SELECT 'Ação inválida. Use 1 (inserir), 2 (atualizar) ou 3 (excluir).' AS mensagem;
    END IF;
END$$

DELIMITER ;

CALL sp_manipula_produto(1, NULL, 'Carregador Turbo 30W', 'Carregador USB-C rápido', 79.90, 1, 2);

CALL sp_manipula_produto(2, 1, 'Smartphone X200 Pro', 'Smartphone 128GB, 6GB RAM', 1399.90, 1, 2);

CALL sp_manipula_produto(3, 1, NULL, NULL, NULL, NULL, NULL);

-- Conferir o resultado
SELECT * FROM produto;
