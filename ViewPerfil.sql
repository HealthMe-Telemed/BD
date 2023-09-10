create view v_perfis as 
SELECT u.id AS 'usuario_id', u.nome AS 'nome', u.cpf AS 'cpf', p.id AS 'paciente_id', m.id AS 'medico_id', m.crm AS 'crm' FROM usuario u
left JOIN medico m
ON u.id = m.usuario_id
left JOIN paciente p
ON u.id = p.usuario_id;