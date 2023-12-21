-- Inserção de dados na tabela QuartosHotel
INSERT INTO QuartosHotel (NumeroQuarto, TipoQuarto, Capacidade, PrecoDiaria, Ocupado)
VALUES
(101, 'Standard', 2, 150.00, 0),
(102, 'Deluxe', 3, 200.00, 0),
(103, 'Suite', 4, 300.00, 1),
(104, 'Standard', 2, 150.00, 0),
(105, 'Suite', 4, 300.00, 1);

-- Inserção de dados na tabela Hospedes
INSERT INTO Hospedes (Nome, Email, Telefone, DataNascimento)
VALUES
('João Silva', 'joao.silva@email.com', '123456789', '1990-05-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '987654321', '1985-08-20'),
('Pedro Santos', 'pedro.santos@email.com', '456789123', '1995-02-10');

-- Inserção de dados na tabela Reservas
INSERT INTO Reservas (QuartoID, HospedeID, DataCheckIn, DataCheckOut)
VALUES
(1, 1, '2023-01-10', '2023-01-15'),
(2, 2, '2023-02-05', '2023-02-10'),
(3, 3, '2023-03-20', '2023-03-25'),
(4, 1, '2023-04-15', '2023-04-20'),
(5, 2, '2023-05-01', '2023-05-05');

-- Inserção de dados na tabela Usuarios
INSERT INTO Usuarios (NomeUsuario, Email, Senha, DataCadastro)
VALUES
('admin', 'admin@email.com', 'admin123', CURRENT_TIMESTAMP),
('user1', 'user1@email.com', 'user123', CURRENT_TIMESTAMP),
('user2', 'user2@email.com', 'user456', CURRENT_TIMESTAMP);

-- Inserção de dados na tabela PerfisUsuario
INSERT INTO PerfisUsuario (UsuarioID, NomePerfil, Descricao)
VALUES
(1, 'Administrador', 'Perfil de administrador do sistema'),
(2, 'Usuário', 'Perfil padrão de usuário'),
(3, 'Usuário', 'Perfil padrão de usuário');

-- Inserção de dados na tabela Pagamentos
INSERT INTO Pagamentos (ReservaID, Valor, MetodoPagamento, DataPagamento)
VALUES
(1, 200.00, 'Cartão de Crédito', CURRENT_TIMESTAMP),
(2, 250.00, 'Boleto Bancário', CURRENT_TIMESTAMP),
(3, 350.00, 'PayPal', CURRENT_TIMESTAMP),
(4, 200.00, 'Cartão de Débito', CURRENT_TIMESTAMP),
(5, 300.00, 'Transferência Bancária', CURRENT_TIMESTAMP);

-- Inserção de dados na tabela Avaliacoes
INSERT INTO Avaliacoes (ReservaID, Classificacao, Comentario, DataAvaliacao)
VALUES
(1, 4, 'Ótima estadia, quartos limpos e confortáveis.', '2023-01-16'),
(2, 3, 'Bom atendimento, mas a limpeza poderia ser melhor.', '2023-02-11'),
(3, 5, 'Experiência incrível, recomendo a todos!', '2023-03-26'),
(4, 4, 'Hotel bem localizado, staff amigável.', '2023-04-21'),
(5, 2, 'Problemas com a reserva, mas o quarto era bom.', '2023-05-06');

-- Inserção de dados na tabela ServicosAdicionais
INSERT INTO ServicosAdicionais (NomeServico, Preco)
VALUES
('Wi-Fi', 10.00),
('Estacionamento', 15.00),
('Café da Manhã', 20.00),
('Serviço de Quarto', 25.00);

-- Inserção de dados na tabela ItensConsumiveis
INSERT INTO ItensConsumiveis (NomeItem, EstoqueAtual, EstoqueMinimo)
VALUES
('Toalhas', 50, 20),
('Sabonetes', 100, 30),
('Chinelos', 30, 10),
('Shampoo', 80, 25);

-- Inserção de dados na tabela Funcionarios
INSERT INTO Funcionarios (Nome, Cargo, DataContratacao, Salario, UsuarioID)
VALUES
('Ana Oliveira', 'Recepcionista', '2020-03-10', 3000.00, 2),
('Carlos Santos', 'Camareiro', '2021-06-15', 2500.00, 3);

-- Inserção de dados na tabela TurnosTrabalho
INSERT INTO TurnosTrabalho (FuncionarioID, Data, HoraEntrada, HoraSaida)
VALUES
(1, '2023-01-10', '08:00:00', '17:00:00'),
(2, '2023-01-10', '09:00:00', '18:00:00'),
(1, '2023-01-11', '08:30:00', '17:30:00'),
(2, '2023-01-11', '09:30:00', '18:30:00');

-- Inserção de dados na tabela Eventos
INSERT INTO Eventos (NomeEvento, DataInicio, DataFim, Descricao)
VALUES
('Conferência de Turismo', '2023-04-01', '2023-04-03', 'Evento internacional sobre turismo'),
('Workshop de Hotelaria', '2023-05-15', '2023-05-17', 'Oportunidade para aprender sobre as tendências em hotelaria');

-- Inserção de dados na tabela ReservasEventos
INSERT INTO ReservasEventos (EventoID, QuartoID, HospedeID, DataCheckIn, DataCheckOut)
VALUES
(1, 3, 1, '2023-03-30', '2023-04-04'),
(2, 5, 2, '2023-05-10', '2023-05-18');


--- TODO: fazer os inserts

-- TODO: fazer os selects

-- Inserção de dados na tabela Pagamentos
INSERT INTO Pagamentos (ReservaID, Valor, MetodoPagamento, DataPagamento)
VALUES
(1, 200.00, 'Cartão de Crédito', GETDATE()),
(2, 250.00, 'Boleto Bancário', GETDATE()),
(3, 350.00, 'PayPal', GETDATE()),
(4, 200.00, 'Cartão de Débito', GETDATE()),
(5, 300.00, 'Transferência Bancária', GETDATE());


