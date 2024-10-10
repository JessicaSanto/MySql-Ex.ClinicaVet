INSERT INTO Veterinarios (id_veterinario, nome, especialidade, telefone)
VALUES
(1, 'Dr. João Costa', 'Cirurgia', '123456789'),
(2, 'Dra. Maria Souza', 'Dermatologia', '987654321'),
(3, 'Dr. Pedro Lima', 'Cardiologia', '123123123');

INSERT INTO Clientes (id_cliente, nome, endereco, telefone)
VALUES
(1, 'Ana Silva', 'Rua A, 123', '1122334455'),
(2, 'Carlos Pereira', 'Rua B, 456', '2233445566'),
(3, 'Beatriz Santos', 'Rua C, 789', '3344556677');

INSERT INTO Pets (id_pet, nome, tipo, raca, data_nascimento, id_cliente)
VALUES
(1, 'Bobby', 'Cachorro', 'Labrador', '2018-03-15', 1),
(2, 'Luna', 'Gato', 'Persa', '2021-06-22', 2),
(3, 'Rex', 'Cachorro', 'Bulldog', '2017-09-09', 3);

INSERT INTO Atendimentos (id_atendimento, id_pet, id_veterinario, data_atendimento, descricao)
VALUES
(1, 1, 1, '2024-09-01', 'Cirurgia de joelho'),
(2, 2, 2, '2024-09-05', 'Tratamento de pele'),
(3, 3, 3, '2024-09-10', 'Check-up cardíaco');
