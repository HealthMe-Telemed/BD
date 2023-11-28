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