CREATE DATABASE ClinicaVetBD;

CREATE TABLE Veterinarios (
    id_veterinario INT PRIMARY KEY,
    nome VARCHAR(255),
    especialidade VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE Pets (
    id_pet INT PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(255),
    raca VARCHAR(255),
    data_nascimento DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Atendimentos (
    id_atendimento INT PRIMARY KEY,
    id_pet INT,
    id_veterinario INT,
    data_atendimento DATE,
    descricao VARCHAR(255),
    FOREIGN KEY (id_pet) REFERENCES Pets(id_pet),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);
