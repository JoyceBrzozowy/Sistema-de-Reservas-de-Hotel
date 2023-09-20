# Sistema de Reservas de Hotel 

![image](https://github.com/JoyceBrzozowy/Sistema-de-Reservas-de-Hotel/assets/96213619/31e84289-8cd5-499e-86c6-7f394a24fcc9)

## O objetivo deste sistema é gerenciar e facilitar a reserva de quartos de hotel e outros serviços relacionados. Ele desempenha um papel crucial na operação eficiente de hotéis e estabelecimentos de hospedagem.


A seguir veremos as tabelas, procedures e consultas criadas e suas descrições: 

#### 🛎️ Tabela QuartosHotel: 
Armazena informações sobre os quartos do hotel, como número do quarto, tipo de quarto, capacidade, preço da diária e status de ocupação.

#### 🛎️ Tabela Hospedes: 
Mantém informações sobre os hóspedes, incluindo nome, email, telefone, data de nascimento e um ID exclusivo.

#### 🛎️ Tabela Reservas: 
Registra detalhes das reservas, incluindo o quarto reservado, o hóspede, as datas de check-in e check-out. Também possui chaves estrangeiras que fazem referência às tabelas QuartosHotel e Hospedes.

#### 🛎️ Tabela Usuarios: 
Usada para autenticação e gerenciamento de usuários. Armazena informações de usuário, como nome, email, senha e data de cadastro.

#### 🛎️ Tabela PerfisUsuario: 
Mantém perfis de usuário associados a usuários específicos. Pode ser usado para gerenciar permissões e papéis de usuário.

#### 🛎️ Tabela Pagamentos: 
Registra informações de pagamentos online relacionados a reservas, incluindo valor, método de pagamento e data de pagamento. Também possui uma chave estrangeira que faz referência à tabela Reservas.

#### 🛎️ Tabela Avaliacoes: 
Armazena avaliações e comentários feitos pelos hóspedes após a estadia em um quarto reservado. A chave estrangeira faz referência à tabela Reservas.

#### 🛎️ Tabela ServicosAdicionais: 
Utilizada para gerenciar serviços adicionais oferecidos pelo hotel, como serviços de quarto, estacionamento, etc.

#### 🛎️ Tabela ItensConsumiveis: 
Mantém um registro de itens consumíveis, como alimentos e bebidas, que podem ser oferecidos aos hóspedes.

#### ✏️ Stored Procedure CriarReserva: 
Uma procedure que cria uma nova reserva de quarto após verificar a disponibilidade do quarto para as datas especificadas. Atualiza o status de ocupação do quarto.

#### ✏️ Stored Procedure AtualizarReserva: 
Atualiza as datas de check-in e check-out de uma reserva existente com base no ID da reserva.

#### ✏️ Stored Procedure ExcluirReserva:
Exclui uma reserva com base no ID da reserva.

#### 📍 Consulta para Identificar Reservas Duplicadas:
Identifica as reservas duplicadas com base no quarto, hóspede e datas de check-in e check-out.

#### 📍 Consulta para Excluir Reservas Duplicadas: 
Exclui as reservas duplicadas mantendo apenas a reserva com o menor valor de ReservaID.

#### 📍 Consulta com JOIN: 
Recupera informações detalhadas sobre as reservas, incluindo os detalhes do quarto e do hóspede associados a cada reserva, usando JOIN nas tabelas Reservas, QuartosHotel e Hospedes.
