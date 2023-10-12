DELIMITER //
CREATE PROCEDURE pInserirUsuario(IN nomeUsuario VARCHAR(255), IN cpfUsuario VARCHAR(255), IN numeroUsuario VARCHAR(255), IN emailUsuario VARCHAR(100), IN dataNascimentoUsuario DATE, IN senhaUsuario VARCHAR(1000))
BEGIN
	DECLARE cpfExistentes INT;
    SELECT COUNT(*) INTO cpfExistentes FROM usuario WHERE cpf = cpfUsuario;
    IF cpfExistentes > 0 THEN
		-- Verifica se existe um CPF já cadastrado
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe um usuário com esse CPF';
    ELSE
        -- Caso contrário, insere o registro na tabela
        INSERT INTO usuario(nome, cpf, numero, data_nascimento, data_inicio, ativo, senha, email) VALUES (nomeUsuario, cpfUsuario, numeroUsuario, dataNascimentoUsuario, NOW(), 1, senhaUsuario, emailUsuario);
    END IF;
END //
DELIMITER ;
