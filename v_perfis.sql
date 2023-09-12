CREATE VIEW v_perfis AS 
SELECT u.id AS 'usuario_id', u.nome AS 'nome', u.cpf AS 'cpf', p.id AS 'paciente_id', m.id AS 'medico_id', m.crm AS 'crm' FROM usuario u
LEFT JOIN medico m
ON u.id = m.usuario_id
LEFT JOIN paciente p
ON u.id = p.usuario_id;