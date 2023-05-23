INSERT INTO especialidade (id, descricao) VALUES
(1, 'Cardiologia'),
(2, 'Dermatologia'),
(3, 'Gastroenterologia');

-- Inserir dados na tabela tipo_consulta
INSERT INTO tipo_consulta (id, descricao) VALUES
(1, 'Consulta Geral'),
(2, 'Consulta de Rotina'),
(3, 'Consulta Especializada');

-- Inserir dados na tabela tipo_documento
INSERT INTO tipo_documento (id, descricao) VALUES
(1, 'RG'),
(2, 'CPF'),
(3, 'Carteira de Motorista');

-- Inserir dados na tabela tipo_Exame
INSERT INTO tipo_Exame (id, descricao) VALUES
(1, 'Hemograma'),
(2, 'Ultrassonografia'),
(3, 'Ressonância Magnética');

-- Inserir dados na tabela tipo_medicamento
INSERT INTO tipo_medicamento (id, descricao) VALUES
(1, 'Analgésico'),
(2, 'Antibiótico'),
(3, 'Anti-inflamatório');

-- Inserir dados na tabela status
INSERT INTO status (id, descricao) VALUES
(1, 'Agendado'),
(2, 'Concluído'),
(3, 'Cancelado');

-- Inserir dados na tabela usuario
INSERT INTO usuario (id, nome, cpf, numero, data_nascimento, data_inicio, ativo) VALUES
(1, 'João Silva', '12345678900', '987654321', '1990-05-10', NOW(), 1),
(2, 'Maria Santos', '98765432100', '123456789', '1985-09-20', NOW(), 1),
(3, 'Pedro Souza', '45678912300', '555555555', '1995-12-03', NOW(), 1);

-- Inserir dados na tabela paciente
INSERT INTO paciente (id, usuario_id, data_inicio, ativo) VALUES
(1, 1, NOW(), 1),
(2, 2, NOW(), 1),
(3, 3, NOW(), 1);

-- Inserir dados na tabela medico
INSERT INTO medico (id, usuario_id, data_inicio, crm, ativo) VALUES
(1, 4, NOW(), '12345/SP', 1),
(2, 5, NOW(), '54321/SP', 1),
(3, 6, NOW(), '67890/SP', 1);

-- Inserir dados na tabela agendamento
INSERT INTO agendamento (id, medico_id, paciente_id, especialidade_id, tipo_consulta_id, status_id, data_agendada) VALUES
(1, 1, 1, 1, 1, 1, '2023-05-25 10:00:00'),
(2, 2, 2, 2, 1, 1, '2023-05-26 14:30:00'),
(3, 3, 3, 3, 2, 1, '2023-05-27 09:45:00');

-- Inserir dados na tabela documento
INSERT INTO documento (id, tipo_documento_id, descricao, data_inclusao) VALUES
(1, 1, 'RG - João Silva', NOW()),
(2, 2, 'CPF - Maria Santos', NOW()),
(3, 3, 'Carteira de Motorista - Pedro Souza', NOW());

-- Inserir dados na tabela consulta
INSERT INTO consulta (id, agendamento_id, tipo_consulta_id, documento_id, link_consulta) VALUES
(1, 1, 1, 1, 'https://exemplo.com/consulta/1'),
(2, 2, 2, 2, 'https://exemplo.com/consulta/2'),
(3, 3, 3, 3, 'https://exemplo.com/consulta/3');

-- Inserir dados na tabela exame
INSERT INTO exame (id, tipo_Exame_id, descriao) VALUES
(1, 1, 'Exame de sangue'),
(2, 2, 'Ultrassonografia abdominal'),
(3, 3, 'Ressonância magnética do cérebro');

-- Inserir dados na tabela item
INSERT INTO item (id, tipo_medicamento_id, descricao) VALUES
(1, 1, 'Paracetamol'),
(2, 2, 'Amoxicilina'),
(3, 3, 'Diclofenaco');

-- Inserir dados na tabela receita
INSERT INTO receita (id, item_id, consulta_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Inserir dados na tabela alocacao_especialidade
INSERT INTO alocacao_especialidade (medico_id, espec_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela alocacao_tipo_consulta
INSERT INTO alocacao_tipo_consulta (medico_id, tipo_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela alocação_Exame
INSERT INTO alocação_Exame (consulta_id, exame_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela superAdmin
INSERT INTO superAdmin (id, usuario_id, data_inicio, ativo) VALUES
(1, 7, NOW(), 1),
(2, 8, NOW(), 1),
(3, 9, NOW(), 1);