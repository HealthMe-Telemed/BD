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
