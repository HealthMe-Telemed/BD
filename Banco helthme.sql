
CREATE TABLE agendamento
(
  id               INT      NOT NULL,
  medico_id        INT      NOT NULL,
  paciente_id      INT      NOT NULL,
  especialidade_id INT      NOT NULL,
  tipo_consulta_id INT      NOT NULL,
  status_id        INT      NOT NULL,
  data_agendada    DATETIME NOT NULL,
  data_conclusao   DATETIME NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE alocacao_especialidade
(
  medico_id INT NOT NULL,
  espec_id  INT NOT NULL,
  PRIMARY KEY (medico_id, espec_id)
);

CREATE TABLE alocacao_tipo_consulta
(
  medico_id INT NOT NULL,
  tipo_id   INT NOT NULL,
  PRIMARY KEY (medico_id, tipo_id)
);

CREATE TABLE alocação_Exame
(
  consulta_id INT NOT NULL,
  exame_id    INT NOT NULL,
  PRIMARY KEY (consulta_id, exame_id)
);

CREATE TABLE consulta
(
  id               INT          NOT NULL,
  agendamento_id   INT          NOT NULL,
  tipo_consulta_id INT          NOT NULL,
  documento_id     INT          NOT NULL,
  link_consulta    VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE documento
(
  id                INT          NOT NULL,
  tipo_documento_id INT          NOT NULL,
  descricao         VARCHAR(255) NULL    ,
  data_inclusao     DATETIME     NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE especialidade
(
  id        INT          NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE exame
(
  id             INT          NOT NULL,
  medicamento_id INT          NOT NULL,
  descriao       VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE item
(
  id                  INT          NOT NULL,
  tipo_medicamento_id INT          NOT NULL,
  descricao           VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE medico
(
  id          INT          NOT NULL,
  usuario_id  INT          NOT NULL,
  data_fim    DATETIME     NULL    ,
  data_inicio DATETIME     NOT NULL,
  crm         VARCHAR(255) NULL    ,
  crp         VARCHAR(255) NULL    ,
  ativo       BOOL         NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE paciente
(
  id          INT      NOT NULL,
  usuario_id  INT      NOT NULL,
  data_fim    DATETIME NULL    ,
  data_inicio DATETIME NOT NULL,
  ativo       BOOL     NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE receita
(
  id          INT NOT NULL,
  item_id     INT NOT NULL,
  consulta_id INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE status
(
  id        INT          NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE superAdmin
(
  id          INT      NOT NULL,
  usuario_id  INT      NOT NULL,
  data_inicio DATETIME NOT NULL,
  data_fim    DATETIME NULL    ,
  ativo       BOOL     NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tipo_consulta
(
  id        INT          NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tipo_consulta
(
  id        INT          NOT NULL,
  descrição VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE tipo_documento
(
  id        INT          NOT NULL,
  descricao VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE tipo_Exame
(
  id        INT          NOT NULL,
  descricao VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE tipo_medicamento
(
  id        INT          NOT NULL,
  descricao VARCHAR(255) NULL    ,
  PRIMARY KEY (id)
);

CREATE TABLE usuario
(
  id              INT          NOT NULL,
  nome            VARCHAR(255) NOT NULL,
  cpf             VARCHAR(255) NOT NULL,
  numero          VARCHAR(255) NOT NULL,
  data_nascimento DATE         NOT NULL,
  data_inicio     DATETIME     NOT NULL,
  data_fim        DATETIME     NULL    ,
  ativo           BOOL         NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE superAdmin
  ADD CONSTRAINT FK_usuario_TO_superAdmin
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id);

ALTER TABLE paciente
  ADD CONSTRAINT FK_usuario_TO_paciente
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id);

ALTER TABLE medico
  ADD CONSTRAINT FK_usuario_TO_medico
    FOREIGN KEY (usuario_id)
    REFERENCES usuario (id);

ALTER TABLE alocacao_especialidade
  ADD CONSTRAINT FK_especialidade_TO_alocacao_especialidade
    FOREIGN KEY (espec_id)
    REFERENCES especialidade (id);

ALTER TABLE alocacao_tipo_consulta
  ADD CONSTRAINT FK_tipo_consulta_TO_alocacao_tipo_consulta
    FOREIGN KEY (tipo_id)
    REFERENCES tipo_consulta (id);

ALTER TABLE alocacao_especialidade
  ADD CONSTRAINT FK_medico_TO_alocacao_especialidade
    FOREIGN KEY (medico_id)
    REFERENCES medico (id);

ALTER TABLE alocacao_tipo_consulta
  ADD CONSTRAINT FK_medico_TO_alocacao_tipo_consulta
    FOREIGN KEY (medico_id)
    REFERENCES medico (id);

ALTER TABLE agendamento
  ADD CONSTRAINT FK_medico_TO_agendamento
    FOREIGN KEY (medico_id)
    REFERENCES medico (id);

ALTER TABLE agendamento
  ADD CONSTRAINT FK_paciente_TO_agendamento
    FOREIGN KEY (paciente_id)
    REFERENCES paciente (id);

ALTER TABLE agendamento
  ADD CONSTRAINT FK_tipo_consulta_TO_agendamento
    FOREIGN KEY (tipo_consulta_id)
    REFERENCES tipo_consulta (id);

ALTER TABLE agendamento
  ADD CONSTRAINT FK_especialidade_TO_agendamento
    FOREIGN KEY (especialidade_id)
    REFERENCES especialidade (id);

ALTER TABLE agendamento
  ADD CONSTRAINT FK_status_TO_agendamento
    FOREIGN KEY (status_id)
    REFERENCES status (id);

ALTER TABLE exame
  ADD CONSTRAINT FK_tipo_Exame_TO_exame
    FOREIGN KEY (medicamento_id)
    REFERENCES tipo_Exame (id);

ALTER TABLE alocação_Exame
  ADD CONSTRAINT FK_consulta_TO_alocação_Exame
    FOREIGN KEY (consulta_id)
    REFERENCES consulta (id);

ALTER TABLE alocação_Exame
  ADD CONSTRAINT FK_exame_TO_alocação_Exame
    FOREIGN KEY (exame_id)
    REFERENCES exame (id);

ALTER TABLE item
  ADD CONSTRAINT FK_tipo_medicamento_TO_item
    FOREIGN KEY (tipo_medicamento_id)
    REFERENCES tipo_medicamento (id);

ALTER TABLE consulta
  ADD CONSTRAINT FK_agendamento_TO_consulta
    FOREIGN KEY (agendamento_id)
    REFERENCES agendamento (id);

ALTER TABLE receita
  ADD CONSTRAINT FK_item_TO_receita
    FOREIGN KEY (item_id)
    REFERENCES item (id);

ALTER TABLE receita
  ADD CONSTRAINT FK_consulta_TO_receita
    FOREIGN KEY (consulta_id)
    REFERENCES consulta (id);

ALTER TABLE consulta
  ADD CONSTRAINT FK_tipo_consulta_TO_consulta
    FOREIGN KEY (tipo_consulta_id)
    REFERENCES tipo_consulta (id);

ALTER TABLE documento
  ADD CONSTRAINT FK_tipo_documento_TO_documento
    FOREIGN KEY (tipo_documento_id)
    REFERENCES tipo_documento (id);

ALTER TABLE consulta
  ADD CONSTRAINT FK_documento_TO_consulta
    FOREIGN KEY (documento_id)
    REFERENCES documento (id);
