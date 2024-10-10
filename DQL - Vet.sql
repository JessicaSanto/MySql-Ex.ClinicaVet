-- a. O pet com a data de nascimento mais antigo
SELECT nome 
FROM Pets 
ORDER BY data_nascimento ASC 
LIMIT 1;

-- b. O pet com a data de nascimento mais recente
SELECT nome 
FROM Pets 
ORDER BY data_nascimento DESC 
LIMIT 1;

-- c. A quantidade de pets cadastrados no banco de dados
SELECT COUNT(*) AS total_pets 
FROM Pets;

-- d. Ordene o nome dos pets em ordem crescente
SELECT nome 
FROM Pets 
ORDER BY nome ASC;

-- e. Ordene o nome dos pets em ordem decrescente
SELECT nome 
FROM Pets 
ORDER BY nome DESC;

-- f. Ordene o nome dos veterinários em ordem crescente
SELECT nome 
FROM Veterinarios 
ORDER BY nome ASC;

-- g. Ordene o nome dos veterinários em ordem decrescente
SELECT nome 
FROM Veterinarios 
ORDER BY nome DESC;

-- h. A data de atendimento mais antiga
SELECT data_atendimento 
FROM Atendimentos 
ORDER BY data_atendimento ASC 
LIMIT 1;

-- i. A data de atendimento mais recente
SELECT data_atendimento 
FROM Atendimentos 
ORDER BY data_atendimento DESC 
LIMIT 1;

