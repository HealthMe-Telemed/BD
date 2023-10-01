CREATE TABLE perfil(
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
)

CREATE TABLE alocacao_usuario_perfil(
    id_perfil INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY(id_perfil, id_usuario)
)

ALTER TABLE alocacao_usuario_perfil
    ADD CONSTRAINT FK_perfil_TO_alocacao_usuario_perfil
        FOREIGN KEY (id_perfil)
        REFERENCES perfil(id);

ALTER TABLE alocacao_usuario_perfil
    ADD CONSTRAINT FK_usuario_TO_alocacao_usuario_perfil
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id);


INSERT INTO TABLE perfil(descriao) VALUES ('Paciente'), ('Medico'), ('Administrador')