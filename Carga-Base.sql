INSERT INTO especialidade (id, descricao) VALUES
(1, 'Psicologia Organizacional'),
(2, 'Psicoterapia'),
(3, 'Neuropsicologia');

-- Inserir dados na tabela tipo_consulta
INSERT INTO tipo_consulta (id, descricao) VALUES
(1, 'Teleconsulta'),
(2, 'Realidade Virtual');

-- Inserir dados na tabela tipo_documento
INSERT INTO tipo_documento (id, descricao) VALUES
(1, 'Atestado'),
(2, 'Recomendacao'),
(3, 'Encaminhamento');

-- Inserir dados na tabela tipo_Exame
INSERT INTO tipo_Exame (id, descricao) VALUES
(1, 'Eletroencéfalograma (EEG)'),
(2, 'Tomografia Computadorizada (CT)'),
(3, 'Ressonância Magnética (RM)');

-- Inserir dados na tabela tipo_medicamento
INSERT INTO tipo_medicamento (id, descricao) VALUES
(1, 'Antidepressivos'),
(2, 'Estimulantes'),
(3, 'Antipsicóticos');

-- Inserir dados na tabela status
INSERT INTO status (id, descricao) VALUES
(1, 'Agendado'),
(2, 'Finalizado'),
(3, 'Cancelado');

-- Inserir dados na tabela usuario
INSERT INTO usuario (id, nome, cpf, numero, data_nascimento, data_inicio, ativo) VALUES
(1, 'João Silva', '12345678900', '987654321', '1990-05-10', NOW(), 1),
(2, 'Maria Santos', '98765432100', '123456789', '1985-09-20', NOW(), 1),
(3, 'Pedro Souza', '45678912300', '555555555', '1995-12-03', NOW(), 1),
(4, 'Ana Oliveira', '78945612300', '111111111', '1992-08-15', NOW(), 1),
(5, 'Lucas Pereira', '65498732100', '222222222', '1988-03-25', NOW(), 1),
(6, 'Juliana Santos', '96385274100', '333333333', '1991-11-02', NOW(), 1),
(7, 'Rafael Souza', '25896314700', '444444444', '1987-07-09', NOW(), 1),
(8, 'Carolina Lima', '74185296300', '555555555', '1994-01-18', NOW(), 1),
(9, 'Pedro Silva', '36985214700', '666666666', '1990-06-30', NOW(), 1),
(10, 'Mariana Santos', '14725836900', '777777777', '1995-09-12', NOW(), 1);

-- Inserir dados na tabela paciente
INSERT INTO paciente (id, usuario_id, data_inicio, ativo) VALUES
(1, 1, NOW(), 1),
(2, 2, NOW(), 1),
(3, 3, NOW(), 1);

-- Inserir dados na tabela medico
INSERT INTO medico (id, usuario_id, data_inicio, crm, ativo) VALUES
(1, 4, NOW(), '12345/SP', 1),
(2, 5, NOW(), '54321/RJ', 1),
(3, 6, NOW(), '67890/DF', 1);

-- Inserir dados na tabela agendamento
INSERT INTO agendamento (id, medico_id, paciente_id, especialidade_id, tipo_consulta_id, status_id, data_agendada) VALUES
(1, 1, 1, 1, 1, 1, '2023-05-25 10:00:00'),
(2, 2, 2, 2, 1, 1, '2023-05-26 14:30:00'),
(3, 3, 3, 3, 2, 1, '2023-05-27 09:45:00');

-- Inserir dados na tabela consulta
INSERT INTO consulta (id, agendamento_id, tipo_consulta_id, link_consulta) VALUES
(1, 1, 1, 'https://exemplo.com/consulta/1'),
(2, 2, 2, 'https://exemplo.com/consulta/2'),
(3, 3, 1, 'https://exemplo.com/consulta/3');

INSERT INTO documento (id, tipo_documento_id, consulta_id, descricao, data_inclusao) VALUES
(1, 1, 1, 'Atestado médico com afastamento de 5 dias', NOW()),
(2, 2, 2, 'Realizar uma sessão de ioga 2 vezes por semana', NOW()),
(3, 3, 3, 'Encaminhamento para um psicólogo organizacional', NOW());

-- Inserir dados na tabela exame
INSERT INTO exame (id, tipo_Exame_id, descriao) VALUES
(1, 1, 'Eletroencefalograma Normal'),
(2, 2, 'Tomografia Computadorizada do Crânio'),
(3, 3, 'Ressonância magnética funcional');

-- Inserir dados na tabela receita
INSERT INTO receita (id, consulta_id) VALUES
(1, 2);

-- Inserir dados na tabela item
INSERT INTO item (id, receita_id,tipo_medicamento_id, descricao) VALUES
(1, 1, 2, 'Fluoxetina'),
(2, 1, 2, 'Citalopram'),
(3, 1, 2, 'Paroxetina');

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
INSERT INTO superAdmin (id, usuario_id, data_inicio, ativo) VALUES
(1, 7, NOW(), 1),
(2, 8, NOW(), 1),
(3, 9, NOW(), 1);
