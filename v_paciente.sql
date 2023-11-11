CREATE VIEW v_paciente AS
SELECT p.id AS 'IdPaciente', u.id AS 'IdUsuario', u.nome AS 'Nome', u.cpf AS 'CPF', u.data_nascimento AS 'DataNascimento' FROM paciente p
INNER JOIN usuario u
ON u.id = p.usuario_id;