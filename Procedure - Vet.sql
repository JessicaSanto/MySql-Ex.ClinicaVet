USE db_clinica;
-- ***** EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.
DELIMITER $$

CREATE PROCEDURE AdicionarVeterinario (
    IN p_id INT,
    IN p_nome VARCHAR(255),
    IN p_especialidade VARCHAR(255),
    IN p_telefone VARCHAR(15)
)
BEGIN
    INSERT INTO tb_veterinario (id, nome, especialidade, telefone)
    VALUES (p_id, p_nome, p_especialidade, p_telefone);
END $$

DELIMITER ;

CALL AdicionarVeterinario('5','Dr. João Silva', 'Cardiologia', '12345678');

SELECT * FROM tb_veterinario;

-- ********* EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.

DELIMITER $$

CREATE PROCEDURE AtualizarDadosCliente (
    IN p_id_cliente INT,
    IN p_nome VARCHAR(255),
    IN p_endereco VARCHAR(255),
    IN p_telefone VARCHAR(15)
)
BEGIN
    UPDATE tb_cliente
    SET nome = p_nome, endereco = p_endereco, telefone = p_telefone
    WHERE id = p_id_cliente;
END $$

DELIMITER ;

CALL AtualizarDadosCliente(1, 'Maria Souza', 'Rua Nova, 123', '99998888');
SELECT * FROM tb_cliente;

-- ********** EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.
DELIMITER $$

CREATE PROCEDURE AdicionarAtendimento (IN p_id_at INT, IN p_data_atendimento DATE, IN p_descricao VARCHAR(255), IN p_id_pet INT, IN p_id_veterinario INT)
BEGIN
    DECLARE v_count_pet INT;
    DECLARE v_count_veterinario INT;

    -- Verifica se o pet existe
    SELECT COUNT(*) INTO v_count_pet FROM tb_pets WHERE id = p_id_pet;

    -- Verifica se o veterinário existe
    SELECT COUNT(*) INTO v_count_veterinario FROM tb_veterinario WHERE id = p_id_veterinario;

    -- Se ambos existem, insere o atendimento
    IF v_count_pet > 0 AND v_count_veterinario > 0 THEN
        INSERT INTO tb_atendimento (id, data_atendimento, descricao, id_pet, id_veterinario)
        VALUES (p_id_at, p_data_atendimento, p_descricao, p_id_pet, p_id_veterinario);
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Pet ou Veterinário não encontrados';
    END IF;
END $$

DELIMITER ;


CALL AdicionarAtendimento('4', '2024-10-10', 'Check-up completo', '4', '2');
SELECT * FROM tb_atendimento;
