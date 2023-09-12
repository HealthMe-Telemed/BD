INSERT INTO especialidade (descricao) VALUES
('Psicologia Organizacional'),
('Psicoterapia'),
('Neuropsicologia');

-- Inserir dados na tabela tipo_consulta
INSERT INTO tipo_consulta (descricao) VALUES
('Teleconsulta'),
('Realidade Virtual');

-- Inserir dados na tabela tipo_documento
INSERT INTO tipo_documento (descricao) VALUES
('Atestado'),
('Recomendacao'),
('Encaminhamento');

-- Inserir dados na tabela tipo_Exame
INSERT INTO tipo_Exame (descricao) VALUES
('Eletroencéfalograma (EEG)'),
('Tomografia Computadorizada (CT)'),
('Ressonância Magnética (RM)');

-- Inserir dados na tabela tipo_medicamento
INSERT INTO tipo_medicamento (descricao) VALUES
('Antidepressivos'),
('Estimulantes'),
('Antipsicóticos');

-- Inserir dados na tabela status
INSERT INTO status (descricao) VALUES
('Agendado'),
('Finalizado'),
('Cancelado');

-- Inserir dados na tabela usuario
INSERT INTO usuario (nome, cpf, numero, data_nascimento, data_inicio, ativo, senha) VALUES
('João Silva', '12345678900', '987654321', '1990-05-10', NOW(), 1, MD5('senhaUsuario1')),
('Maria Santos', '98765432100', '123456789', '1985-09-20', NOW(), 1, MD5('senhaUsuario2')),
('Pedro Souza', '45678912300', '555555555', '1995-12-03', NOW(), 1, MD5('senhaUsuario3')),
('Ana Oliveira', '78945612300', '111111111', '1992-08-15', NOW(), 1, MD5('senhaUsuario4')),
('Lucas Pereira', '65498732100', '222222222', '1988-03-25', NOW(), 1, MD5('senhaUsuario5')),
('Juliana Santos', '96385274100', '333333333', '1991-11-02', NOW(), 1, MD5('senhaUsuario6')),
('Rafael Souza', '25896314700', '444444444', '1987-07-09', NOW(), 1, MD5('senhaUsuario7')),
('Carolina Lima', '74185296300', '555555555', '1994-01-18', NOW(), 1, MD5('senhaUsuario8')),
('Pedro Silva', '36985214700', '666666666', '1990-06-30', NOW(), 1, MD5('senhaUsuario9')),
('Mariana Santos', '14725836900', '777777777', '1995-09-12', NOW(), 1, MD5('senhaUsuario10'));

-- Inserir dados na tabela paciente
INSERT INTO paciente (usuario_id, data_inicio, ativo) VALUES
(1, NOW(), 1),
(2, NOW(), 1),
(3, NOW(), 1);

-- Inserir dados na tabela medico
INSERT INTO medico (usuario_id, data_inicio, crm, ativo) VALUES
(4, NOW(), '12345/SP', 1),
(5, NOW(), '54321/RJ', 1),
(6, NOW(), '67890/DF', 1);

-- Inserir dados na tabela agendamento
INSERT INTO agendamento (medico_id, paciente_id, especialidade_id, tipo_consulta_id, status_id, data_agendada) VALUES
(1, 1, 1, 1, 1, '2023-05-25 10:00:00'),
(2, 2, 2, 1, 1, '2023-05-26 14:30:00'),
(3, 3, 3, 2, 1, '2023-05-27 09:45:00');

-- Inserir dados na tabela consulta
INSERT INTO consulta (agendamento_id, tipo_consulta_id, link_consulta) VALUES
(1, 1, 'https://exemplo.com/consulta/1'),
(2, 2, 'https://exemplo.com/consulta/2'),
(3, 1, 'https://exemplo.com/consulta/3');

INSERT INTO documento (tipo_documento_id, consulta_id, descricao, data_inclusao) VALUES
(1, 1, 'Atestado médico com afastamento de 5 dias', NOW()),
(2, 2, 'Realizar uma sessão de ioga 2 vezes por semana', NOW()),
(3, 3, 'Encaminhamento para um psicólogo organizacional', NOW());

-- Inserir dados na tabela exame
INSERT INTO exame (tipo_Exame_id, descriao) VALUES
(1, 'Eletroencefalograma Normal'),
(2, 'Tomografia Computadorizada do Crânio'),
(3, 'Ressonância magnética funcional');

-- Inserir dados na tabela receita
INSERT INTO receita (consulta_id) VALUES
(2);

-- Inserir dados na tabela item
INSERT INTO item (receita_id,tipo_medicamento_id, descricao) VALUES
(1, 2, 'Fluoxetina'),
(1, 2, 'Citalopram'),
(1, 2, 'Paroxetina');

-- Inserir dados na tabela alocacao_especialidade
INSERT INTO alocacao_especialidade (medico_id, espec_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela alocacao_tipo_consulta
INSERT INTO alocacao_tipo_consulta (medico_id, tipo_id) VALUES
(1, 1),
(2, 2),
(3, 1);

-- Inserir dados na tabela alocação_Exame
INSERT INTO alocação_Exame (consulta_id, exame_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela superAdmin
INSERT INTO superAdmin (usuario_id, data_inicio, ativo) VALUES
(7, NOW(), 1),
(8, NOW(), 1),
(9, NOW(), 1);