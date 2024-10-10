USE db_clinica;

-- INNER JOIN
-- Exercício 1: Liste os nomes dos clientes e os
-- nomes dos pets que pertencem a eles.
SELECT * FROM tb_cliente AS C
INNER JOIN tb_pets AS P
ON C.id = P.id_cliente;


-- Exercício 2: Liste os veterinários e os atendimentos realizados.
select * from tb_veterinario as V
inner join tb_atendimento as A on V.id = A.id_veterinario;

-- Exercício 3: Liste todos os pets e os detalhes
-- de seus atendimentos (incluindo o nome do veterinário).
SELECT * FROM tb_pets AS P
INNER JOIN tb_atendimento AS A
ON P.id = A.id_pet
INNER JOIN tb_veterinario AS V
ON V.id = A.id_veterinario;


-- Exercício 4: Liste o nome dos pets, seus donos e o
-- veterinário responsável por seus últimos atendimentos.
SELECT * FROM tb_atendimento AS A
INNER JOIN tb_pets AS P ON A.id_pet = P.id
INNER JOIN tb_cliente AS C ON P.id_cliente = C.id
INNER JOIN tb_veterinario AS V ON A.id_veterinario = V.id
WHERE A.data_atendimento IN (
SELECT MIN(data_atendimento)
FROM tb_atendimento);

-- RIGHT JOIN
-- Exercício 1: Liste todos os veterinários e os atendimentos que realizaram, incluindo 
-- aqueles que ainda não realizaram nenhum atendimento.
SELECT * FROM tb_veterinario AS V
LEFT JOIN tb_atendimento AS A
ON V.id = A.id_veterinario;

-- Exercício 3: Liste todos os veterinários e os atendimentos que realizaram, incluindo aqueles que 
-- ainda não realizaram nenhum atendimento.
SELECT * FROM tb_atendimento AS A
RIGHT JOIN tb_veterinario AS V
ON V.id = A.id_veterinario;

-- Exercício 2: Liste todos os clientes e os pets que possuem, incluindo clientes 
-- que ainda não têm pets cadastrados.
SELECT * FROM tb_pets AS P
RIGHT JOIN tb_cliente AS C
ON C.id = P.id_cliente;

-- Exercício 4: Liste todos os clientes e os pets que possuem, incluindo clientes que ainda não têm pets cadastrados.
SELECT * FROM tb_cliente AS C
LEFT JOIN tb_pets AS P
ON C.id = P.id_cliente;

-- UNION
-- Exercício 1: Liste todos os pets e seus clientes, incluindo pets que não têm clientes 
-- associados e clientes que não têm pets cadastrados.
-- Clientes com ou sem pet
SELECT * FROM tb_cliente AS C
LEFT JOIN tb_pets AS P 
ON P.id_cliente = C.id
UNION
-- Pet com ou sem cliente
SELECT * FROM tb_cliente AS C
RIGHT JOIN tb_pets AS P 
ON P.id_cliente = C.id;

-- Exercício 2: Liste todos os atendimentos e os pets, incluindo atendimentos que não têm pets
-- associados e pets que não têm atendimentos registrados.
-- Atendimento
SELECT * FROM tb_atendimento AS A
LEFT JOIN tb_pets AS P
ON P.id = A.id_pet
UNION
-- Pet
SELECT * FROM tb_atendimento AS A
RIGHT JOIN tb_pets AS P
ON P.id = A.id_pet;

-- Exercício 3: Liste todos os veterinários e atendimentos, incluindo veterinários que ainda não realizaram atendimentos e 
-- atendimentos que não têm veterinários associados.
-- Veterinario
SELECT * FROM tb_veterinario AS V
LEFT JOIN tb_atendimento AS A
ON V.id = A.id_veterinario
UNION
-- Atendimento
SELECT * FROM tb_veterinario AS V
RIGHT JOIN tb_atendimento AS A
ON V.id = A.id_veterinario;

-- Exercício 4: Liste todos os pets e atendimentos realizados, incluindo pets que não foram 
-- atendidos e atendimentos sem pets associados.
-- Atendimento
SELECT * FROM tb_atendimento AS A
LEFT JOIN tb_pets AS P 
ON A.id_pet = P.id
UNION
-- Pet
SELECT * FROM tb_atendimento AS A
RIGHT JOIN tb_pets AS P 
ON A.id_pet = P.id;
