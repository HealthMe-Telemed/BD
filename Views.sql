CREATE VIEW v_medico AS
SELECT m.id AS 'Id', u.nome AS 'Nome', m.crm AS 'CRM', m.crp AS 'CRP' FROM medico m
INNER JOIN usuario u
ON u.id = m.usuario_id;

CREATE VIEW v_paciente AS
SELECT p.id AS 'IdPaciente', u.id AS 'IdUsuario', u.nome AS 'Nome', u.cpf AS 'CPF', u.data_nascimento AS 'DataNascimento' FROM paciente p
INNER JOIN usuario u
ON u.id = p.usuario_id;

CREATE VIEW v_perfis AS 
SELECT u.id AS 'usuario_id', u.nome AS 'nome', u.cpf AS 'cpf', p.id AS 'paciente_id', m.id AS 'medico_id', m.crm AS 'crm' FROM usuario u
LEFT JOIN medico m
ON u.id = m.usuario_id
LEFT JOIN paciente p
ON u.id = p.usuario_id;