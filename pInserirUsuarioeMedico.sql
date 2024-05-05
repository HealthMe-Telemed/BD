DELIMITER //
CREATE PROCEDURE pInserirUsuarioeMedico(IN nomeUsuario VARCHAR(255), IN cpfUsuario VARCHAR(255), IN numeroUsuario VARCHAR(255), IN emailUsuario VARCHAR(100), IN dataNascimentoUsuario DATE, IN senhaUsuario VARCHAR(1000), IN medico tinyint(1), IN crmMedico VARCHAR(255), IN idEspecialidade INT)
BEGIN
	DECLARE cpfExistentes INT;
    DECLARE idUsuario INT;
    SELECT COUNT(*) INTO cpfExistentes FROM usuario WHERE cpf = cpfUsuario;
    IF cpfExistentes > 0 THEN
		-- Verifica se existe um CPF já cadastrado
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe um usuário com esse CPF';
    ELSE
        -- Caso contrário, insere o registro na tabela
        INSERT INTO usuario(nome, cpf, numero, data_nascimento, data_inicio, ativo, senha, email) VALUES (nomeUsuario, cpfUsuario, numeroUsuario, dataNascimentoUsuario, NOW(), 1, senhaUsuario, emailUsuario);
        SET idUsuario = LAST_INSERT_ID();
        INSERT INTO paciente(usuario_id, data_inicio, ativo) VALUES (idUsuario, NOW(), 1);
        IF medico = 1 THEN
            INSERT INTO medico(usuario_id, data_inicio, crm, ativo) VALUES (idUsuario, NOW(), crmMedico, 1);
            SET @idMedico = LAST_INSERT_ID();
            INSERT INTO alocacao_especialidade(medico_id, espec_id) VALUES (@idMedico, idEspecialidade);
        END IF;
        CALL pInserirUsuarioPerfisNovo(idUsuario);
    END IF;
END //
DELIMITER ;
