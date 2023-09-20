--- Comandos importantes

-- Seleciona todos os hóspedes de um hotel

SELECT Nome, Email, Telefone
FROM Hospedes;

-- Atualiza o nome de um hóspede pelo seu ID

UPDATE Hospedes
SET Nome = 'Novo Nome'
WHERE HospedeID = 1;

-- Exclui uma reserva pelo seu ID

DELETE FROM Reservas
WHERE ReservaID = 5;

-- Insere um novo hóspede na tabela Hospedes

INSERT INTO Hospedes (Nome, Email, Telefone, DataNascimento)
VALUES ('Novo Hóspede', 'novo@email.com', '+1234567890', '2000-01-01');

-- Cria um novo banco de dados chamado HotelDB

CREATE DATABASE HotelDB;

-- Modifica o nome do banco de dados - pode variar dependendo do banco

ALTER DATABASE HotelDB
MODIFY NAME = NovoHotelDB;

-- Cria uma tabela para armazenar informações de funcionários

CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Cargo VARCHAR(100)
);

-- Adiciona uma nova coluna à tabela Funcionarios - pode variar dependendo do SGDB
ALTER TABLE Funcionarios
ADD DataContratacao DATE;

-- Exclui a tabela de eventos

DROP TABLE Eventos;

-- Cria um índice na coluna Nome da tabela Hospedes, para melhorar o desempenho das consultas.
CREATE INDEX idx_nome_hospedes
ON Hospedes (Nome);

-- Exclui o índice criado anteriormente
DROP INDEX idx_nome_hospedes ON Hospedes;










