---Criação de tabelas para armazenar informações sobre quartos de hotel, hóspedes, reservas e status de ocupação dos quartos.

-- Criação da tabela de Quartos de Hotel
CREATE TABLE QuartosHotel (
    QuartoID INT PRIMARY KEY IDENTITY(1,1),
    NumeroQuarto INT NOT NULL,
    TipoQuarto VARCHAR(50),
    Capacidade INT,
    PrecoDiaria DECIMAL(10, 2),
    Ocupado BIT DEFAULT 0
);


-- Criação da tabela de Hóspedes
CREATE TABLE Hospedes (
    HospedeID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Telefone VARCHAR(20),
    DataNascimento DATE
);


-- Criação da tabela de Reservas
CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY IDENTITY(1,1),
    QuartoID INT,
    HospedeID INT,
    DataCheckIn DATE,
    DataCheckOut DATE,
    FOREIGN KEY (QuartoID) REFERENCES QuartosHotel(QuartoID),
    FOREIGN KEY (HospedeID) REFERENCES Hospedes(HospedeID)
);


-- Atualização do status de ocupação dos quartos
-- TRUE para quartos ocupados, FALSE para quartos disponíveis
UPDATE QuartosHotel SET Ocupado = 1 WHERE QuartoID IN (1, 3, 5);-- Exemplo de quartos ocupados


---Autenticação e Gerenciamento de Usuários:

-- Criação da tabela de Usuários
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    NomeUsuario VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    DataCadastro TIMESTAMP
);



-- Criação da tabela de Perfis de Usuário
CREATE TABLE PerfisUsuario (
    PerfilID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    NomePerfil VARCHAR(50),
    Descrição TEXT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

---Pagamentos Online:

-- Criação da tabela de Pagamentos
CREATE TABLE Pagamentos (
    PagamentoID INT PRIMARY KEY IDENTITY(1,1),
    ReservaID INT,
    Valor DECIMAL(10, 2) NOT NULL,
    MetodoPagamento VARCHAR(50),
    DataPagamento TIMESTAMP,
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID)
);

---Avaliações e Comentários:

-- Criação da tabela de Avaliações

CREATE TABLE Avaliacoes (
    AvaliacaoID INT PRIMARY KEY IDENTITY(1,1),
    ReservaID INT,
    Classificacao INT,
    Comentario TEXT,
    DataAvaliacao DATE,
    FOREIGN KEY (ReservaID) REFERENCES Reservas(ReservaID)
);

---Sistema de Notificação:

--TODO

--Gestão de Estoque e Serviços:
-- Criação da tabela de Serviços Adicionais
CREATE TABLE ServicosAdicionais (
    ServicoID INT PRIMARY KEY IDENTITY(1,1),
    NomeServico VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Criação da tabela de Itens Consumíveis

CREATE TABLE ItensConsumiveis (
    ItemID INT PRIMARY KEY IDENTITY(1,1),
    NomeItem VARCHAR(100) NOT NULL,
    EstoqueAtual INT NOT NULL,
    EstoqueMinimo INT NOT NULL
);


-- Criação de uma stored procedure para criar uma nova reserva

CREATE PROCEDURE CriarReserva
    @p_QuartoID INT,
    @p_HospedeID INT,
    @p_DataCheckIn DATE,
    @p_DataCheckOut DATE
AS
BEGIN
    -- Verifica se o quarto está disponível para as datas especificadas
    DECLARE @quarto_disponivel BIT;
    
    SET @quarto_disponivel = 1; -- Inicialmente, assume que o quarto está disponível
    
    IF EXISTS (
        SELECT 1
        FROM Reservas
        WHERE QuartoID = @p_QuartoID
          AND (
              (@p_DataCheckIn BETWEEN DataCheckIn AND DataCheckOut)
              OR (@p_DataCheckOut BETWEEN DataCheckIn AND DataCheckOut)
          )
    )
    BEGIN
        SET @quarto_disponivel = 0; -- O quarto não está disponível
    END
    
    -- Se o quarto estiver disponível, insira a reserva e atualize o status de ocupação
    IF @quarto_disponivel = 1
    BEGIN
        INSERT INTO Reservas (QuartoID, HospedeID, DataCheckIn, DataCheckOut)
        VALUES (@p_QuartoID, @p_HospedeID, @p_DataCheckIn, @p_DataCheckOut);
        
        UPDATE QuartosHotel
        SET Ocupado = 1
        WHERE QuartoID = @p_QuartoID;
        
        SELECT 'Reserva criada com sucesso.' AS Mensagem;
    END
    ELSE
    BEGIN
        SELECT 'O quarto não está disponível para as datas especificadas.' AS Mensagem;
    END
END;


---Atualização de uma Reserva:

CREATE PROCEDURE AtualizarReserva
    @p_ReservaID INT,
    @p_NovaDataCheckIn DATE,
    @p_NovaDataCheckOut DATE
AS
BEGIN

-- Verifica se a reserva existe
    DECLARE @reserva_existente BIT;
    
    SET @reserva_existente = 0; -- Inicialmente, assume que a reserva não existe
    
    IF EXISTS (
        SELECT 1
        FROM Reservas
        WHERE ReservaID = @p_ReservaID
    )
    BEGIN
        SET @reserva_existente = 1; -- A reserva existe
    END
    
    -- Se a reserva existe, atualize as datas de check-in e check-out
    IF @reserva_existente = 1
    BEGIN
        UPDATE Reservas
        SET DataCheckIn = @p_NovaDataCheckIn,
            DataCheckOut = @p_NovaDataCheckOut
        WHERE ReservaID = @p_ReservaID;
        
        SELECT 'Reserva atualizada com sucesso.' AS Mensagem;
    END
    ELSE
    BEGIN
        SELECT 'A reserva especificada não existe.' AS Mensagem;
    END
END;

---Exclusão de uma Reserva:

CREATE PROCEDURE ExcluirReserva
    @p_ReservaID INT
AS
BEGIN
    -- Verifica se a reserva existe
    DECLARE @reserva_existente BIT;
    
    SET @reserva_existente = 0; -- Inicialmente, assume que a reserva não existe
    
    IF EXISTS (
        SELECT 1
        FROM Reservas
        WHERE ReservaID = @p_ReservaID
    )
    BEGIN
        SET @reserva_existente = 1; -- A reserva existe
    END
    
    -- Se a reserva existe, exclua-a
    IF @reserva_existente = 1
    BEGIN
        DELETE FROM Reservas
        WHERE ReservaID = @p_ReservaID;
        
        SELECT 'Reserva excluída com sucesso.' AS Mensagem;
    END
    ELSE
    BEGIN
        SELECT 'A reserva especificada não existe.' AS Mensagem;
    END
END;


---Gestão de Funcionários:

-- Criação da tabela de Funcionários
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Cargo VARCHAR(100),
    DataContratacao DATE,
    Salario DECIMAL(10, 2),
    UsuarioID INT UNIQUE,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);


-- Criação da tabela de Turnos de Trabalho

CREATE TABLE TurnosTrabalho (
    TurnoID INT PRIMARY KEY IDENTITY(1,1),
    FuncionarioID INT,
    Data DATE,
    HoraEntrada TIME,
    HoraSaida TIME,
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);


---Gestão de Eventos e Conferências:
-- Criação da tabela de Eventos

CREATE TABLE Eventos (
    EventoID INT PRIMARY KEY IDENTITY(1,1),
    NomeEvento VARCHAR(255) NOT NULL,
    DataInicio DATE,
    DataFim DATE,
    Descricao TEXT
);


-- Criação da tabela de Reservas de Eventos
CREATE TABLE ReservasEventos (
    ReservaEventoID INT PRIMARY KEY IDENTITY(1,1),
    EventoID INT,
    QuartoID INT,
    HospedeID INT,
    DataCheckIn DATE,
    DataCheckOut DATE,
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
    FOREIGN KEY (QuartoID) REFERENCES QuartosHotel(QuartoID),
    FOREIGN KEY (HospedeID) REFERENCES Hospedes(HospedeID)
);

--Identificando as reservas duplicadas
SELECT QuartoID, HospedeID, DataCheckIn, DataCheckOut, COUNT(*) AS Contagem
FROM Reservas
GROUP BY QuartoID, HospedeID, DataCheckIn, DataCheckOut
HAVING COUNT(*) > 1;

-- Exclua as reservas duplicadas, mantendo a reserva com o menor valor de ReservaID
WITH Duplicatas AS (
    SELECT ReservaID, ROW_NUMBER() OVER(PARTITION BY QuartoID, HospedeID, DataCheckIn, DataCheckOut ORDER BY ReservaID) AS RN
    FROM Reservas
)
DELETE FROM Duplicatas WHERE RN > 1;



