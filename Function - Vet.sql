use db_clinica;

-- READS SQL DATA
-- -> A função apenas lê os dados da tabela, não modifica

-- DETERMINISTICS
-- -> Quando a função trabalhará com um registro e os demais registros não afeterá o resultado

-- NO SQL
-- Só interage (calculos), não le e nem modifica

-- MODIFIES SQL DATA
-- Alterar registros no banco de dados








-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.
-- Recebe o id_cliente
-- Retorna a quantidade de pets

DELIMITER $$
CREATE FUNCTION quantidadePets(id_donop INT(10))
RETURNS INT(10)
READS SQL DATA
BEGIN
DECLARE quantidade_pets INT(10);
SELECT COUNT(id_cliente) INTO quantidade_pets FROM tb_pets WHERE id_cliente = id_donop;
RETURN quantidade_pets;
END $$

DELIMITER ;

SELECT quantidadePets(1);


-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
-- Receber id_pet
-- Retornar a data
DELIMITER $$
CREATE FUNCTION ultimaConsulta(idp INT(10))
RETURNS DATE
READS SQL DATA
BEGIN 

DECLARE ultima_consulta DATE;
SELECT MAX(data_atendimento) INTO ultima_consulta FROM tb_atendimento WHERE id = idp;
RETURN ultima_consulta;

END $$
DELIMITER ;

SELECT ultimaConsulta(1);


-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
-- Recebe id_veterinario 
-- Retorna o numero de atendimento 
DELIMITER $$
CREATE FUNCTION totalAtendimento(id_vetp INT(10))
RETURNS INT
READS SQL DATA
BEGIN

DECLARE total_atendimento INT(10);
SELECT COUNT(id) INTO total_atendimento FROM tb_atendimento WHERE id_veterinario = id_vetp;
RETURN total_atendimento;

END $$

DELIMITER ;

SELECT totalAtendimento(1);



-- Exercicio 4. Crie uma função que receba o id_pet e retorne o nome do dono (cliente) desse pet.
-- Receber o ID_Pet
-- Retornar o nome do dono
DELIMITER $$
CREATE FUNCTION nomeDono(id_petp INT(10))
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN

DECLARE nome_cliente VARCHAR(255);
SELECT C.nome INTO nome_cliente FROM tb_cliente AS C 
INNER JOIN tb_pets AS P ON C.id = P.id_cliente
WHERE P.id = id_petp;
RETURN nome_cliente;

END $$
DELIMITER ;

SELECT nomeDono(2);





