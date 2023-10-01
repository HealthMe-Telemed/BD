CREATE VIEW v_medico AS
SELECT m.id AS 'Id', u.nome AS 'Nome', m.crm AS 'CRM', m.crp AS 'CRP' FROM medico m
INNER JOIN usuario u
ON u.id = m.usuario_id;