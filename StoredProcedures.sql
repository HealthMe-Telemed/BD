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

DELIMITER //
CREATE PROCEDURE pInserirUsuarioeMedico(IN nomeUsuario VARCHAR(255), IN cpfUsuario VARCHAR(255), IN numeroUsuario VARCHAR(255), IN emailUsuario VARCHAR(100), IN dataNascimentoUsuario DATE, IN senhaUsuario VARCHAR(1000), IN medico tinyint(1), IN crmMedico VARCHAR(255))
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
        END IF;
        CALL pInserirUsuarioPerfisNovo(idUsuario);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE pInserirUsuarioPerfis()
BEGIN
	DECLARE usuarioId INT;
	DECLARE pacienteId INT;
	DECLARE medicoId INT;

	DECLARE existe_linhas INT DEFAULT 0;
	DECLARE cursorPerfis CURSOR FOR SELECT usuario_id, paciente_id, medico_id FROM v_perfis;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET existe_linhas=1;

	OPEN cursorPerfis;

	loop_perfis: LOOP
        FETCH cursorPerfis INTO usuarioId, pacienteId, medicoId;
        IF existe_linhas = 1 THEN
            LEAVE loop_perfis;
        END IF;

        -- Verifica se o campo que você deseja verificar é nulo
        IF pacienteId IS NOT NULL THEN
            -- Insere o registro na tabela de destino
            INSERT INTO alocacao_usuario_perfil(id_perfil, id_usuario) VALUES (1, usuarioId);
        END IF;
        IF medicoId IS NOT NULL THEN
            -- Insere o registro na tabela de destino
            INSERT INTO alocacao_usuario_perfil(id_perfil, id_usuario) VALUES (2, usuarioId);
        END IF;
    END LOOP;
    CLOSE cursorPerfis;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE pInserirUsuarioPerfisNovo(IN usuarioId INT)
BEGIN
	DECLARE pacienteId INT;
	DECLARE medicoId INT;    
	DECLARE existe_linhas INT DEFAULT 0;
	DECLARE cursorPerfis CURSOR FOR SELECT usuario_id, paciente_id, medico_id FROM v_perfis WHERE usuario_id = usuarioId;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET existe_linhas=1;

	OPEN cursorPerfis;

	loop_perfis: LOOP
        FETCH cursorPerfis INTO usuarioId, pacienteId, medicoId;
        IF existe_linhas = 1 THEN
            LEAVE loop_perfis;
        END IF;

        -- Verifica se o campo que você deseja verificar é nulo
        IF pacienteId IS NOT NULL THEN
            -- Insere o registro na tabela de destino
            INSERT INTO alocacao_usuario_perfil(id_perfil, id_usuario) VALUES (1, usuarioId);
        END IF;
        IF medicoId IS NOT NULL THEN
            -- Insere o registro na tabela de destino
            INSERT INTO alocacao_usuario_perfil(id_perfil, id_usuario) VALUES (2, usuarioId);
        END IF;
    END LOOP;
    CLOSE cursorPerfis;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE pVerificarHorariosDisponiveis(
	IN PacienteId INT,
    IN MedicoId INT,
    IN DataInicial DATETIME
)
BEGIN
    DECLARE IntervaloMinutos INT;
    DECLARE HoraInicio TIME;
    DECLARE HoraFim TIME;
    DECLARE DataHoraAtual DATETIME;
    DECLARE DataFinal DATETIME;
    
    SET IntervaloMinutos = 30;
    SET HoraInicio = '09:00:00';
    SET HoraFim = '18:00:00';

    -- Crie uma tabela temporária para armazenar os horários disponíveis
    CREATE TEMPORARY TABLE HorariosDisponiveis (DataHoraAgendamento DATETIME);

    -- Adicione 30 dias à data final
    SET DataFinal = DATE_ADD(DataInicial, INTERVAL 30 DAY);

    -- Inicialize a data e hora de início
    SET DataHoraAtual = DataInicial + HoraInicio;

    WHILE DataHoraAtual <= DataFinal DO
        -- Verifique se a hora atual está dentro do intervalo de trabalho
        IF CAST(DataHoraAtual AS TIME) >= HoraInicio AND CAST(DataHoraAtual AS TIME) < HoraFim THEN
            -- Verifique se a hora atual não está ocupada
            IF NOT EXISTS (
                SELECT 1
                FROM agendamento
                WHERE data_agendada = DataHoraAtual AND (medico_id = MedicoId OR paciente_id = PacienteId) AND status_id = 1
            ) THEN
                -- Insira o horário disponível na tabela temporária
                INSERT INTO HorariosDisponiveis (DataHoraAgendamento)
                VALUES (DataHoraAtual);
            END IF;
        END IF;

        -- Avance para a próxima meia hora
        SET DataHoraAtual = DATE_ADD(DataHoraAtual, INTERVAL IntervaloMinutos MINUTE);
    END WHILE;

    -- Selecione os horários disponíveis
    SELECT DataHoraAgendamento FROM HorariosDisponiveis;

    -- Exclua a tabela temporária
    DROP TEMPORARY TABLE HorariosDisponiveis;

END//

DELIMITER ;
